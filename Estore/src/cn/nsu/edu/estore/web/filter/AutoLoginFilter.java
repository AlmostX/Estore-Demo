package cn.nsu.edu.estore.web.filter;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.nsu.edu.estore.domain.User;
import cn.nsu.edu.estore.exception.ActiveCodeException;
import cn.nsu.edu.estore.exception.LoginException;
import cn.nsu.edu.estore.service.UserService;
import cn.nsu.edu.estore.utils.CookieUtils;

/**
 * Servlet implementation class AutoLoginFilter
 */
/*@WebServlet("")*/
/*public class AutoLoginFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(FilterConfig filterConfig) throws ServletException {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// ������������
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;

		// �����Զ���¼
		// 1.����û��Ѿ���¼����Ҫ�Զ���¼
		User user = (User) httpServletRequest.getSession().getAttribute("user");
		if (user == null) {
			// û�е�¼�������Զ���¼
			// 2.�жϷ��ʵ���Դ·���������¼��ע�᲻��Ҫ�����Զ���¼
			String uri = httpServletRequest.getRequestURI();
			String contextPath = httpServletRequest.getContextPath();
			String path = uri.substring(contextPath.length());
			if (!("/regist".equals(path) || "/regist.jsp".equals(path)
					|| "/login.jsp".equals(path) || "/logout".equals(path))) {

				// 3.�õ�Cookie
				Cookie cookie = CookieUtils.findCookieByName(
						httpServletRequest.getCookies(), "autologin");
				if (cookie != null) {

					// ��cookie�����е�¼����.
					String username = URLDecoder.decode(cookie.getValue()
							.split("::")[0], "utf-8");
					String password = cookie.getValue().split("::")[1];

					UserService service = new UserService();
					try {
						User u = service.login(username, password);
						if (u != null) {
							httpServletRequest.getSession().setAttribute(
									"user", u);// �����Զ���¼.
						}
					} catch (javax.security.auth.login.LoginException e) {
						e.printStackTrace();
					} catch (ActiveCodeException e) {
						e.printStackTrace();
					}

				}

			}
		}

		// ����
		chain.doFilter(httpServletRequest, httpServletResponse);
	}

	public void destroy() {

	}
	*/
/*}*/
