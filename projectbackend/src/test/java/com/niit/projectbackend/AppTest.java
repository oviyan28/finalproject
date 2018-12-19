package com.niit.projectbackend;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dao.ProductDaoImpl;
import com.niit.dbconfig.Dbconfiguration;
import com.niit.model.Product;
import com.niit.service.ProductService;
import com.niit.service.ProductServiceImpl;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * Unit test for simple App.
 */
public class AppTest 
{
	public static void main(String[] args) {
		ApplicationContext ac=new AnnotationConfigApplicationContext(Dbconfiguration.class,ProductDaoImpl.class,ProductServiceImpl.class);
		ProductService pds=(ProductService)ac.getBean("productServiceImpl");
		Product p=new Product();
		/*p.setProductname("Car");
		p.setProductdesc("BENZ GRAY");
		p.setQuantity(1);
		p.setPrice(1500000);*/
		
		pds.deleteProducts(1);
	}


}
    