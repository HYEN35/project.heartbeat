package kr.heartbeat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "index"; 
	}  
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute("pageName", "로그인 - HeartBeat");
		return "heartbeat/login";
	}  
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Model model) {
		model.addAttribute("pageName", "회원가입 - HeartBeat");
		return "heartbeat/join"; 
	}  

	@RequestMapping(value="/chart", method = RequestMethod.GET)
	public String chart(Model model) {
		model.addAttribute("pageName", "차트 - HeartBeat");
		model.addAttribute("pageTitle", "차트");
		return "heartbeat/chart"; 
	} 
	
	@RequestMapping(value="/playlist", method = RequestMethod.GET)
	public String playlist(Model model) {
		model.addAttribute("pageName", "플레이리스트 - HeartBeat");
		model.addAttribute("pageTitle", "플레이리스트");
		return "heartbeat/playlist"; 
	} 
	
	@RequestMapping(value="/community", method = RequestMethod.GET)
	public String community(Model model) {
		model.addAttribute("pageName", "커뮤니티 - HeartBeat");
		model.addAttribute("pageTitle", "커뮤니티");
		return "community/community"; 
	} 
	
	@RequestMapping(value="/membership", method = RequestMethod.GET)
	public String membership(Model model) {
		model.addAttribute("pageName", "멤버십 - HeartBeat");
		model.addAttribute("pageTitle", "멤버십");
		return "heartbeat/membership"; 
	} 
	
	@RequestMapping(value="/mypage", method = RequestMethod.GET) 
	 public String mypage(Model model) {
		 model.addAttribute("pageName", "마이페이지 - HeartBeat");
		 model.addAttribute("pageTitle", "마이페이지");
		 return "heartbeat/mypage"; 
	}
	 
	@RequestMapping(value = "/paymentResult")
	public String paymentResult(
    		@RequestParam("resultCode") String resultCode,
    		@RequestParam("paymentId") String paymentId,
    		Model model
    ) {
        if ("Success".equals(resultCode)) {
            // 결제 성공
            model.addAttribute("message", "결제 성공");
            model.addAttribute("paymentId", paymentId);
        } else {
            // 결제 실패
            model.addAttribute("message", "결제 실패");
        }
        return "/heartbeat/paymentResultPage";  // 반환할 뷰 페이지
    }
	
	@RequestMapping(value="/summary", method = RequestMethod.GET) 
	public String summary(Model model) {
		model.addAttribute("pageName", "요약정보 | 관리자 - HeartBeat");
		model.addAttribute("pageTitle", "요약정보");
		return "admin/summary"; 
	}
	
	@RequestMapping(value="/member", method = RequestMethod.GET) 
	public String memberList(Model model) {
		model.addAttribute("pageName", "회원리스트 | 관리자 - HeartBeat");
		model.addAttribute("pageTitle", "회원리스트");
		return "admin/member"; 
	}
	
	@RequestMapping(value="/edit", method = RequestMethod.GET) 
	public String memberEdit(Model model) {
		model.addAttribute("pageName", "회원수정 | 관리자 - HeartBeat");
		model.addAttribute("pageTitle", "회원수정");
		return "admin/edit"; 
	}
	
	@RequestMapping(value="/post", method = RequestMethod.GET) 
	public String postList(Model model) {
		model.addAttribute("pageName", "게시글 확인 | 관리자 - HeartBeat");
		model.addAttribute("pageTitle", "게시글 확인");
		return "admin/post"; 
	}
	
	@RequestMapping(value="/comment", method = RequestMethod.GET) 
	public String commentList(Model model) {
		model.addAttribute("pageName", "댓글 확인 | 관리자 - HeartBeat");
		model.addAttribute("pageTitle", "댓글 확인");
		return "admin/comment"; 
	}

}
