package cn.nsu.edu.estore.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import cn.nsu.edu.estore.domain.User;
import cn.nsu.edu.estore.exception.RegistException;
import cn.nsu.edu.estore.service.UserService;
import cn.nsu.edu.estore.utils.ActiveCodeUtils;


@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*1.������֤���ж�	START	*/
        //��֤�����������ɵ���֤����ͻ�����֤�����У�飬��֤�û������Ƿ�Ϸ���
		String checkCode = request.getParameter("captcha");

		String _checkCode = (String) request.getSession().getAttribute(
				"checkcode_session");
		request.getSession().removeAttribute("checkcode_session");//��session��ɾ����
		System.out.println(checkCode+" "+_checkCode);
		if (!checkCode.equals(_checkCode)) {
			request.setAttribute("regist.message", "��֤�벻��ȷ");
			request.getRequestDispatcher("/regist.jsp").forward(request,
					response);
			return;
		}  //***********��֤��ȷ��BUG******************
        /*1.������֤���ж�	END	*/
//	request.setCharacterEncoding("utf-8");

        /* 2.�õ����������������װ��User������.	START*/
        User user = new User();
        try {
            BeanUtils.populate(user, request.getParameterMap());
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        /* 2.�õ����������������װ��User������.	END*/

        // �ֶ���װ������
        user.setActivecode(ActiveCodeUtils.getActiveCode());

        /* 3.����service���ע�����.		START*/
        UserService service = new UserService();
        try {
            service.regist(user);

            // 3.1ע��ɹ�
            response.sendRedirect(request.getContextPath()
                    + "/regist_success.jsp");
            return;
        } catch (RegistException e) {
            // 3.2ע��ʧ��
            request.setAttribute("regist.message", e.getMessage());
            request.getRequestDispatcher("/error/registuser_error.jsp").forward(request,
                    response);
            return;
        }
        /* 3.����service���ע�����.		END*/
    }
}
