/*
package kr.heartbeat.site.basic;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf( (csrf) -> csrf.disable() );
		http.authorizeHttpRequests((authorize) ->
				authorize.requestMatchers("/**").permitAll()
		);
		http.formLogin((formLogin)
				-> formLogin.loginPage("/heartbeat/chart")
				.defaultSuccessUrl("/") //성공했을 때 이동할 페이지
				.failureUrl("/login?error") //실패했을때 이동할 페이지
		);

		/*http.logout(logout -> logout.logoutUrl("/logout"));*/
/*
		http.logout(logout -> logout
				.logoutUrl("/logout")
				.logoutSuccessUrl("/")
		);
		return http.build();
	}
}
*/

/*
{}*/
