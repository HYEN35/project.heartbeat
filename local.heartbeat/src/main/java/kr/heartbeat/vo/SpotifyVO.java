package kr.heartbeat.vo;

import com.wrapper.spotify.model_objects.specification.Artist;
import lombok.Data;

import java.util.List;

@Data
public class SpotifyVO {
	private int music_id;
	private List<Artist> artist_name;
	private String music_name;
	private String album_name;
	private String track_uri;
}
