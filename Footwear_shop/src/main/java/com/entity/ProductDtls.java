package com.entity;

public class ProductDtls {
	
	private int productId;
	private String productname;
	private String brand;
	private String price;
	private String category;
	private String type;
	private String photoName;
	public ProductDtls() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDtls(String productname, String brand, String price, String category, String type, String photoName) {
		super();
		this.productname = productname;
		this.brand = brand;
		this.price = price;
		this.category = category;
		this.type = type;
		this.photoName = photoName;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	@Override
	public String toString() {
		return "ProductDtls [productId=" + productId + ", productname=" + productname + ", brand=" + brand + ", price="
				+ price + ", category=" + category + ", type=" + type + ", photoName=" + photoName + "]";
	}
	
	

}
