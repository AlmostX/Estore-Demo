package cn.nsu.edu.estore.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.nsu.edu.estore.domain.Product;
import cn.nsu.edu.estore.service.ProductService;

/**
 * Servlet implementation class RemoveProductFromCartServlet
 */
@WebServlet("/RemoveProductFromCartServlet")
public class RemoveProductFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // �õ�Ҫɾ������Ʒ��id
        int id =Integer.parseInt( request.getParameter("id"));
        // �õ����ﳵ���ӹ��ﳵ�н���Ʒɾ��,
        Map<Product, Integer> cart = (Map<Product, Integer>) request
                .getSession().getAttribute("cart");


        Product p=new Product();
        p.setId(id);

        cart.remove(p);
        //������ﳵ������Ʒ�������ﳵɾ����
        if (cart.size() == 0) {
            request.getSession().removeAttribute("cart");
        }
        response.sendRedirect(request.getContextPath() + "/showcart.jsp");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
