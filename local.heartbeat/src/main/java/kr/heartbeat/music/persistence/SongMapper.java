package kr.heartbeat.music.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.heartbeat.vo.SongVO;

@Mapper
public interface SongMapper {
	// DB에 노래 저장
	void insertSong(SongVO songVO);

	// spotify_id로 곡 조회 (여러 개의 결과를 반환할 수 있게 변경)
    List<SongVO> selectSongBySpotifyId(String spotify_id);
    
    // 해시태그로 노래 목록 조회
    List<SongVO> selectSongsByHashtags(List<String> hashtags);
}
