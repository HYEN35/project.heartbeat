package kr.heartbeat.music.controller;

import org.apache.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.heartbeat.music.service.SongService;
import kr.heartbeat.vo.SongVO;

@RestController
@RequestMapping("/songs")
public class SongController {
	private final SongService songService;

    public SongController(SongService songService) {
        this.songService = songService;
    }

    // GET 메서드 처리
    @GetMapping("/{spotifyId}")
    public ResponseEntity<SongVO> getSongBySpotifyId(@PathVariable String spotify_id) {
        SongVO songVO = songService.getSongBySpotifyId(spotify_id);
        if (songVO != null) {
            return ResponseEntity.ok(songVO);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // POST 메서드 처리 (예: 곡 저장)
    @PostMapping
    public ResponseEntity<Void> addSong(@RequestBody SongVO songVO) {
    	System.out.println("Received SongVO: " + songVO);
    	if (songVO.getSpotify_id() == null || songVO.getSpotify_id().isEmpty()) {
            throw new IllegalArgumentException("Spotify ID cannot be null");
        }
        songService.addSong(songVO);
        return ResponseEntity.ok().build();
    }
    
    @PostMapping("/add")
    public String addSong(@RequestParam String spotify_id) {
        try {
            // Spotify에서 곡 정보 가져와서 DB에 저장
            songService.fetchAndSaveSong(spotify_id);
            return "곡 정보가 성공적으로 저장되었습니다.";
        } catch (Exception e) {
            return "곡 정보 저장에 실패했습니다: " + e.getMessage();
        }
    }
    
    @PostMapping("/save")
    public ResponseEntity<String> saveSong(@RequestParam String spotify_id) {
        try {
            songService.fetchAndSaveSong(spotify_id);
            return ResponseEntity.ok("Song saved successfully!");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.SC_INTERNAL_SERVER_ERROR).body("Error saving song.");
        }
    }
}
