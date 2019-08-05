package cn.nsu.edu.estore.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import cn.nsu.edu.estore.domain.Order;
import cn.nsu.edu.estore.utils.DataSourceUtils;

public class OrderDao {

    //Ìí¼Ó¶©µ¥²Ù×÷
    public int addOrder(Order order) throws SQLException {
        String sql="insert into orders values(null,?,?,?,null,null)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.update(sql,order.getMoney(),order.getReceiverinfo(),order.getPaystate());
    }


}
