package kr.heartbeat.music.persistence;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import kr.heartbeat.vo.SongVO;

@Repository
public class SongPersistenceImpl implements SongPersistence {
	private final SongMapper songMapper;
	
	// @Inject를 사용하여 SongMapper를 주입
    @Inject
    public SongPersistenceImpl(SongMapper songMapper) {
        this.songMapper = songMapper;
    }
    
    @Override
    public void saveSong(SongVO songVO) {
        songMapper.insertSong(songVO);  // MyBatis Mapper 호출
    }

	@Override
	public List<SongVO> getSongByTrackId(String spotify_id) {
		return songMapper.selectSongBySpotifyId(spotify_id);  // MyBatis Mapper 호출
	}
}
