package kr.heartbeat.music.service;

import java.util.List;

import com.google.gson.JsonObject;
import com.wrapper.spotify.model_objects.specification.Track;
import org.springframework.stereotype.Service;

import com.wrapper.spotify.model_objects.specification.AlbumSimplified;

import kr.heartbeat.vo.MusicVO;

@Service
public interface SpotifyService {
	String searchTracks(String query);

	void saveMusicData(String query);
}
