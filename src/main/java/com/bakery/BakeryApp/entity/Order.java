package com.bakery.BakeryApp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

@Entity
@Table(name="neworder")
public class Order {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="customer_name")
	private String customerName;
	
	@Column(name="contact_no")
	@Pattern(regexp="^\\d{10}$" , message="enter valid Phone Number")
	private String contactNumber;
	
	@Column(name="products")
	private String products;
	
	@Column(name="quantity")
	private int quantity;
	
	@Column(name="price")
	private String price;
	
	@Column(name="due_date")
	private String duedate;
	
	@Column(name="total")
	private String total;
	
	@Column(name="status")
	private String status;
	
	public Order() {
		
	}

	public Order(String customerName, String contactNumber, String products,int quantity, String price, String duedate, String total, String status) {
		this.customerName = customerName;
		this.contactNumber = contactNumber;
		this.products = products;
		this.quantity = quantity;
		this.price = price;
		this.duedate=duedate;
		this.total = total;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getProducts() {
		return products;
	}

	public void setProducts(String products) {
		this.products = products;
	}

	public String getDuedate() {
		return duedate;
	}

	public void setDuedate(String duedate) {
		this.duedate = duedate;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	
	


	
}