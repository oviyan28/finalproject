package com.niit.crudoperation;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dao.ProductDaoImpl;
import com.niit.dbconfig.Dbconfiguration;
import com.niit.model.Product;
import com.niit.service.ProductService;
import com.niit.service.ProductServiceImpl;

public class SelectAllProducts {
	public static void main(String[] args) {
		ApplicationContext ac=new AnnotationConfigApplicationContext(Dbconfiguration.class,ProductDaoImpl.class,ProductServiceImpl.class);
		ProductService pds=(ProductService)ac.getBean("productServiceImpl");
		List<Product> products=pds.getAllProducts();
		 System.out.println("");
		 System.out.println("************************************************** SELECTION THROUGH GET() METHOD ************************************************************");
		 System.out.println("--------------------------------------------------------------------------------------------------------");
		 System.out.println("PRODUCT ID"+"\t"+"PRODUCT NAME"+"\t"+"PRODUCT DESCRIPTION"+"\t"+"PRODUCT PRICE"+"\t"+"PRODUCT QUANTITY");
		for(Product p:products)
		{
			if(p!=null)
			 {

				
				 System.out.println("--------------------------------------------------------------------------------------------------------");
				 System.out.println(p.getId()+"\t\t"+p.getProductname()+"\t\t"+p.getProductdesc()+"\t\t"+p.getPrice()+"\t\t"+p.getQuantity());
				 
			 }
			else
				{
					
					System.out.println("RECORD RETRIEVAL FAILED");
				}
		}
		System.out.println("--------------------------------------------------------------------------------------------------------");
		 System.out.println("RECORD RETRIEVED SUCCESSFULLY");
	}

}
