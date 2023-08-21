package com.mySpring.myapp.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.myapp.product.vo.ProductVO;


public interface ProductController {
	public ModelAndView listProducts(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addProduct(@ModelAttribute("info") ProductVO productVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewProduct(@RequestParam("product_no") String product_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView editProduct(@RequestParam("product_no") String product_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateProduct(@ModelAttribute("product") ProductVO product, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeProduct(@RequestParam("product_no") String product_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateProduct(ProductVO product, int product_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView showProductslist(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView showProductDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView orderComplete(@RequestParam("id") String id,
									  @RequestParam("name") String name,
							          @RequestParam("address") String address,
							          @RequestParam("tel") String tel,
							          @RequestParam("quantity") int quantity,
							          @RequestParam("total_price") int totalPrice,
							          @RequestParam("date") String date,
							          @RequestParam("productNo") String productNo,
							          HttpServletRequest request, HttpServletResponse response) throws Exception;
}
