package com.niit.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.Authorities;
import com.niit.model.Customer;
import com.niit.model.User;
@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao {
	@Autowired
private SessionFactory sessionFactory;
	public void registerCustomer(Customer customer) {
	Session session=sessionFactory.getCurrentSession();
	User user=customer.getUser();
	Authorities authorities=user.getAuthorities();
	authorities.setUser(user);
//	
	
	session.save(customer);

	}
	public boolean isEmailUnique(String email) {
		Session session=sessionFactory.getCurrentSession();
		User user=(User)session.get(User.class, email);
		if(user==null)
			return true;
		else 
			return false;
	}
	public User getUser(String email) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		User user=(User)session.get(User.class, email);
		return user;
	}

}
