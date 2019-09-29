package com.web.hulklogic.config;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import com.web.hulklogic.entity.User;
import com.web.hulklogic.service.UserService;

@Component
public class CustomeAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	private static Logger logger = Logger.getLogger(CustomeAuthenticationSuccessHandler.class);
	@Autowired
	UserService userService;

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest arg0, HttpServletResponse arg1,
			Authentication authentication) throws IOException, ServletException {

		HttpSession session = arg0.getSession();
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		arg0.getSession().setAttribute("userName", userName);
		session.setAttribute("userName", userName);

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		User user = userService.getUserByEmail(userName);
		arg0.getSession().setAttribute("userid", user.getUserid());
		arg0.getSession().setAttribute("teamname", user.getTeamname());
		arg0.getSession().setAttribute("teamname1", user.getTeamname1());
		arg0.getSession().setAttribute("firstname", user.getFirstname());
		arg0.getSession().setAttribute("lastname", user.getLastname());
		arg0.getSession().setAttribute("mobile", user.getContactno());
		arg0.getSession().setAttribute("organization", user.getOrganization());
		logger.info("teamid" + user.getTeamname());
		logger.info("userid" + user.getUserid());
		authorities.forEach(authority -> {
			if (authority.getAuthority().equals("ROLE_ADMIN")) {
				try {
					arg0.getSession().setAttribute("roleName", authority.getAuthority());
					redirectStrategy.sendRedirect(arg0, arg1, "/admin/admindashboard");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (authority.getAuthority().equals("ROLE_MANAGER")) {
				try {
					arg0.getSession().setAttribute("roleName", authority.getAuthority());
					redirectStrategy.sendRedirect(arg0, arg1, "/manager/managerdashboard");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (authority.getAuthority().equals("ROLE_RECRUITER")) {
				try {
					arg0.getSession().setAttribute("roleName", authority.getAuthority());
					redirectStrategy.sendRedirect(arg0, arg1, "/recruiter/recruiterdashboard");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				throw new IllegalStateException();
			}
		});

	}

}