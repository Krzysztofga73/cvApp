package com.example.cvapp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
@EnableWebSecurity
public class Auth extends WebSecurityConfigurerAdapter {
    @Bean
    protected PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser("user").password(passwordEncoder().encode("user")).roles("USER")
                .and()
                .withUser("admin").password(passwordEncoder().encode("admin")).roles("ADMIN");
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/education", "/experience", "/interest", "/skills")// mają dostęp wszyscy użytkownicy z rolą USER
                .hasAnyAuthority("ROLE_USER", "ROLE_ADMIN")
                .antMatchers("/editEducation", "/editExperience","/editInterest", "/editSkills" )
                .hasAnyAuthority("ROLE_ADMIN") // mają dostęp wszyscy użytkownicy z rolą ADMIN
                .antMatchers("/")
                .permitAll()
                .and()
                .csrf().disable()
                .headers().frameOptions().disable()
                .and()
                .formLogin() // wskazujemy, że teraz będziemy konfigurować formularz autoryzacji
                .loginPage("/login")
                .usernameParameter("username") // nadajemy nazwę jaka będzie jako name w inpucie loginu formularza
                .passwordParameter("password") // nadajemy nazwę jaka będzie jako name w inpucie hasłą formularza
                .loginProcessingUrl("/login")
                .failureForwardUrl("/login?error") // co sięstanie w momencie wpisania błędnych danych
                .defaultSuccessUrl("/") // co się stanie w momencie wpisania prawidłowych danych
                .and()
                .logout() // mówie, że przechodzę do konfiguracji wylogowania
                .logoutSuccessUrl("/login");

    }
}
