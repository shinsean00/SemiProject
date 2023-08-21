package com.mySpring.myapp.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.myapp.order.dao.OrderDAO;
import com.mySpring.myapp.order.vo.OrderVO;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDAO orderDAO;

    @Override
    public List<OrderVO> listOrders() throws DataAccessException {
        List<OrderVO> ordersList = orderDAO.selectAllOrderList();
        return ordersList;
    }

	@Override
	public List<OrderVO> listOrdersById(String order_member_id) throws DataAccessException {
	    List<OrderVO> ordersListById = orderDAO.selectAllOrderListById(order_member_id);
	    return ordersListById;
	}
	
	@Override
    public int registerOrder(OrderVO order) throws DataAccessException {
    	return orderDAO.registerOrder(order);
    }
	
	@Override
	public OrderVO viewOrdersByNo(int order_no) throws DataAccessException {
	   return orderDAO.viewOrdersByNo(order_no);
	}

	 @Override
	    public List<OrderVO> getOrderDetail(int orderNo) throws DataAccessException {
	    	return orderDAO.getOrderDetail(orderNo);
	    }
	 
	 @Override
	    public int removeOrder(int order_no) throws DataAccessException {
	        return orderDAO.deleteOrder(order_no);
	    }
	
    @Override
    public int removeOrderManager(int order_no) throws DataAccessException {
        return orderDAO.deleteOrder(order_no);
    }
    
    
    
   
}
