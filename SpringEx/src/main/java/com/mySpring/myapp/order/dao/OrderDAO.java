package com.mySpring.myapp.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.myapp.order.vo.OrderVO;

public interface OrderDAO {
    public List<OrderVO> selectAllOrderList() throws DataAccessException;
    public List<OrderVO> selectAllOrderListById(String order_member_id) throws DataAccessException;
    public int registerOrder(OrderVO order) throws DataAccessException;
    public OrderVO viewOrdersByNo(int order_no) throws DataAccessException;
    public List<OrderVO> getOrderDetail(int orderNo) throws DataAccessException;
    public int deleteOrder(int order_no) throws DataAccessException;
   
	
}
