package kr.heartbeat.persistence;

import kr.heartbeat.vo.UserVO;

public interface UserPersistence {
	//중복확인
	public UserVO idCheck(String email);
	public UserVO phoneCheck(String phone);
	public UserVO nicknameCheck(String nickname);
	
	//회원가입
	public int insertUser(UserVO userVO);
	
	//로그인
	public UserVO login(UserVO userVO);
	//아이디찾기
	public UserVO findId(String name, String birth, String phone);
	//비밀번호 찾기
	public UserVO findPwd(String email, String name, String birth);
	
	//회원수정
	public void modify(String newPwd, UserVO userVO);
	//멤버쉽 수정(level)
	public void membership(UserVO userVO);
	//회원 탈퇴
	public void delete(UserVO uvo);
}
