package kr.heartbeat.music.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonObject;
import com.wrapper.spotify.SpotifyApi;
import com.wrapper.spotify.model_objects.specification.Track;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.wrapper.spotify.model_objects.specification.AlbumSimplified;
import com.wrapper.spotify.model_objects.specification.Paging;

import kr.heartbeat.music.config.SpotifyAPI;
import kr.heartbeat.music.service.SpotifyService;
import kr.heartbeat.vo.MusicVO;

import javax.servlet.http.HttpServletResponse;

@Controller
public class SpotifyController {
	@Autowired
    private SpotifyService spotifyService;
	
	@Autowired
	private SpotifyAPI spotifyAPI; // SpotifyAPI 클래스의 인스턴스를 생성

    @Autowired
    private SqlSession sqlSession;

    @RequestMapping(value = "/saveMusicData", method = RequestMethod.GET)
    public String saveMusicData(String query) {
        // 음악 데이터를 저장
        spotifyService.saveMusicData(query);
        return "redirect:/musicList";
    }

    @ResponseBody
    @GetMapping("/spotify/search")
    public String searchTrack(@RequestParam("query") String query, HttpServletResponse response) {
        response.setContentType("application/json; charset=UTF-8");
        return spotifyService.searchTracks(query);
    }
}
