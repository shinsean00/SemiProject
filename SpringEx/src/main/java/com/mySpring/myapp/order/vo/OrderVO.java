package com.mySpring.myapp.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.mySpring.myapp.product.vo.ProductVO;

@Component("orderVO")
public class OrderVO {
    private int order_no;
    private String order_date;
    private int order_quantity;
    private int order_total_price;
    private String order_member_id;
    private String order_name;
    private String order_tel;
    private String order_address;
    private String order_paytype;
    private String order_paid;
    private Date order_paydate;
    private String order_remark;
    private int product_no;
    private ProductVO product;
    

    public OrderVO() {
    }

    public OrderVO(int order_no, String order_date, int order_quantity, int order_total_price, String order_member_id, String order_name,
            String order_tel, String order_address, String order_paytype, String order_paid, Date order_paydate,
            String order_remark, int product_no) {
        this.order_no = order_no;
        this.order_date = order_date;
        this.order_quantity = order_quantity;
        this.order_total_price = order_total_price;
        this.order_member_id = order_member_id;
        this.order_tel = order_tel;
        this.order_address = order_address;
        this.order_paytype = order_paytype;
        this.order_paid = order_paid;
        this.order_paydate = order_paydate;
        this.order_remark = order_remark;
        this.product_no = product_no;
        this.order_name = order_name;
    }

    public int getOrder_no() {
        return order_no;
    }

    public void setOrder_no(int order_no) {
        this.order_no = order_no;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public int getOrder_quantity() {
        return order_quantity;
    }

    public void setOrder_quantity(int order_quantity) {
        this.order_quantity = order_quantity;
    }

    public int getOrder_total_price() {
        return order_total_price;
    }

    public void setOrder_total_price(int order_total_price) {
        this.order_total_price = order_total_price;
    }

    public String getOrder_member_id() {
        return order_member_id;
    }

    public void setOrder_member_id(String order_member_id) {
        this.order_member_id = order_member_id;
    }

    public String getOrder_name() {
        return order_name;
    }
    
    public void setOrder_name(String order_name) {
        this.order_name = order_name;
    }

    public String getOrder_tel() {
        return order_tel;
    }

    public void setOrder_tel(String order_tel) {
        this.order_tel = order_tel;
    }

    public String getOrder_address() {
        return order_address;
    }

    public void setOrder_address(String order_address) {
        this.order_address = order_address;
    }

    public String getOrder_paytype() {
        return order_paytype;
    }

    public void setOrder_paytype(String order_paytype) {
        this.order_paytype = order_paytype;
    }

    public String getOrder_paid() {
        return order_paid;
    }

    public void setOrder_paid(String order_paid) {
        this.order_paid = order_paid;
    }

    public Date getOrder_paydate() {
        return order_paydate;
    }

    public void setOrder_paydate(Date order_paydate) {
        this.order_paydate = order_paydate;
    }

    public String getOrder_remark() {
        return order_remark;
    }

    public void setOrder_remark(String order_remark) {
        this.order_remark = order_remark;
    }

    public int getProduct_no() {
        return product_no;
    }

    public void setProduct_no(int product_no) {
        this.product_no = product_no;
    }

    public ProductVO getProduct() {
        return product;
    }

    public void setProduct(ProductVO product) {
        this.product = product;
    }
    
}
