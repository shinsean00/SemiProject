package com.mySpring.myapp.product.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.myapp.product.vo.ProductVO;

public interface ProductService {
	public List listProducts() throws DataAccessException;
	public ProductVO getProductByNo(String product_no) throws Exception;
	public int addProduct(ProductVO productVO) throws DataAccessException;
	public void updateProduct(ProductVO product) throws DataAccessException;
	public int removeProduct(String product_no) throws DataAccessException;
	public List<ProductVO> getProductsList() throws DataAccessException;
	public List<ProductVO> getProductDetail(int product_no) throws DataAccessException;
}
