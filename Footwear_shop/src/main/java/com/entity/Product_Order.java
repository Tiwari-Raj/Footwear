package com.entity;

public class Product_Order {
	
	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String phone;
	private String fulladdres;
	private String productName;
	private String brand;
	private String price;
	private String paymentType;
	
	public Product_Order() {
		super();
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFulladdres() {
		return fulladdres;
	}

	public void setFulladdres(String fulladdres) {
		this.fulladdres = fulladdres;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	@Override
	public String toString() {
		return "Product_Order [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
				+ ", phone=" + phone + ", fulladdres=" + fulladdres + ", productName=" + productName + ", brand="
				+ brand + ", price=" + price + ", paymentType=" + paymentType + "]";
	}
	
	
	

}
