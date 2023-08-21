package com.mySpring.myapp.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.myapp.order.vo.OrderVO;

public interface OrderController {
	public ModelAndView listOrders(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listOrdersById(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewOrder(@RequestParam("order_no") int order_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewOrderManager(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeOrder(@RequestParam("order_no") String order_no, @RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeOrderManager(@RequestParam("order_no") int order_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
