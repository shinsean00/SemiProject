package com.mySpring.myapp.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.myapp.order.service.OrderService;
import com.mySpring.myapp.order.vo.OrderVO;
import com.mySpring.myapp.product.service.ProductService;
import com.mySpring.myapp.product.vo.ProductVO;

@Controller("productController")
//@EnableAspectJAutoProxy
public class ProductControllerImpl implements ProductController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	ProductVO productVO;
	
	@Autowired
	private OrderService orderService;
	
	
	@RequestMapping(value = { "/product/*.do" }, method = RequestMethod.GET)
	public ModelAndView viewPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = {"/product/mall_product_list.do"}, method = RequestMethod.GET)
	public ModelAndView showProductslist(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		List<ProductVO> productsList = productService.getProductsList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("productsList", productsList);
		return mav;
	}
	
	@Override
	@RequestMapping(value = {"/product/mall_product_detail.do"}, method = RequestMethod.GET)
	public ModelAndView showProductDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int productNo = Integer.parseInt(request.getParameter("product_no"));
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		List<ProductVO> productDetail = productService.getProductDetail(productNo);
		ModelAndView mav = new ModelAndView(viewName);
	    mav.addObject("productDetail", productDetail);
	    return mav;
	}
	
	@Override
	@RequestMapping(value = {"/product/orderComplete.do"}, method = RequestMethod.GET)
	public ModelAndView orderComplete(@RequestParam("id") String id,
			  @RequestParam("name") String name,
	          @RequestParam("address") String address,
	          @RequestParam("tel") String tel,
	          @RequestParam("quantity") int quantity,
	          @RequestParam("total_price") int totalPrice,
	          @RequestParam("date") String date,
	          @RequestParam("productNo") String productNo,
	          HttpServletRequest request, HttpServletResponse response) throws Exception {
		 	OrderVO order = new OrderVO();
		 	order.setOrder_name(name);
		    order.setOrder_member_id(id);
		    order.setOrder_address(address);
		    order.setOrder_tel(tel);
		    order.setOrder_quantity(quantity);
		    order.setOrder_total_price(totalPrice);
		    order.setOrder_date(date);
		    order.setProduct_no(Integer.parseInt(productNo));

		    orderService.registerOrder(order);

		    String viewName = (String) request.getAttribute("viewName");
		    System.out.println(viewName);
		    ModelAndView mav = new ModelAndView(viewName);
		    mav.addObject("orderName", order.getOrder_name());
		    mav.addObject("orderAddress", order.getOrder_address());
		    mav.addObject("orderDate", order.getOrder_date());
		    mav.addObject("orderPrice", order.getOrder_total_price());
		    return mav;
	}
	
	@Override
	@RequestMapping(value = "/product/listProducts.do", method = RequestMethod.GET)
	public ModelAndView listProducts(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		List productsList = productService.listProducts();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("productsList", productsList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/product/addProduct.do", method = RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") ProductVO product, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		int result = productService.addProduct(product);
		ModelAndView mav = new ModelAndView("redirect:/product/listProducts.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/product/viewProduct.do", method = RequestMethod.GET)
	public ModelAndView viewProduct(@RequestParam("product_no") String product_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ProductVO product = productService.getProductByNo(product_no);
		ModelAndView mav = new ModelAndView("/product/viewProduct");
		mav.addObject("product", product);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/product/editProduct.do", method = RequestMethod.GET)
	public ModelAndView editProduct(@RequestParam("product_no") String product_no, HttpServletRequest request, HttpServletResponse response) throws Exception {
	    ProductVO product = productService.getProductByNo(product_no);
	    ModelAndView mav = new ModelAndView("/product/editProduct");
	    mav.addObject("product", product);
	    return mav;
	}

	@Override
	@RequestMapping(value = "/product/updateProduct.do", method = RequestMethod.POST)
	public ModelAndView updateProduct(@ModelAttribute("product") ProductVO product,
	                                  @RequestParam("product_no") int product_no,
	                                  HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    
	    // 상품 번호를 ProductVO 객체에 설정
	    product.setProduct_no(product_no);
	    
	    productService.updateProduct(product);
	    
	    // 상품 번호를 사용하여 리다이렉트할 URL 생성
	    String redirectUrl = "/product/viewProduct.do?product_no=" + product_no;
	    
	    ModelAndView mav = new ModelAndView("redirect:" + redirectUrl);
	    return mav;
	}
	
	@Override
	@RequestMapping(value = "/product/removeProduct.do", method = RequestMethod.GET)
	public ModelAndView removeProduct(@RequestParam("product_no") String product_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		productService.removeProduct(product_no);
		ModelAndView mav = new ModelAndView("redirect:/product/listProducts.do");
		return mav;
	}
	
	@RequestMapping(value = "/product/*Form.do", method = RequestMethod.GET)
	private ModelAndView form(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}

	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}

	@Override
	public ModelAndView updateProduct(ProductVO product, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
