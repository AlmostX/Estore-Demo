package cn.nsu.edu.estore.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.nsu.edu.estore.domain.NodeDate;
import cn.nsu.edu.estore.domain.Product;
import cn.nsu.edu.estore.utils.DataSourceUtils;

public class ProductDaoImp implements ProductDao {
    //��Ʒ���
    public void addProduct(Product product) throws SQLException {
        String sql = "insert into products values(null,?,?,?,?,?,?,?)";

        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

        runner.update(sql, product.getName(), product.getPrice(),product.getPnum(),
                product.getC3code(), product.getImgurl(), product.getDescription(), product.getColor());
    }

    //��ѯ������Ʒ��Ϣ
    public List<Product> findAll() throws SQLException {
        String sql = "select * from products ";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<Product>(Product.class));
    }

    //ͨ��id����Ψһ��Ʒ
    public Product findById(int id) throws SQLException {
        String sql = "select * from products where id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new   BeanHandler<Product>(Product.class), id);
    }

    //�༭��Ʒ��Ϣ
    public void update(Product p) throws SQLException {
        String sql = "update products set name=?,price=?,pnum=?,c3code=?,"
                + "imgurl=?,description=?,color=? where id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, p.getName(), p.getPrice(), p.getPnum(), p.getC3code(),
                p.getImgurl(), p.getDescription(), p.getColor(), p.getId());
    }

    //��������ѯ
    /*fieldΪ�ֶ����ơ�msgΪΪ�ֶ�ֵ*/
    public List<Product> simpleSelect(String field, String msg) throws SQLException {
        String sql = "select * from products where " + field + " like ?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<Product>(Product.class), "%" + msg + "%");
    }

    //��ҳ��ѯ
    /*pageNumΪҳ�룬currentPageΪÿҳ����*/
    public List<Product> findByPage(int pageNum, int currentPage) throws SQLException {
        String sql = "select * from products limit ?,?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<Product>(Product.class),
                (pageNum - 1) * currentPage, currentPage);
    }

    //�õ�����ҳ��
    public int findAllCount() throws SQLException {
        String sql = "select count(*) from products";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        long count = (long) runner.query(sql, new ScalarHandler());
        return (int) count;
    }

    //�õ����������ҳ��
    public int findCountByCode(String code) throws SQLException {
        String sql = "select count(*) from products where substring(c3code,1,"+code.length()+")"+"=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        long count = (long) runner.query(sql, new ScalarHandler(), code);
        return (int) count;
    }

    //ɾ��������Ʒ��Ϣ
    public int delById(int id) throws SQLException {
        String sql = "delete from products where id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        int i =	runner.update(sql, id);
        return i;
    }

    //����ɾ����Ʒ��Ϣ
    public void delSelect(int[] id) throws SQLException {
        String sql = "delete from products where id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        Object[][] ids = new Object[id.length][1];
        for (int i = 0; i < id.length; i++) {
            ids[i][0] = id[i];//һά������ ��ά����batch������ִ��
        }

        runner.batch(sql, ids);
    }

    //��������ֵ�õ��ڸ÷������Ʒ
    public List<Product> findByCode(String code) throws SQLException {
        String sql = "select * from products where substring(c3code,1,"+code.length()+")"+"=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<Product>(Product.class), code);
    }

    public List<Product> findByPageByCode(int pageNum, int currentPage, String code) throws SQLException {
        String sql = "select * from products where substring(c3code,1,"+code.length()+")"+"=? limit ?,?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<Product>(Product.class), code,
                (pageNum - 1) * currentPage, currentPage);
    }


}
