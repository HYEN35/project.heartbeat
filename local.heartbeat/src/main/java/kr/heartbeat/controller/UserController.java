package kr.heartbeat.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.heartbeat.service.UserServiceImpl;
import kr.heartbeat.vo.UserVO;

@Controller
public class UserController {
	
	@Inject
	private UserServiceImpl userServiceImpl;
	
		//이메일 중복확인
		@PostMapping("/join/emailcheck")
		@ResponseBody
		public String idCheck(HttpServletRequest request) throws Exception {
			String email = request.getParameter("email");
			UserVO userVO = userServiceImpl.idCheck(email);
			String result = null;
	
			if (userVO != null) result = "success"; 	
			
			return result;
		}
		//전화번호 중복확인
		@PostMapping("/join/phonecheck")
		@ResponseBody
		public String phoneCheck(HttpServletRequest request) throws Exception {
			String phone = request.getParameter("phone");
			UserVO userVO = userServiceImpl.phoneCheck(phone);
			String result = null;
			
			if (userVO != null) result = "success"; 	
			
			return result;
		}
		//닉네임 중복확인
		@PostMapping("/join/nicknamecheck")
		@ResponseBody
		public String nicknameCheck(HttpServletRequest request) throws Exception {
			
			String nickname = request.getParameter("nickname");
			UserVO userVO = userServiceImpl.nicknameCheck(nickname);
			String result = null;
			
			if (userVO != null) result = "success"; 
			
			return result;
		}
		
		//회원가입
		@PostMapping("/join")
		public String insertUser(UserVO userVO) {
			System.out.println("========== Presentaion member email(id) : "+userVO.getEmail());
			System.out.println("========== Presentaion member getBirth : "+userVO.getBirth());
			
			String url = null;
			int result = userServiceImpl.insertUser(userVO);
			if(result == 1) { //회원가입 성공
				url ="/heartbeat/login";
			} else { //회원가입 실패
				url = "/heartbeat/join";
			}
			return url;
		}
		

		//로그인 
		@PostMapping("/login")
		public String login(UserVO userVO, HttpSession session, RedirectAttributes rttr) {
			UserVO dbuserVO = userServiceImpl.login(userVO);
			
			String url = null;
			
			if(dbuserVO != null) {
				if(userVO.getPwd().equals(dbuserVO.getPwd())) {
					session.setAttribute("UserVO", dbuserVO); //session에 dbuserVO 저장
					url = "redirect:/chart";
				} else {
					session.setAttribute("user", null);
					rttr.addFlashAttribute("pwd", false);
					url = "redirect:/login";
				}
			} else {
				session.setAttribute("user", null);
				rttr.addFlashAttribute("email", false);
				url = "redirect:/login";
			}
			
			return url;
		}
		
		//아이디 찾기
		@PostMapping("/login/findId")
		@ResponseBody //@ResponseBody를 사용하면 model 객체를 쓸 수 없다.
		public HashMap<String,Object> findId(HttpServletRequest request) {
		// HashMap을 사용할 때 @ResponseBody로 반환되는 객체를 JSON으로 변환하려면 jackson-databind를 pom.xml에 의존성 주입을 해야 한다.
			String name = request.getParameter("name");
			String birth = request.getParameter("birth");
			String phone = request.getParameter("phone");
			
			UserVO userVO = userServiceImpl.findId(name, birth, phone);
			HashMap<String, Object> response = new HashMap<String, Object>();
			
			if(userVO != null) {
				response.put("result", "success");
				response.put("email", userVO.getEmail());
			}

			return response;
		}
		
		//비밀번호 찾기
		@PostMapping("/login/findPwd")
		@ResponseBody
		public HashMap<String, Object> findPwd(HttpServletRequest request) {
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String birth = request.getParameter("birth");
			
			UserVO userVO = userServiceImpl.findPwd(email, name, birth);
			HashMap<String, Object> response = new HashMap<String, Object>();
			
			System.out.println("========== Presentaion member getPwd : "+userVO.getPwd());
			
			if(userVO != null) {
				response.put("result", "success");
				response.put("pwd", userVO.getPwd());
			}
			return response;
		}
		
		//로그아웃
		@GetMapping("/logout")
		public String logout(HttpSession session) throws Exception {
			session.invalidate();
			return "redirect:/login";
		}		
		
		// 마이페이지 - 정보 변경
		@PostMapping("/mypage/modify")
		public String modify(@RequestParam("newPwd") String newPwd, UserVO userVO, HttpSession session) {
			UserVO uvo = (UserVO) session.getAttribute("user");	//세션에서 user 데이터 불러와서 email 값을 전달해야 한다.
		    userVO.setEmail(uvo.getEmail());
		   
		    System.out.println("========== 정보수정 Presentaion member newPwd : "+newPwd);
		    System.out.println("========== 정보수정 Presentaion member user nickname : "+userVO.getNickname());
		    
	        userServiceImpl.modify(newPwd, userVO);
	       
	        uvo.setNickname(userVO.getNickname());  // 세션에 저장된 user 객체의 닉네임 업데이트
	        session.setAttribute("user", uvo);  
	        
		    return "redirect:/mypage";
		}
		
		//마이페이지 - 탈퇴
		@PostMapping("mypage/delete")
		public String delete(UserVO userVO, HttpSession session) {
			String email = userVO.getEmail(); //폼에서 입력받은 이메일
			String pwd = userVO.getPwd(); //폼에서 입력받은 비밀번호
			String url = null;
			UserVO uvo = (UserVO) session.getAttribute("user");
			
			if(email.equals(uvo.getEmail()) && pwd.equals(uvo.getPwd())) {
				userServiceImpl.delete(uvo);
				url="redirect:/login";
			} else {
				url="redirect:/mypage";
			}
								
			return url;
		}
		
		//마이페이지 - 멤버쉽 변경(level)
		@PostMapping("mypage/membership")
		public String membership(UserVO userVO, HttpSession session) {
			UserVO uvo = (UserVO) session.getAttribute("user");	
		    userVO.setEmail(uvo.getEmail());
			System.out.println("========== 멤버쉽 Presentaion member level : "+userVO.getLevel());
			
			userServiceImpl.membership(userVO);
			
			uvo.setLevel(userVO.getLevel());
			session.setAttribute("user", uvo);  
			
			return "redirect:/mypage";
		}

	
}
