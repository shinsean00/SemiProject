package com.mySpring.myapp.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.myapp.member.vo.MemberVO;
import com.mySpring.myapp.product.dao.ProductDAO;
import com.mySpring.myapp.product.vo.ProductVO;



@Service("productService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List listProducts() throws DataAccessException {
		List productsList = null;
		productsList = productDAO.selectAllProductList();
		return productsList;
	}
	
	@Override
    public ProductVO getProductByNo(String product_no) throws Exception {
        return productDAO.getProductByNo(product_no);
    }

	@Override
	public int addProduct(ProductVO product) throws DataAccessException {
		return productDAO.insertProduct(product);
	}
	
	@Override
	public void updateProduct(ProductVO product) throws DataAccessException {
		productDAO.updateProduct(product);
	}
	
	@Override
	public int removeProduct(String product_no) throws DataAccessException {
		return productDAO.deleteProduct(product_no);
	}
	
	@Override
	public List<ProductVO> getProductsList() throws DataAccessException {
		return productDAO.getProductsList();
	}
	
	@Override
	public List<ProductVO> getProductDetail(int product_no) throws DataAccessException {
		return productDAO.getProductDetail(product_no);
	}
}
