package kr.heartbeat.music.persistence;

import java.util.List;

import kr.heartbeat.vo.SongVO;

public interface SongPersistence {
	void saveSong(SongVO songVO);
	List<SongVO> getSongByTrackId(String spotify_id);
}
