package com.niit.service;

import com.niit.model.Customer;
import com.niit.model.User;

public interface CustomerService {
	void registerCustomer(Customer customer);
    boolean isEmailUnique(String email);
    User getUser(String email);

}
