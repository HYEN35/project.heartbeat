package kr.heartbeat.site.member;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class MemberService{
	private final MemberRepository memberRepository;

	public void saveMember(MemberEntity memberEntity) {
		if (memberEntity.getLevel() == null) {
			memberEntity.setLevel(0);
		}

		memberRepository.save(memberEntity);
	}
}
