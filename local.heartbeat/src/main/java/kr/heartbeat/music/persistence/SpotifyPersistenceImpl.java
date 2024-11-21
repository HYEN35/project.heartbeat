package kr.heartbeat.music.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.heartbeat.vo.MusicVO;

@Repository
public class SpotifyPersistenceImpl implements SpotifyPersistence {
	@Autowired
    private SqlSession sqlSession;
	private SpotifyPersistence spotifyPersistence;

    @Override
    public void insertMusicData(MusicVO musicVO) {
        sqlSession.insert("MusicMapper.insertMusicData", musicVO);
    }
}
