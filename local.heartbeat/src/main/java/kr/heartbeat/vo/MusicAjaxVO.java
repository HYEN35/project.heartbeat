package kr.heartbeat.vo;

import lombok.Data;

@Data
public class MusicAjaxVO {
	private int music_id;
	private int artistId;
	private String artist_id;
	private String music_name;
	private String track;
	private String playtime;
	private String artistName;
}
