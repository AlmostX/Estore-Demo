package cn.nsu.edu.estore.dao;

import java.sql.SQLException;
import java.util.List;

import cn.nsu.edu.estore.domain.NodeDate;
import cn.nsu.edu.estore.domain.Product;

public interface ProductDao {
    //��Ʒ���
    public void addProduct(Product product) throws SQLException;

    //ɾ��������Ʒ��Ϣ
    public int delById(int id) throws SQLException;

    //����ɾ����ѡ�Ŀͻ���Ϣ
    public void delSelect(int[] id) throws SQLException;

    //��ѯ������Ʒ��Ϣ
    public List<Product> findAll() throws SQLException;

    //ͨ��id����Ψһ��Ʒ  �༭��Ʒ��Ϣ
    public Product findById(int id) throws SQLException;
    public void update(Product p) throws SQLException;

    //��������ѯ
    public List<Product> simpleSelect(String field, String msg) throws SQLException;

    //��ҳ��ѯ
    public List<Product> findByPage(int pageNum, int currentPage) throws SQLException;

    //�õ�����ҳ��
    public int findAllCount() throws SQLException;

    //�õ����������ҳ��
    public int findCountByCode(String code) throws SQLException;

    //��������ֵ�õ��ڸ÷������Ʒ
    public List<Product> findByCode(String code) throws SQLException;

}
