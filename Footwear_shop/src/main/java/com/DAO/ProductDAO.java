package com.DAO;

import java.util.List;
import com.entity.ProductDtls;
import com.entity.User;

public interface ProductDAO {
	
	public boolean addProducts(ProductDtls p);
	
	public List<ProductDtls> getAllProducts();
	
	public ProductDtls getProductById(int id);
	
	public boolean updateEditProducts(ProductDtls b);
	
	public boolean deleteProduct(int id);
	
	public List<ProductDtls> getAllShoes();
	
	public List<ProductDtls> getAllSandal();
	
	public List<ProductDtls> getAllmen();
	
	public List<ProductDtls> getAllwomen();
	
	public List<ProductDtls> getAllkids();
	
	public List<ProductDtls> getmenrunning();
	
	public List<ProductDtls> getmensport();
	
	public List<ProductDtls> getmencasual();
	
	public List<ProductDtls> getmenslipper();
	
	public List<ProductDtls> getmensandal();
	
	public List<ProductDtls> getmenpuma();
	
	public List<ProductDtls> getmencampus();
	
    public List<ProductDtls> getwomenrunning();
	
	public List<ProductDtls> getwomensport();
	
	public List<ProductDtls> getwomencasual();
	
	public List<ProductDtls> getwomenslipper();
	
	public List<ProductDtls> getwomensandal();
	
	public List<ProductDtls> getwomenpuma();
	
	public List<ProductDtls> getwomencampus();
	
    public List<ProductDtls> getkidsrunning();
	
	public List<ProductDtls> getkidssport();
	
	public List<ProductDtls> getkidscasual();
	
	public List<ProductDtls> getkidsslipper();
	
	public List<ProductDtls> getkidssandal();
	
	public List<ProductDtls> getProductBySearch(String ch);
	
	
	
	
	
	
}
