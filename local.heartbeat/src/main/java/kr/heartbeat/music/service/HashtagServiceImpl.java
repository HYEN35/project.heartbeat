package kr.heartbeat.music.service;

import java.util.List;

import kr.heartbeat.music.persistence.HashtagPersistence;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.heartbeat.vo.HashtagVO;

@Service
public class HashtagServiceImpl implements HashtagService {

	@Autowired
    private SqlSession sqlSession;

    @Autowired
    private HashtagPersistence hashtagPersistence;

}
