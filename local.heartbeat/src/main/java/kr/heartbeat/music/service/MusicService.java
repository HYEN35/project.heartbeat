package kr.heartbeat.music.service;

import java.util.List;
import java.util.Map;

import kr.heartbeat.vo.PlaylistDTO;
import org.springframework.stereotype.Service;

import kr.heartbeat.vo.MusicVO;

@Service
public interface MusicService {
	// 해시태그 IDs를 기반으로 음악 리스트를 가져오는 메서드
	List<MusicVO> getMusicListByHashtags(List<Integer> hashtagIds);

	List<MusicVO> findAllMusic();

	List<PlaylistDTO> findAllMusicAjax(List<String> hashtags);

}
