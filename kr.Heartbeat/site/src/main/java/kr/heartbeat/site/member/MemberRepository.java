package kr.heartbeat.site.member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberRepository extends JpaRepository<MemberEntity, String> {
	boolean existsByEmail(String email);
	boolean existsByNickname(String nickname);
	boolean existsByPhone(String phone);
}
