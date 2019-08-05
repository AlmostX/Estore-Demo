package cn.nsu.edu.estore.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DataSourceUtils {
    private static DataSource dataSource = new ComboPooledDataSource();

    private static final ThreadLocal<Connection> tl = new ThreadLocal<Connection>();

    public static DataSource getDataSource() {
        return dataSource;
    }

    // ��ȡ�󶨵�ThreadLocal�е�Connection��
    public static Connection getConnectionByTransaction() throws SQLException {
        Connection con = tl.get();
        if (con == null) {
            con = dataSource.getConnection();
            tl.set(con);
        }

        return con;
    }

    // ��������
    public static void startTransaction(Connection con) throws SQLException {
        if (con != null)
            con.setAutoCommit(false);
    }

    // ����ع�
    public static void rollback(Connection con) throws SQLException {
        if (con != null)
            con.rollback();
    }

    public static void closeConnection(Connection con) throws SQLException {
        if (con != null) {
            con.commit();// �����ύ
            con.close();
            tl.remove();

        }
    }

    /**
     * ��DBUtils��Ҫ�ֶ���������ʱ�����ø÷������һ������
     *
     * @return
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
}
