package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO{
	
	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}
	
	@Override
	public boolean addCart(Cart c) {
boolean f=false;
		
		try {
			String sql = "insert into cart(pid,uid,productName,brand,price,totalPrice,photo) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getPid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getProductName());
			ps.setString(4, c.getBrand());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			ps.setString(7,  c.getPhoto());
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
	@Override
	public List<Cart> getProductByUser(int uid) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c=null;
	     double totalPrice =0;
		
		try {
		
			String sql="select * from cart where uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Cart();
				c.setCid(rs.getInt(1));
				c.setPid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setProductName(rs.getString(4));
				c.setBrand(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				totalPrice = totalPrice +rs.getDouble(7);
				c.setPhoto(rs.getString(8));
				c.setTotalPrice(totalPrice);
				
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	@Override
	public boolean deleteProduct(int pid, int uid) {
		
boolean f=false;
		
		try {
			String sql="delete from cart where pid=? and uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			
			
		}
		
		
		return f;
		
	}

}
