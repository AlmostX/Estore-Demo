package cn.nsu.edu.estore.service;

import java.security.GeneralSecurityException;
import java.sql.SQLException;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.security.auth.login.LoginException;

import cn.nsu.edu.estore.dao.UserDao;
import cn.nsu.edu.estore.domain.Product;
import cn.nsu.edu.estore.domain.User;
import cn.nsu.edu.estore.exception.ActiveCodeException;
import cn.nsu.edu.estore.exception.RegistException;
import cn.nsu.edu.estore.utils.MailUtils;

public class UserService {
    /* 1.ע�����		START*/
    public void regist(User user) throws RegistException {

        UserDao dao = new UserDao();
        try {
            //1.���ע���û���Ϣ
            dao.addUser(user);
            //2.��ע���û����ͼ����ʼ�
            String emailMsg = "ע��ɹ�������������������ɼ������:(ps:��������ԭ���븴�����Ӵ򿪣�)"+"<br>"+
                    "http://localhost:8080/Estore/UserActiveServlet?activeCode="+user.getActivecode();
            MailUtils.sendMail(user.getEmail(), emailMsg);
        } catch (SQLException e) {
            throw new RegistException("ע��ʧ��");
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (GeneralSecurityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    /*1. ע�����		END*/

    /*2. �����û�����	START*/
    public void activeUser(String activeCode) throws ActiveCodeException {
        UserDao dao = new UserDao();
        // 1.���ݼ������ѯ�û���Ҫ�жϼ������Ƿ����.

        try {
            User user = dao.findUserByActiveCode(activeCode);

            if (user != null) {
                // 2.���м������

                long time = System.currentTimeMillis()
                        - user.getUpdatetime().getTime();

                if (time <= 24 * 60 * 1000 * 60) {
                    // ����
                    try {
                        dao.activeUser(activeCode);
                    } catch (SQLException e) {
                        throw new ActiveCodeException("�����û�ʧ��");
                    }

                } else {
                    throw new ActiveCodeException("���������");
                }
            } else {
                throw new ActiveCodeException("�û�������");
            }
        } catch (SQLException e) {
            throw new ActiveCodeException("���Ҽ����û�ʧ��");
        }
    }
    /*2. �����û�����	START*/

    /*3.��¼����		START*/
    public User login(String username, String password) throws LoginException, ActiveCodeException {
        // ��Ҫע���û��Ƿ񼤻�
        UserDao dao = new UserDao();
        try {
            User user = dao.findUserByLogin(username, password);
            if (user != null) {
                // �ж��û��Ƿ񼤻�
                if (user.getState() == 1) {
                    return user;
                } else {
                    throw new ActiveCodeException("�û�δ����");
                }
            } else {
                throw new LoginException("�û������������");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LoginException("�û������������");
        }

    }

    /*3.��¼����		END*/
    public List<User> findAll() throws SQLException {
    	UserDao dao = new UserDao();
    	return dao.findAll();
    }
    
    public User findById(int id) throws SQLException {
        UserDao dao = new UserDao();
        return dao.findById(id);
    }

    //�޸Ĳ�Ʒ��Ϣ
    public void update(User user) throws SQLException {
        UserDao dao = new UserDao();
        dao.update(user);
    }
}


