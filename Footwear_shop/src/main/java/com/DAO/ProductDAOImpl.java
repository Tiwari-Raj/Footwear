package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.entity.ProductDtls;

public class ProductDAOImpl implements ProductDAO{
	
	private Connection conn;

	public ProductDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}



	@Override
	public boolean addProducts(ProductDtls p) {
		
		boolean f = false;
		try {
			String sql = "insert into product_dtls(productname,brand,price,category,type,photo) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProductname());
			ps.setString(2, p.getBrand());
			ps.setString(3, p.getPrice());
			ps.setString(4, p.getCategory());
			ps.setString(5, p.getType());
			ps.setString(6, p.getPhotoName());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	
	
	
	
	@Override
	public List<ProductDtls> getAllProducts() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;

		try {

			String sql = "select * from product_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	@Override
	public ProductDtls getProductById(int id) {
		ProductDtls b = null;
		try {

			String sql = "select * from product_dtls where productId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}
	
	
	
	@Override
	public boolean updateEditProducts(ProductDtls b) {
		boolean f=false;
		
		try {
			String sql = "update product_dtls set productname=?,brand=?,price=?,category=?,type=? where productId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getProductname());
			ps.setString(2, b.getBrand());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getCategory());
			ps.setString(5, b.getType());
			ps.setInt(6, b.getProductId());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	@Override
	public boolean deleteProduct(int id) {
		boolean f = false;

		try {

			String sql = "delete from product_dtls where productId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	
	
	@Override
	public List<ProductDtls> getAllShoes() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Running");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 5) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	
	@Override
	public List<ProductDtls> getAllSandal() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Sandal");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 5) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getAllmen() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Men");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	
	@Override
	public List<ProductDtls> getAllwomen() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Women");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getAllkids() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Kids");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getmenrunning() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Men");
			ps.setString(2, "Running");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getmensport() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Men");
			ps.setString(2, "Sports");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getmencasual() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Men");
			ps.setString(2, "Casual");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	
	@Override
	public List<ProductDtls> getmenslipper() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Men");
			ps.setString(2, "Slipper");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getmensandal() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Men");
			ps.setString(2, "Sandal");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getmenpuma() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && brand=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Men");
			ps.setString(2, "PUMA");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getmencampus() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && brand=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Men");
			ps.setString(2, "Campus");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getwomenrunning() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Women");
			ps.setString(2, "Running");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getwomensport() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Women");
			ps.setString(2, "Sports");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getwomencasual() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Women");
			ps.setString(2, "Casual");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getwomensandal() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Women");
			ps.setString(2, "Sandal");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getwomenslipper() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Women");
			ps.setString(2, "Slipper");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	

	
	@Override
	public List<ProductDtls> getwomencampus() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && brand=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Women");
			ps.setString(2, "Campus");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getwomenpuma() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && brand=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Women");
			ps.setString(2, "PUMA");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getkidsrunning() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Kids");
			ps.setString(2, "Running");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getkidssport() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Kids");
			ps.setString(2, "Sports");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getkidscasual() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Kids");
			ps.setString(2, "Casual");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getkidssandal() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Kids");
			ps.setString(2, "Sandal");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ProductDtls> getkidsslipper() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls  where category=? && type=? order by productId DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Kids");
			ps.setString(2, "Slipper");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setType(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	

}
