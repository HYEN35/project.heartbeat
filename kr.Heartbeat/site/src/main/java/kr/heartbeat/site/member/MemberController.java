package kr.heartbeat.site.member;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.time.LocalDateTime;

@Controller
@RequiredArgsConstructor
public class MemberController {

	private final MemberService memberService;
	private final MemberRepository memberRepository;

	@GetMapping("/login")
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

	@GetMapping("/join")
	public String join(Model model){
		model.addAttribute("pageName", "회원가입 - HeartBeat");
		return "/heartbeat/join";
	}

	@PostMapping("/signUp")
	public ResponseEntity<String> signUp(@ModelAttribute SignUpRequest signUpRequest,
	                                     @RequestParam(value = "profileimg", required = false) MultipartFile profileimg,
	                                     Model model){
		model.addAttribute("pageName", "차트 - HeartBeat");
		model.addAttribute("pageTitle", "차트");

		try {

			MemberEntity memberEntity = new MemberEntity();

			memberEntity.setEmail(signUpRequest.getEmail());
			memberEntity.setPwd(signUpRequest.getPwd());
			memberEntity.setName(signUpRequest.getName());
			memberEntity.setPhone(signUpRequest.getPhone());
			memberEntity.setNickname(signUpRequest.getNickname());
			memberEntity.setBirth(signUpRequest.getBirth());

			if (profileimg != null && !profileimg.isEmpty()) {
				// 파일 저장 경로 설정 (예: /uploads/파일명)
				String uploadDirectory = "/src/main/resources/static/uploads/profileimg/";
				String filePath = uploadDirectory + profileimg.getOriginalFilename();
				File fileToSave = new File(filePath);

				// 파일 저장
				profileimg.transferTo(fileToSave);

				// 파일 경로를 엔티티에 설정
				memberEntity.setProfileimg(filePath);
			}

			memberEntity.setArtistId(0);
			memberEntity.setLevel(0);
			memberEntity.setReg_date(LocalDateTime.now());
			memberEntity.setUp_date(LocalDateTime.now());

			memberService.saveMember(memberEntity);

			return ResponseEntity.ok("회원가입 성공");
		} catch (Exception e) {
			e.printStackTrace(); // 서버 로그에 에러 출력
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("회원가입 실패");
		}
	}
}
