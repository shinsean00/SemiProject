package com.mySpring.myapp.order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mySpring.myapp.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<OrderVO> selectAllOrderList() throws DataAccessException {
        List<OrderVO> ordersList = null;
        ordersList = sqlSession.selectList("mapper.order.selectAllOrderList");
        return ordersList;
    }
    
    @Override
    public List<OrderVO> selectAllOrderListById(String order_member_id) throws DataAccessException {
        List<OrderVO> ordersListById = null;
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("order_member_id", order_member_id);
        ordersListById = sqlSession.selectList("mapper.order.selectAllOrderListById", parameters);
        return ordersListById;
    }
    
    @Override
    public int registerOrder(OrderVO order) throws DataAccessException {
    	int result = sqlSession.insert("mapper.order.registerOrder", order);
    	return result;
    }    
    @Override
    public OrderVO viewOrdersByNo(int order_no) throws DataAccessException {      
        return sqlSession.selectOne("mapper.order.getOrderByNo", order_no);
    }
    
    @Override
    public List<OrderVO> getOrderDetail(int orderNo) throws DataAccessException {
    	List<OrderVO> orderDetail = sqlSession.selectList("mapper.order.selectAllOrder", orderNo);
    	return orderDetail;
    }

    @Override
    public int deleteOrder(int order_no) throws DataAccessException {
        int result = sqlSession.delete("mapper.order.deleteOrder", order_no);
        return result;
    }

}
