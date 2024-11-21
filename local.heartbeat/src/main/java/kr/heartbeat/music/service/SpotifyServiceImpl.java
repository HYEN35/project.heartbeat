package kr.heartbeat.music.service;

import com.wrapper.spotify.model_objects.specification.AlbumSimplified;

import com.wrapper.spotify.model_objects.specification.Paging;
import com.wrapper.spotify.model_objects.specification.Track;
import kr.heartbeat.music.persistence.HashtagPersistence;
import kr.heartbeat.music.persistence.MusicPersistence;
import kr.heartbeat.vo.MusicVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.heartbeat.music.config.SpotifyAPI;
import kr.heartbeat.music.persistence.SpotifyPersistence;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SpotifyServiceImpl implements SpotifyService {

	@Autowired
    private SpotifyAPI spotifyAPI;

    @Autowired
    private SpotifyPersistence spotifyPersistence;

	@Autowired
    private HashtagPersistence hashtagPersistence;

	@Autowired
	private MusicPersistence musicPersistence;

	@Autowired
	private SqlSession sqlSession;


	//음악검색
	@Override
	public String searchTracks(String query) {
		String token = spotifyAPI.getAccessToken();
		String url = "https://api.spotify.com/v1/search?q=" + query + "&type=track";

		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
		headers.add("Authorization", "Bearer " + token);

		org.springframework.http.HttpEntity<String> request = new org.springframework.http.HttpEntity<>(headers);

		RestTemplate restTemplate = new RestTemplate();
		return restTemplate.exchange(url, org.springframework.http.HttpMethod.GET, request, String.class).getBody();
	}

   @Override
   public void saveMusicData(String query) {
		// Spotify에서 음악 데이터 가져오기
		Paging<AlbumSimplified> tracks = spotifyAPI.getAlbumsFromSpotify(query);

		if (tracks != null) {
		    for (AlbumSimplified track : tracks.getItems()) {
		        MusicVO musicVO = new MusicVO();
		        musicVO.setMusic_name(track.getName());

		        // track.getArtists()는 String 배열이므로 String 값을 전달
		        if (track.getArtists() != null && track.getArtists().length > 0) {
		            musicVO.setArtist_id(track.getArtists()[0].getId());
		        }

		        musicVO.setTrack(track.getHref());

		        // music_tbl에 저장
		        spotifyPersistence.insertMusicData(musicVO);
		    }
		}
	}
}
