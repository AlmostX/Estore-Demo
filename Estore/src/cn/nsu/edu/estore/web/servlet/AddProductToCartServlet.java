package cn.nsu.edu.estore.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.nsu.edu.estore.domain.Product;
import cn.nsu.edu.estore.service.ProductService;

/**
 * Servlet implementation class AddProductToCartServlet
 */
@WebServlet("/AddProductToCartServlet")
public class AddProductToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1.�õ���Ʒid
        String id = request.getParameter("id");

        // 2.����id��ѯ��Ʒ
        ProductService service = new ProductService();
        try {
            Product p = service.findById(Integer.parseInt(id));

            // 3.����Ʒ��ӵ����ﳵ
            HttpSession session = request.getSession();
            // ��session�л�ȡ���ﳵ
            Map<Product, Integer> cart = (Map<Product, Integer>) session
                    .getAttribute("cart");
            // ���cartΪnull,˵����û�й��ﳵ���ǵ�һ�ι���
            if (cart == null) {
                // ���������ﳵ
                cart = new HashMap<Product, Integer>();
            }
            // �жϹ��ﳵ�������е�ǰҪ�����Ʒ
            Integer count = cart.get(p);
            if (count == null) {
                // ���Ϊnull,˵�����ﳵ��û�������Ʒ����ʱ��Ʒ��������Ϊ1
                count = 1;
            } else {
                // �����Ϊnull,˵�����ﳵ���������Ʒ����ʱ���ͽ���Ʒ������+1
                count += 1;
            }
            // ����Ʒ�洢�����ﳵ��
            cart.put(p, count);
            // �����ﳵ�洢��session��.
            session.setAttribute("cart", cart);

            response.sendRedirect(request.getContextPath()+"/addProductToCartSuccessfull.jsp");
            //		response.getWriter().write("�����Ʒ�����ﳵ�ɹ���<a href='http://localhost:8080/Estore'>��������</a>,<a href='http://localhost:8080/Estore/showcart.jsp'>�鿴���ﳵ</a>");
            return;

        } catch (SQLException e) {
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
