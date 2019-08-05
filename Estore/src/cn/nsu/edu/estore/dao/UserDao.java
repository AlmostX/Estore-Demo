package cn.nsu.edu.estore.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.nsu.edu.estore.domain.Product;
import cn.nsu.edu.estore.domain.User;
import cn.nsu.edu.estore.utils.DataSourceUtils;

public class UserDao {
    //1. ע�����
    public void addUser(User user) throws SQLException {

        String sql = "insert into users values(null,?,?,?,?,?,?,null)";

        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

        runner.update(sql, user.getUsername(),
                user.getPassword(),user.getEmail(), "user", 0, user.getActivecode());
    }//ע���û�ע������Ϊ�˰�ȫ�����Ҫ��������м��ܣ�����Ŀ����Md5���ܹ��ߣ���ֹ���й¶��������Ϊ�˽�Լʱ�䣬�˲����Թ���������

    //2. �����û������ݼ�����
    public User findUserByActiveCode(String activeCode) throws SQLException {

        String sql = "select * from users where activecode=?";

        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

        return runner.query(sql, new BeanHandler<User>(User.class), activeCode);
    }

    //3. �����û�
    public void activeUser(String activeCode) throws SQLException {

        String sql = "update users set state=1 where activecode=?";

        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

        runner.update(sql, activeCode);
    }

    //4. ��¼����
    public User findUserByLogin(String username, String password) throws SQLException {
        if (username.contains("@")) {

            String sql = "select * from users where email=? and password=?";
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            return runner.query(sql, new BeanHandler<User>(User.class), username,
                    password);

        }else {
            String sql = "select * from users where username=? and password=?";
            QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
            return runner.query(sql, new BeanHandler<User>(User.class), username,
                    password);
        }
    }

    public List<User> findAll() throws SQLException {
        String sql = "select * from users ";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<User>(User.class));
    }
    
    public User findById(int id) throws SQLException {
        String sql = "select * from users where id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new   BeanHandler<User>(User.class), id);
    }

    //�༭��Ʒ��Ϣ
    public void update(User user) throws SQLException {
        String sql = "update users set username=?,password=?,email=? where id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, user.getUsername(), user.getPassword(), user.getEmail(),user.getId());
    }

}
