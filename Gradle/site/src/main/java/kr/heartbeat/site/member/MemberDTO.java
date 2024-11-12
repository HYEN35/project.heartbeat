package kr.heartbeat.site.member;

import lombok.Getter;
import lombok.Setter;

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
	private String profileimg;
	private Integer level;
	private String regDate;
	private String upDate;
}
