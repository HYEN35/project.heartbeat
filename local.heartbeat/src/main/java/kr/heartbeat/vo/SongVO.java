package kr.heartbeat.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SongVO {
	private int id;
	private String spotify_id;
	private String title;
	private String artist;
	private String album;
	private String hashtag;
	private Timestamp created_at;
}
