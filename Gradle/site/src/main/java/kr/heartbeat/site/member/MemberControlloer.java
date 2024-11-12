package kr.heartbeat.site.member;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Controller
@RequiredArgsConstructor
public class MemberControlloer {

	private final MemberService memberService;
	private final MemberRepository memberRepository;

	@GetMapping("/login") //메뉴에서 로그인
	public String login(Model model){
		model.addAttribute("pageName", "로그인 - HeartBeat");
		return "/heartbeat/login";
	}

	@PostMapping("/signIn")
	public String signIn(Model model){
		model.addAttribute("pageName", "차트 - HeartBeat");
		model.addAttribute("pageTitle", "차트");
		return "/heartbeat/chart";
	}

	@GetMapping("/join") //메뉴에서 회원가입
	public String join(Model model){
		model.addAttribute("pageName", "회원가입 - HeartBeat");
		return "/heartbeat/join";
	}

	@PostMapping("/signUp")
	public String signUp(@ModelAttribute MemberDTO memberDTO, Model model){
		model.addAttribute("pageName", "차트 - HeartBeat");
		model.addAttribute("pageTitle", "차트");

		if (memberDTO.getArtistId() == null) {
			memberDTO.setArtistId(0);
		}

		if (memberDTO.getLevel() == null) {
			memberDTO.setLevel(0);
		}

		MemberEntity memberEntity = new MemberEntity();

		memberEntity.setEmail(memberDTO.getEmail());
		memberEntity.setArtistId(memberDTO.getArtistId());
		memberEntity.setPwd(memberDTO.getPwd());
		memberEntity.setName(memberDTO.getName());
		memberEntity.setNickname(memberDTO.getNickname());
		memberEntity.setBirth(memberDTO.getBirth());
		memberEntity.setPhone(memberDTO.getPhone());
		memberEntity.setProfileimg(memberDTO.getProfileimg());
		memberEntity.setLevel(memberDTO.getLevel());
		memberEntity.setReg_date(LocalDateTime.now());
		memberEntity.setUp_date(LocalDateTime.now());

		memberService.saveMember(memberEntity);

		return "redirect:/login";
	}
}