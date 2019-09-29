package com.web.hulklogic.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


@Configuration
@EnableWebSecurity
public class EmployeeSecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;
	@Autowired
	private CustomeAuthenticationSuccessHandler successHandler;
	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		String query = "select email,password,status from user where email=?";
		String authQuery = "select u.email, r.rolename,u.organization from user u, role r where r.roleid=u.roleid and u.email=?";
		auth.jdbcAuthentication().dataSource(dataSource).usersByUsernameQuery(query)
				.authoritiesByUsernameQuery(authQuery);
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}

	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		//http.addFilter(simpleCORSFilter)
		http.csrf().requireCsrfProtectionMatcher(new AntPathRequestMatcher("**/")).and().authorizeRequests()
		.antMatchers("/user/**").hasAnyRole("MANAGER", "RECRUITER").antMatchers("/admin/**").hasRole("ADMIN")
				.antMatchers("/manager/**").hasRole("MANAGER").antMatchers("/recruiter/**").hasRole("RECRUITER").and()
				.formLogin().successHandler(successHandler).and().httpBasic().and().authorizeRequests()
				.antMatchers("/rest/**").hasRole("ADMIN");

		// .loginPage("/login").and().logout().permitAll();

		/*
		 * http.httpBasic().and().authorizeRequests().antMatchers("/rest/**")
		 * .hasRole("USER").antMatchers("/**").hasRole("ADMIN").and()
		 * .csrf().disable().headers().frameOptions().disable();
		 */
	}

	@SuppressWarnings("deprecation")
	@Bean
	public static NoOpPasswordEncoder passwordEncoder() {
		return (NoOpPasswordEncoder) NoOpPasswordEncoder.getInstance();
	}
	
	@Bean
    public WebMvcConfigurer corsConfigurer() {
		System.out.println("corsConfigurer ..invoked");
        return new WebMvcConfigurerAdapter() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**").allowedOrigins("*");
            }
        };
    }

}