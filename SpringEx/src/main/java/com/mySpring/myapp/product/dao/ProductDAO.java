package com.mySpring.myapp.product.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.myapp.product.vo.ProductVO;


public interface ProductDAO {
	 public List selectAllProductList() throws DataAccessException;
	 public int insertProduct(ProductVO productVO) throws DataAccessException ;
	 public int deleteProduct(String product_no) throws DataAccessException;
	 public ProductVO getProductByNo(String product_no) throws DataAccessException;
	 public void updateProduct(ProductVO productVO) throws DataAccessException;
	 public List<ProductVO> getProductsList() throws DataAccessException;
	 public List<ProductVO> getProductDetail(int product_no) throws DataAccessException;

}
