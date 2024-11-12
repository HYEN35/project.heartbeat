package kr.heartbeat.site.chart;

import kr.heartbeat.site.member.MemberRepository;
import kr.heartbeat.site.member.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class ChartController {
	private final MemberService memberService;
	private final MemberRepository memberRepository;

	@GetMapping("/chart")
	String chart(Model model){
		model.addAttribute("pageName", "차트 - HeartBeat");
		model.addAttribute("pageTitle", "차트");
		return "/heartbeat/chart";
	}
}
