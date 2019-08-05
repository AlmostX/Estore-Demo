package cn.nsu.edu.estore.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginOutServlet
 */
@WebServlet("/LoginOutServlet")
public class LoginOutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * ע��***************
         * ������cookieֻ����һ��Ӧ���й�����һ��cookieֻ���ɴ�������Ӧ�û�á�
         * 	����ͬһӦ�÷������ڹ�����������cookie.setPath("/");
         */
        // ע�����ܾ�������session

        request.getSession().invalidate();

        // ���Զ���¼��cookieɾ����

        Cookie cookie = new Cookie("autologin", "");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);

        response.sendRedirect(request.getContextPath() + "/index.jsp");



    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
