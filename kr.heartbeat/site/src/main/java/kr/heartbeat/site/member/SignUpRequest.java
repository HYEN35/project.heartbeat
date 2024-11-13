package kr.heartbeat.site.member;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Getter
@Setter
public class SignUpRequest {
	private String email;
	private String pwd;
	private String name;
	private String birth;
	private String phone;
	private String nickname;
	private MultipartFile profileimg;
}
