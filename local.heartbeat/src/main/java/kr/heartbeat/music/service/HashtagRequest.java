package kr.heartbeat.music.service;

import lombok.Data;

import java.util.List;

@Data
public class HashtagRequest {
	private List<Integer> hashtagIds;
}
