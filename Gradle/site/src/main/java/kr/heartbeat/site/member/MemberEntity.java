package kr.heartbeat.site.member;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@ToString
@Table(name = "user_tbl")
public class MemberEntity {

	@Id
	@Column(nullable = false)
	private String email;

	@Column(nullable = false, columnDefinition = "int default 0")
	private Integer artistId = 0;

	private String pwd;
	private String name;
	private String nickname;
	private String birth;
	private String phone;
	private String profileimg;

	@Column(nullable = false, columnDefinition = "int default 0")
	private Integer level = 0;

	@Column(nullable = false)
	private LocalDateTime reg_date;

	@Column(nullable = false)
	private LocalDateTime up_date;

	@PrePersist
	public void prePersist() {
		if (this.level == null) {
			this.level = 0;
		}
		if (this.reg_date == null) {
			this.reg_date = LocalDateTime.now();
		}
		if (this.up_date == null) {
			this.up_date = LocalDateTime.now();
		}
	}
}
