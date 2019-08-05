package cn.nsu.edu.estore.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import cn.nsu.edu.estore.domain.Product;
import cn.nsu.edu.estore.domain.User;
import cn.nsu.edu.estore.exception.ActiveCodeException;
import cn.nsu.edu.estore.exception.LoginException;
import cn.nsu.edu.estore.service.ProductService;
import cn.nsu.edu.estore.service.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1.得到所有请求参数，封装到User对象中.
        User user = new User();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            BeanUtils.populate(user, request.getParameterMap());
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        String checkCode = request.getParameter("captcha");

		String _checkCode = (String) request.getSession().getAttribute(
				"checkcode_session");
		request.getSession().removeAttribute("checkcode_session");//从session中删除。
		System.out.println(checkCode+" "+_checkCode);
		if (!checkCode.equals(_checkCode)) {
			request.setAttribute("regist.message", "验证码不正确");
			request.getRequestDispatcher("/login_error.jsp").forward(request,
					response);
			return;
		}
		
		
		
        // 2.校验用户名密码数据是否为空为空，
        //如果用户名密码为空，即Map集合中拥有返回的错误信息，即Map的集合有大小
        Map<String, String> map = user.validation();

        if (map.size() != 0) {
            request.setAttribute("map", map);
            request.getRequestDispatcher("/index.jsp").forward(request,
                    response);
            return;
        }
        UserService se=new UserService();
        
		try {
			List<User> us=se.findAll();
			int flag=0;
			for(int i=0;i<us.size();i++){
				//System.out.println(us.get(i).getUsername()+" "+us.get(i).getPassword());
	        	if(us.get(i).getUsername().equals(username)&&us.get(i).getPassword().equals(password)){
	        		flag=1;
	        	}
	        }
			if(flag==0){
				request.getRequestDispatcher("/login_error.jsp").forward(request,
	                    response);
				return;
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        
        
        
        
        // 3.调用service中登录的方法
        UserService service = new UserService();
        try {
            User user1 = service.login(username, password);

            // 登录成功

            // 判断是否勾选了记住用户名.
            String remember = request.getParameter("remember");
            if ("on".equals(remember)) {
                // 勾选了--考虑中文问题
                Cookie cookie = new Cookie("remember", URLEncoder.encode(
                        user1.getUsername(), "utf-8"));
                cookie.setMaxAge(10 * 24 * 60 * 60);
                cookie.setPath("/");
                response.addCookie(cookie);
            } else {
                // 如果用户没有勾选记住用户名，将cookie删除。删除cookie，只需要设置maxage=0或-1,注意：要与cookie的path一致.
                Cookie cookie = new Cookie("remember", URLEncoder.encode(
                        user1.getUsername(), "utf-8"));
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
            }

            // 自动登录

            String autologin=request.getParameter("autologin");
            if("on".equals(autologin)){
                Cookie cookie = new Cookie("autologin", URLEncoder.encode(
                        user1.getUsername(), "utf-8")+"::"+password);
                cookie.setMaxAge(10 * 24 * 60 * 60);
                cookie.setPath("/");
                response.addCookie(cookie);
            }else{
                Cookie cookie = new Cookie("autologin", URLEncoder.encode(
                        user1.getUsername(), "utf-8")+"::"+password);
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
            }

            request.getSession().invalidate();//先销毁session。

            request.getSession().setAttribute("user", user1);// 登录成功，将user存储到session中.

            response.sendRedirect("http://localhost:8080/Estore"); // 请求转发只能在本站内跳转........登录成功应该加上用户信息*******
            return;

        } catch (ActiveCodeException e) {
            e.printStackTrace();
            request.setAttribute("login.message", e.getMessage());
            request.getRequestDispatcher("/index.jsp")
                    .forward(request, response);
            return;
        } catch (javax.security.auth.login.LoginException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
