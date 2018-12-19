package com.niit.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.model.CartItem;
import com.niit.model.Customer;
import com.niit.model.CustomerOrder;
import com.niit.model.Product;
import com.niit.model.ShippingAddress;
import com.niit.model.User;
import com.niit.service.CartItemService;
import com.niit.service.CustomerService;
import com.niit.service.ProductService;

@Controller
public class CartItemController {
	@Autowired
private CartItemService cartItemService;
@Autowired
private ProductService productService;
@Autowired
private CustomerService customerService;
@RequestMapping(value="/cart/addtocart/{id}")
public String addToCart(
		@PathVariable int id,
		@RequestParam int requestedQuantity,
		@AuthenticationPrincipal Principal principal
		){
	String email=  principal.getName();
	Product product=productService.selectProducts(id);
	User user=customerService.getUser(email);
	List<CartItem> cartItems=cartItemService.getCart(email);
	for(CartItem cartItem:cartItems){
		if(cartItem.getProduct().getId()==id){
			cartItem.setQuantity(requestedQuantity);
			cartItem.setTotalPrice(requestedQuantity * product.getPrice());
		    cartItemService.addToCart(cartItem);
		    return "redirect:/cart/getcart";
		}
	}
	
	CartItem cartItem=new CartItem();
	cartItem.setProduct(product);
	cartItem.setUser(user);
	cartItem.setQuantity(requestedQuantity);
	cartItem.setTotalPrice(requestedQuantity * product.getPrice());
	
	cartItemService.addToCart(cartItem);
	
	return "redirect:/cart/getcart";
}
@RequestMapping(value="/cart/getcart")
public String getCart(@AuthenticationPrincipal Principal principal,Model model,HttpSession session){ 
	String email=principal.getName();
	List<CartItem> cartItems=cartItemService.getCart(email);
	session.setAttribute("cartSize", cartItems.size());
	model.addAttribute("cartItems",cartItems);
	return "cart";
}
@RequestMapping(value="/cart/removecartitem/{cartItemId}")
public String removeCartItem(@PathVariable int cartItemId){
	cartItemService.removeCartItem(cartItemId);
	return "redirect:/cart/getcart";
}

@RequestMapping(value="/cart/clearcart")
public String clearCart(@AuthenticationPrincipal Principal principal){
	List<CartItem> cartItems=cartItemService.getCart(principal.getName());
	for(CartItem cartItem:cartItems)
		cartItemService.removeCartItem(cartItem.getCartItemId());
	return "redirect:/cart/getcart";
}

@RequestMapping(value="/cart/shippingaddressform")
public String getShippingAddressForm(@AuthenticationPrincipal Principal principal,Model model){
	String email=principal.getName();
     User user=customerService.getUser(email);
     Customer customer= user.getCustomer();
     ShippingAddress shippingAddress=customer.getShippingaddress();
     model.addAttribute("shippingaddress",shippingAddress);
	return "shippingaddress";
}

@RequestMapping(value="/cart/createorder")
public String createCustomerOrder(@ModelAttribute ShippingAddress shippingaddress,
		Model model,
		@AuthenticationPrincipal Principal principal,HttpSession session){
	String email=principal.getName();
	User user=customerService.getUser(email);
	List<CartItem> cartItems=cartItemService.getCart(email);
	Customer customer=user.getCustomer();
	customer.setShippingaddress(shippingaddress);
	
	user.setCustomer(customer);
	customer.setUser(user);
	
	
	double grandTotal=0.0;
	for(CartItem cartItem:cartItems){
		grandTotal=grandTotal+cartItem.getTotalPrice();
	}
	
	
	CustomerOrder customerOrder=new CustomerOrder();
	customerOrder.setPurchaseDate(new Date());
	customerOrder.setGrandTotal(grandTotal);
	customerOrder.setUser(user);
	
	if(cartItems.size()>0)
	      cartItemService.createCustomerOrder(customerOrder);
	
	for(CartItem cartItem:cartItems){
		Product product=cartItem.getProduct();
		product.setQuantity(product.getQuantity() - cartItem.getQuantity());
		productService.updateProducts(product);
		cartItemService.removeCartItem(cartItem.getCartItemId());
	}
	session.setAttribute("cartSize", 0);
	
	model.addAttribute("cartItems",cartItems);
	model.addAttribute("customerorder",customerOrder);
	return "orderdetails";
}

}