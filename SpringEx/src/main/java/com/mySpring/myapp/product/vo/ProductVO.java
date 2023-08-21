package com.mySpring.myapp.product.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("productVO")
public class ProductVO {
	private int product_no; 
	private String product_type;
	private String product_name;
	private String product_origin;
	private int product_price;
	private int product_quantity;
	private String product_regmember_id;
	private Date product_regdate;
	private String product_modmember_id;
	private Date product_moddate;
	
	public ProductVO() {
		product_no = 0;
	    product_type = "";
	    product_name = "";
	    product_origin = "";
	    product_price = 0;
	    product_quantity = 0;
	    product_regmember_id = "";
	    product_regdate = null;
	    product_modmember_id = "";
	    product_moddate = null;
	
	}

	public ProductVO(int product_no, String product_type, String product_name, String product_origin, int product_price,
			int product_quantity, String product_regmember_id, Date product_regdate, String product_modmember_id,
			Date product_moddate) {
		this.product_no = product_no;
		this.product_type = product_type;
		this.product_name = product_name;
		this.product_origin = product_origin;
		this.product_price = product_price;
		this.product_quantity = product_quantity;
		this.product_regmember_id = product_regmember_id;
		this.product_regdate = product_regdate;
		this.product_modmember_id = product_modmember_id;
		this.product_moddate = product_moddate;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getProduct_type() {
		return product_type;
	}

	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_origin() {
		return product_origin;
	}

	public void setProduct_origin(String product_origin) {
		this.product_origin = product_origin;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_quantity() {
		return product_quantity;
	}

	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}

	public String getProduct_regmember_id() {
		return product_regmember_id;
	}

	public void setProduct_regmember_id(String product_regmember_id) {
		this.product_regmember_id = product_regmember_id;
	}

	public Date getProduct_regdate() {
		return product_regdate;
	}

	public void setProduct_regdate(Date product_regdate) {
		this.product_regdate = product_regdate;
	}

	public String getProduct_modmember_id() {
		return product_modmember_id;
	}

	public void setProduct_modmember_id(String product_modmember_id) {
		this.product_modmember_id = product_modmember_id;
	}

	public Date getProduct_moddate() {
		return product_moddate;
	}

	public void setProduct_moddate(Date product_moddate) {
		this.product_moddate = product_moddate;
	}
	
}

