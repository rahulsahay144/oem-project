package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionCheckFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) req;
		HttpServletResponse httpResponse = (HttpServletResponse) resp;
		
		String loginURI = httpRequest.getContextPath() + "/login.jsp";
		String loginURISubmit = httpRequest.getContextPath() + "/login";
		
		boolean skipResources = httpRequest.getRequestURI().contains(".css") || httpRequest.getRequestURI().contains("/logout") || httpRequest.getRequestURI().contains("/regis.jsp")
								|| httpRequest.getRequestURI().contains("/regis") || httpRequest.getRequestURI().equals(loginURI) || httpRequest.getRequestURI().equals(loginURISubmit);
		 
		HttpSession session = httpRequest.getSession(false);
		if((session != null && session.getAttribute("uname") != null) || skipResources) {
			chain.doFilter(req, resp);
		}
		else {
			httpResponse.sendRedirect(loginURI);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
