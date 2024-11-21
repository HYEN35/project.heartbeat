package kr.heartbeat.site.member;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/member/login")
@RequiredArgsConstructor
public class FindLoginController {

	private final MemberService memberService;

	@PostMapping("/findEmail")
	public String findEmail(HttpServletRequest httpServletRequest,
	                        Model model,
	                        MemberDTO memberDTO,
	                        @RequestParam String name,
	                        @RequestParam String phone,
	                        @RequestParam String birth){
		try {
			memberDTO.setName(name);
			memberDTO.setPhone(phone);
			memberDTO.setBirth(birth);


		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return "redirect:/login";
	}

	@PostMapping("/findPwd")
	public String findPwd(){

		return "redirect:/login";
	}
}
