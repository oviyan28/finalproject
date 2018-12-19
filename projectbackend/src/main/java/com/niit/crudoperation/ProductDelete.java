package com.niit.crudoperation;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dao.ProductDaoImpl;
import com.niit.dbconfig.Dbconfiguration;
import com.niit.model.Product;
import com.niit.service.ProductService;
import com.niit.service.ProductServiceImpl;

public class ProductDelete {

	public static void main(String[] args) {
		ApplicationContext ac=new AnnotationConfigApplicationContext(Dbconfiguration.class,ProductDaoImpl.class,ProductServiceImpl.class);
		ProductService pds=(ProductService)ac.getBean("productServiceImpl");
		Product p=new Product();
		pds.deleteProducts(1);
	}

}
