package kr.heartbeat.site.member;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Getter
@Setter
public class MemberDTO {
	private String email;
	private Integer artistId;
	private String pwd;
	private String name;
	private String nickname;
	private String birth;
	private String phone;
	private MultipartFile profileimg;
	private Integer level;
	private String regDate;
	private String upDate;
}
