package cn.nsu.edu.estore.web.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.nsu.edu.estore.domain.Product;
import cn.nsu.edu.estore.domain.User;
import cn.nsu.edu.estore.service.UserService;

/**
 * Servlet implementation class ProductFindByIdServlet
 */
@WebServlet("/UserFindByIdServlet")
public class UserFindByIdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取输入信息
        String id = request.getParameter("id");

        //调用service中查询所有方法
        UserService service = new UserService();

        try {
            User user = service.findById(Integer.parseInt(id));

            request.getSession().setAttribute("pro", user);

            User user1 = (User) request.getSession().getAttribute("user1");

            if (user1 == null || user1.getRole().equals("user1")) {
                request.getRequestDispatcher("/edit.jsp").forward(request, response);
                return;
            }
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write(e.getMessage());
            return;
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
