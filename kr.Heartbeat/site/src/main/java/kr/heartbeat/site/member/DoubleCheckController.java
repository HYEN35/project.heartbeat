package kr.heartbeat.site.member;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/member")
@RequiredArgsConstructor
public class DoubleCheckController {
	private final MemberService memberService;

	@GetMapping("/double-check")
	public ResponseEntity<String> doubleCheck(@RequestParam("field") String field, @RequestParam("value") String value){

		System.out.println("***** field 값: " + field + ", value 값: " + value);
		
		boolean dbChecked = memberService.doubleCheck(field, value);

		if (dbChecked) {
			return ResponseEntity.ok("중복된 값입니다.");
		} else {
			return ResponseEntity.ok("사용 가능한 값입니다.");
		}
	}
}
