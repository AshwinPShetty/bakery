package com.bakery.BakeryApp.service;

import java.util.List;
import java.util.Optional;

import com.bakery.BakeryApp.entity.Order;
import com.bakery.BakeryApp.entity.Product;

public interface OrderService {

	public List<Order> findAll();
	
	public boolean nameExists(String name);
	
	public void save(Order theOrder);
	
	public void deleteById(int id);
	
	public Optional<Order> findById(int id);
	
}
