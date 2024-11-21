package kr.heartbeat.site.member;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberService {
	private final MemberRepository memberRepository;

	public void saveMember(MemberEntity memberEntity) {
		if (memberEntity.getLevel() == null) {
			memberEntity.setLevel(0);
		}

		memberRepository.save(memberEntity);
	}

	public boolean doubleCheck(String field, String value){
		System.out.println("***** Checking " + field + " with value: " + value);

		if("email".equals(field)){
			return memberRepository.existsByEmail(value);
		} else if("phone".equals(field)){
			return memberRepository.existsByPhone(value);
		} else if("nickname".equals(field)){
			return memberRepository.existsByNickname(value);
		} else{
			return false;
		}
	}


	//외래키 숨기기
	@PersistenceContext
	private EntityManager entityManager;

	@Transactional
	public void disableForeignKeyChecks() {
		entityManager.createNativeQuery("SET FOREIGN_KEY_CHECKS = 0").executeUpdate();
	}

	@Transactional
	public void enableForeignKeyChecks() {
		entityManager.createNativeQuery("SET FOREIGN_KEY_CHECKS = 1").executeUpdate();
	}

	@Transactional
	public void saveMemberWithForeignKeyChecksDisabled(MemberEntity memberEntity) {
		// 외래 키 체크 비활성화
		disableForeignKeyChecks();

		// MemberEntity 저장
		entityManager.persist(memberEntity);

		// 외래 키 체크 활성화
		enableForeignKeyChecks();
	}
	// --end--
}
