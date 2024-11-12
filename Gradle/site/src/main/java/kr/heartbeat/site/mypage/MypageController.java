package kr.heartbeat.site.mypage;

import kr.heartbeat.site.member.MemberRepository;
import kr.heartbeat.site.member.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class MypageController {

	private final MemberService memberService;
	private final MemberRepository memberRepository;

	@GetMapping("/mypage")
	String myPage(Model model){
		model.addAttribute("pageName", "마이페이지 - HeartBeat");
		model.addAttribute("pageTitle", "마이페이지");
		return "/heartbeat/mypage";
	}
}
