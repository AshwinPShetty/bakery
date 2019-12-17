package com.bakery.BakeryApp.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bakery.BakeryApp.entity.Order;
import com.bakery.BakeryApp.entity.Product;
import com.bakery.BakeryApp.service.OrderService;
import com.bakery.BakeryApp.service.ProductService;

@Controller
public class OrderController {
	
	@Autowired
	public ProductService productService;
	
	@Autowired
	public OrderService orderService;
	
	public OrderController(OrderService theOrderService) {
		
	orderService = theOrderService;
	}
	
	@GetMapping("/orders")
	public String showProducts(Model theModel) {
		
		List<Order> theOrder = orderService.findAll();
		theModel.addAttribute("order", theOrder);
		return "order";
	}
	
	@GetMapping("/orders/register")
	public String registerProduct(Model theModel) {
		
		Order theOrder = new Order();
		theModel.addAttribute("order",theOrder);
		
		List<Product> theProducts = productService.findAll();
		theModel.addAttribute("products", theProducts);
		return "neworder";
	}
	
	@PostMapping("/orders/register")
	public String registeredProduct(@ModelAttribute("order") @Valid Order theOrder ,
			BindingResult bindingResult,ModelMap theModel) {
		
		if(bindingResult.hasErrors()){
			List<Product> theProducts = productService.findAll();
			theModel.addAttribute("products", theProducts);
			return "neworder";
			
		}
		 
			//decrement logic and checking product quantity
			Product productName = productService.findByProductName(theOrder.getProducts());
			if(theOrder.getQuantity() > productName.getQuantity()) {
				List<Product> theProducts = productService.findAll();
				theModel.addAttribute("products",theProducts); 
				theModel.put("error", "the quantity available is "+ productName.getQuantity());
				return "neworder";
			}
				
			productName.setQuantity(productName.getQuantity() - theOrder.getQuantity());
			productService.save(productName); 
		
		orderService.save(theOrder);
		return "redirect:/orders";
	}
	
	@GetMapping("/orders/update")
	public String updateOrder(@RequestParam("orderId") int id , Model theModel) {
		
		Optional<Order> theOrder = orderService.findById(id);
		theModel.addAttribute("order", theOrder);
		
		List<Product> theProducts = productService.findAll();
		theModel.addAttribute("products", theProducts);
		
		return "edit-order";
	}
	
	@PostMapping("/orders/update")
	public String updateOrder(@ModelAttribute("order") Order theOrder) {	
		
		orderService.save(theOrder);
		return "redirect:/orders";
	}
	
	@GetMapping("/orders/delete")
	public String deleteOrder(@RequestParam("orderId") int id, Model theModel) {
		
		Optional<Order> theOrder = orderService.findById(id);
		if(theOrder == null) {
			return "user not found";
		}
		orderService.deleteById(id);
		return "redirect:/orders";
	}			 

}
