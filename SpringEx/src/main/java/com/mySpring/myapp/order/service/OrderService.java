package com.mySpring.myapp.order.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.myapp.order.vo.OrderVO;

public interface OrderService {
    public List<OrderVO> listOrders() throws DataAccessException;
    public List<OrderVO> listOrdersById(String order_member_id) throws DataAccessException;
    public int registerOrder(OrderVO order) throws DataAccessException;
    public OrderVO viewOrdersByNo(int order) throws DataAccessException;
    public List<OrderVO> getOrderDetail(int orderNo) throws DataAccessException;
    public int removeOrder(int orderNo) throws DataAccessException;
	public int removeOrderManager(int order_no) throws DataAccessException;

}
