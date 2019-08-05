package cn.nsu.edu.estore.service;

import java.sql.SQLException;
import java.util.List;

import cn.nsu.edu.estore.dao.ProductDaoImp;
import cn.nsu.edu.estore.domain.PageBean;
import cn.nsu.edu.estore.domain.Product;
import cn.nsu.edu.estore.exception.RegistException;

public class ProductService {
    ProductDaoImp dao = new ProductDaoImp();

    //�����Ʒ
    public void add(Product product) throws SQLException  {
        dao.addProduct(product);
    }

    //��ѯ������Ʒ��Ϣ
    public List<Product> findAll() throws SQLException {
        return dao.findAll();
    }

    //ͨ��id����Ψһ��Ʒ
    public Product findById(int id) throws SQLException {
        return dao.findById(id);
    }

    //�޸Ĳ�Ʒ��Ϣ
    public void update(Product product) throws SQLException {
        dao.update(product);
    }

    //��������ѯ
    public List<Product> simpleSelect(String field, String msg) throws SQLException {
        return dao.simpleSelect(field, msg);
    }

    //��ҳ��ѯ
    public PageBean findByPage(int pageNum, int currentPage) {
        PageBean pb = new PageBean();
        try {
            List<Product> pro = dao.findByPage(pageNum, currentPage);

            // ��ѯ������:
            int totalCount = dao.findAllCount();

            // �õ���ҳ��
            int totalPage = (int) Math.ceil(totalCount * 1.0 / currentPage);

            pb.setTotalCount(totalCount); // ��װ������
            pb.setTotalPage(totalPage);// ��װ��ҳ��
            pb.setPro(pro);// ��װ��ǰҳ����.
            pb.setCurrentPage(currentPage); // ��װÿҳ����
            pb.setPageNum(pageNum);// ��װ��ǰҳ��

        } catch (SQLException e) {
            e.getStackTrace();
        }
        return pb;
    }

    //�õ�����ҳ��
    public int findAllCount() throws SQLException {
        return dao.findAllCount();
    }

    //ɾ����������
    public void delete(int id) throws SQLException {
        dao.delById(id);
    }

    //ɾ��ѡ������
    public void delSelect(int[] id) throws SQLException {
        dao.delSelect(id);
    }

    //��������ֵ�õ��ڸ÷������Ʒ
    public List<Product> findByCode(String code) throws SQLException {
        return dao.findByCode(code);
    }

    public PageBean findByPageByCode(int pageNum, int currentPage, String code) {
        PageBean pb = new PageBean();
        try {
            List<Product> pro = dao.findByPageByCode(pageNum, currentPage, code);

            // ��ѯ������:
            int totalCount = dao.findCountByCode(code);

            // �õ���ҳ��
            int totalPage = (int) Math.ceil(totalCount * 1.0 / currentPage);

            pb.setTotalCount(totalCount); // ��װ������
            pb.setTotalPage(totalPage);// ��װ��ҳ��
            pb.setPro(pro);// ��װ��ǰҳ����.
            pb.setCurrentPage(currentPage); // ��װÿҳ����
            pb.setPageNum(pageNum);// ��װ��ǰҳ��

        } catch (SQLException e) {
            e.getStackTrace();
        }
        return pb;
    }

}
