package kr.heartbeat.music.service;


import java.io.IOException;
import java.net.URISyntaxException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wrapper.spotify.SpotifyApi;
import com.wrapper.spotify.exceptions.SpotifyWebApiException;
import com.wrapper.spotify.model_objects.specification.Track;
import com.wrapper.spotify.requests.data.tracks.GetTrackRequest;

import kr.heartbeat.music.persistence.SongMapper;
import kr.heartbeat.vo.SongVO;

@Service
public class SongService {
	private final SpotifyApi spotifyApi;
	private final SongMapper songMapper;
	
	@Autowired
    public SongService(SpotifyApi spotifyApi, SongMapper songMapper) {
        this.spotifyApi = spotifyApi;
        this.songMapper = songMapper;
    }
	
	// Spotify API에서 곡 정보를 가져오는 메서드
    public SongVO getSongDetails(String spotify_id) throws IOException, SpotifyWebApiException {
        // 트랙 정보를 가져오는 요청을 보냄
        GetTrackRequest getTrackRequest = spotifyApi.getTrack(spotify_id).build();
        Track track = getTrackRequest.execute();

        // 곡 정보를 Song 객체에 저장
        SongVO songVO = new SongVO();
        songVO.setSpotify_id(track.getId());
        songVO.setTitle(track.getName());
        songVO.setArtist(track.getArtists()[0].getName()); // 첫 번째 아티스트
        songVO.setAlbum(track.getAlbum().getName());
        songVO.setHashtag("exampleHashtag");  // 예시 해시태그

        return songVO;
    }
    
    // Spotify ID로 곡 정보를 가져오는 메서드
    public SongVO getSongBySpotifyId(String spotify_id) {
        List<SongVO> songs = songMapper.selectSongBySpotifyId(spotify_id); // 여기서 selectSongBySpotifyId 호출
        if (songs.size() > 1) {
            throw new IllegalStateException("Multiple songs found for the given spotify_id");
        }
        return songs.isEmpty() ? null : songs.get(0);
    }
    
    // SongVO를 DB에 삽입
    public void addSong(SongVO songVO) {
    	songVO.setSpotify_id(songVO.getSpotify_id());
    	songVO.setTitle(songVO.getTitle());
    	songVO.setArtist(songVO.getArtist());
    	songVO.setAlbum(songVO.getAlbum());
    	songVO.setHashtag(songVO.getHashtag());
    	songVO.setCreated_at(songVO.getCreated_at());
    	
    	if (songVO.getSpotify_id() == null || songVO.getSpotify_id().isEmpty()) {
            throw new IllegalArgumentException("Spotify ID cannot be null");
        }
    	
    	songMapper.insertSong(songVO);
    }
    
    public List<SongVO> getSongsByHashtags(List<String> hashtags) {
        return songMapper.selectSongsByHashtags(hashtags);
    }
    
    // Spotify에서 곡 정보 가져와서 DB에 저장하는 메서드
    public void fetchAndSaveSong(String spotify_id) throws IOException {
        // 1. Spotify에서 곡 정보 가져오기
		SongVO songVO = getSongBySpotifyId(spotify_id);

		// 2. DB에 곡 정보 저장하기
		addSong(songVO);
    }
}
