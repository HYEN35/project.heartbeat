package kr.heartbeat.music.persistence;

import kr.heartbeat.vo.MusicVO;
import kr.heartbeat.vo.PlaylistDTO;

import java.util.List;

public interface MusicPersistence {
	// 해시태그 IDs를 기반으로 음악 리스트를 가져오는 메서드
	List<MusicVO> findMusicByHashtags(List<Integer> hashtagIds);

	List<MusicVO> findAllMusic();

	List<PlaylistDTO> findAllMusicAjax(List<String> hashtags);
}
