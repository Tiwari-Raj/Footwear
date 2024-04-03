package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.entity.Product_Order;

public class ProductOrderDAOImpl implements ProductOrderDAO{

	private Connection conn;

	public ProductOrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	@Override
	public int getOrderNo() {
		int i = 1;
		try {

			String sql = "select * from product_order ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	@Override
	public boolean saveOrder(List<Product_Order> blist) {
		boolean f = false;
		try {
			String sql = "insert into product_order(order_id,user_name,email,address,phone,product_name,brand,price,payment_type) values(?,?,?,?,?,?,?,?,?)";
            conn.setAutoCommit(false);
            
            PreparedStatement ps = conn.prepareStatement(sql);
            for(Product_Order b:blist) {
            	ps.setString(1, b.getOrderId());
            	ps.setString(2, b.getUserName());
            	ps.setString(3, b.getEmail());
            	ps.setString(4, b.getFulladdres());
            	ps.setString(5, b.getPhone());
            	ps.setString(6, b.getProductName());
            	ps.setString(7, b.getBrand());
            	ps.setString(8, b.getPrice());
            	ps.setString(9, b.getPaymentType());
            	ps.addBatch();
            	
            }
		int [] count=	ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	@Override
	public List<Product_Order> getProduct(String email) {
		List<Product_Order> list = new ArrayList<Product_Order>();
		Product_Order o=null;
		
		try {
			String sql="select * from product_order where email=?";
			   PreparedStatement ps = conn.prepareStatement(sql);
			   ps.setString(1, email);
			   ResultSet rs =ps.executeQuery();
			   while (rs.next()) {
				   o =new Product_Order();
				   o.setId(rs.getInt(1));
				   o.setOrderId(rs.getString(2));
				   o.setUserName(rs.getString(3));
				   o.setEmail(rs.getString(4));
				   o.setFulladdres(rs.getString(5));
				   o.setPhone(rs.getString(6));
				   o.setProductName(rs.getString(7));
				   o.setBrand(rs.getString(8));
				   o.setPrice(rs.getString(9));
				   o.setPaymentType(rs.getString(10));
				   list.add(o);
				   
			   }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Product_Order> getAllOrder() {
		List<Product_Order> list = new ArrayList<Product_Order>();
		Product_Order o=null;
		
		try {
			String sql="select * from product_order ";
			   PreparedStatement ps = conn.prepareStatement(sql);
			  
			   ResultSet rs =ps.executeQuery();
			   while (rs.next()) {
				   o =new Product_Order();
				   o.setId(rs.getInt(1));
				   o.setOrderId(rs.getString(2));
				   o.setUserName(rs.getString(3));
				   o.setEmail(rs.getString(4));
				   o.setFulladdres(rs.getString(5));
				   o.setPhone(rs.getString(6));
				   o.setProductName(rs.getString(7));
				   o.setBrand(rs.getString(8));
				   o.setPrice(rs.getString(9));
				   o.setPaymentType(rs.getString(10));
				   list.add(o);
				   
			   }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public boolean deleteOrder(String order_id) {
		boolean f=false;
		try {
			String sql="delete from product_order where order_id=?";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1, order_id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
