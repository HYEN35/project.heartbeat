package kr.heartbeat.music.persistence;

import kr.heartbeat.vo.MusicVO;
import kr.heartbeat.vo.PlaylistDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MusicPersistenceImpl implements MusicPersistence{
	@Autowired
	private SqlSession sqlSession;

	private static final String namespace = "kr.heartbeat.mappers.music";

	@Override
	public List<MusicVO> findMusicByHashtags(List<Integer> hashtagIds) {
		return sqlSession.selectList(namespace + ".findMusicByHashtags", hashtagIds);
	}

	public List<MusicVO> findAllMusic(){
		return sqlSession.selectList(namespace + ".findAllMusic");
	}

	public List<PlaylistDTO> findAllMusicAjax(List<String> hashtags){
		return sqlSession.selectList(namespace + ".findAllMusicAjax");
	}
}
