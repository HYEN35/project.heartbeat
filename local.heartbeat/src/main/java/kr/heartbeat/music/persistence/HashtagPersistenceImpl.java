package kr.heartbeat.music.persistence;

import java.util.List;

import kr.heartbeat.music.service.HashtagService;
import kr.heartbeat.vo.HashtagVO;
import kr.heartbeat.vo.MusicVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

@Repository
public class HashtagPersistenceImpl implements HashtagPersistence {

	@Autowired
	private SqlSession sqlSession;

	private static final String namespace="kr.heartbeat.mappers.hashtag";


}
