package com.bakery.BakeryApp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bakery.BakeryApp.dao.OrderRepository;
import com.bakery.BakeryApp.dao.ProductRepository;
import com.bakery.BakeryApp.entity.Order;
import com.bakery.BakeryApp.entity.Product;
import com.bakery.BakeryApp.entity.User;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	public OrderRepository orderRepository;
	
	public OrderServiceImpl(OrderRepository theOrderRepository) {
		orderRepository = theOrderRepository;
	}

	@Override
	public List<Order> findAll() {
		return orderRepository.findAll();
	}


	@Override
	public boolean nameExists(String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void save(Order theOrder) {
		orderRepository.save(theOrder);
		
	}
	
	@Override
	public void deleteById(int id) {
		orderRepository.deleteById(id);

	}
	
	@Override
	public Optional<Order> findById(int id) {
		return orderRepository.findById(id);
	}

}
