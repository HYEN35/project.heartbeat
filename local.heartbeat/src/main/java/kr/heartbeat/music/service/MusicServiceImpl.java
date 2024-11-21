package kr.heartbeat.music.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.heartbeat.music.persistence.HashtagPersistence;
import kr.heartbeat.music.persistence.MusicPersistence;
import kr.heartbeat.vo.PlaylistDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.heartbeat.vo.MusicVO;

@Service
public class MusicServiceImpl implements MusicService {

	@Autowired
    private SqlSession sqlSession;

    @Autowired
    private MusicPersistence musicPersistence;

    @Override
    // Persistence에서 음악 리스트 조회
    public List<MusicVO> getMusicListByHashtags(List<Integer> hashtagIds) {
        return musicPersistence.findMusicByHashtags(hashtagIds);
    }

    @Override
    public List<MusicVO> findAllMusic(){
        return musicPersistence.findAllMusic();
    }

    @Override
    public List<PlaylistDTO> findAllMusicAjax(List<String> hashtags){
        return musicPersistence.findAllMusicAjax(hashtags);
    }
}
