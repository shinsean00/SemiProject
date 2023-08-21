package com.mySpring.myapp.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.myapp.order.service.OrderService;
import com.mySpring.myapp.order.vo.OrderVO;
import com.mySpring.myapp.product.service.ProductService;
import com.mySpring.myapp.product.vo.ProductVO;

@Controller("orderController")
public class OrderControllerImpl implements OrderController {
    @Autowired
    private OrderService orderService;
    
    @Autowired
    private ProductService productService;

    @Override
    @RequestMapping(value = "/order/listOrders.do", method = RequestMethod.GET)
    public ModelAndView listOrders(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String viewName = (String) request.getAttribute("viewName");
        List<OrderVO> ordersList = orderService.listOrders();
        ModelAndView mav = new ModelAndView(viewName);
        mav.addObject("ordersList", ordersList);
        return mav;
    }
    
    @Override
    @RequestMapping(value = "/order/listOrdersById.do", method = RequestMethod.GET)
    public ModelAndView listOrdersById(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String viewName = (String) request.getAttribute("viewName");
        String order_member_id = request.getParameter("id");
        System.out.println("request.getParameter(\"id\")시작" + order_member_id + "끝");
        List<OrderVO> ordersListById = orderService.listOrdersById(order_member_id);
        ModelAndView mav = new ModelAndView(viewName);
        mav.addObject("ordersListById", ordersListById);
        return mav;
    }

    @Override
    @RequestMapping(value = "/order/viewOrder.do", method = RequestMethod.GET)
    public ModelAndView viewOrder(@RequestParam("order_no") int order_no, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String viewName = (String) request.getAttribute("viewName");
    	OrderVO order = orderService.viewOrdersByNo(order_no);
        ModelAndView mav = new ModelAndView(viewName);
        mav.addObject("order", order);
        return mav;
    }
    
    @Override
    @RequestMapping(value = { "/order/viewOrderDetail.do" }, method = RequestMethod.GET)
	public ModelAndView viewOrderManager(HttpServletRequest request, HttpServletResponse response) throws Exception{
    	int orderNo = Integer.parseInt(request.getParameter("order_no"));
    	List<OrderVO> orderDetail = orderService.getOrderDetail(orderNo);
    	
    	OrderVO orderList = orderDetail.get(0);
    	int productNo = orderList.getProduct_no();
    	List<ProductVO> productDetail = productService.getProductDetail(productNo);
    	
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("orderDetail", orderDetail);
		mav.addObject("productDetail", productDetail);
		
		return mav;
	}

    @Override
    @RequestMapping(value = "/order/removeOrder.do", method = RequestMethod.GET)
    public ModelAndView removeOrder(@RequestParam("order_no") String order_no, @RequestParam("id") String id, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        int orderNo = Integer.parseInt(request.getParameter("order_no"));
        orderService.removeOrder(orderNo);
        String redirectUrl = "/order/listOrdersById.do?id="+ id;
        ModelAndView mav = new ModelAndView("redirect:" + redirectUrl);
        return mav;
    }
    
    @Override
    @RequestMapping(value = "/order/removeOrderManager.do", method = RequestMethod.GET)
    public ModelAndView removeOrderManager(@RequestParam("order_no") int order_no, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        int orderNo = Integer.parseInt(request.getParameter("order_no"));
        orderService.removeOrder(orderNo);
        ModelAndView mav = new ModelAndView("redirect:/order/listOrders.do");
        return mav;
    }
}
