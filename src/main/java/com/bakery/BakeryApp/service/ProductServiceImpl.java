package com.bakery.BakeryApp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bakery.BakeryApp.dao.ProductRepository;
import com.bakery.BakeryApp.entity.Product;
import com.bakery.BakeryApp.entity.User;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	public ProductRepository productRepository;
	
	public ProductServiceImpl(ProductRepository theProductRepository) {
		productRepository = theProductRepository;
	}
	
	@Override
	public List<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public Optional<Product> findById(int id) {
		return productRepository.findById(id);
	}

	@Override
	public void deleteById(int id) {
		productRepository.deleteById(id);

	}

	@Override
	public void save(Product theProduct) {
		productRepository.save(theProduct);

	}
	
	@Override
	public Page<Product> findByProductId(Pageable pageable){
		return productRepository.findAll(pageable);
	} 
	

	@Override
	public boolean nameExists(String name) {

		Product theProduct = productRepository.findByProductName(name);
		
		if(theProduct == null) {
			return false;
		}
		return true;
	}

	@Override
	public Product findByProductName(String products) {
		return productRepository.findByProductName(products);
	}



}
