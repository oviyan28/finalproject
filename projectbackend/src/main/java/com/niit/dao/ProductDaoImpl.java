package com.niit.dao;

import java.util.List;



import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.Category;
import com.niit.model.Product;
@Repository
@Transactional public class ProductDaoImpl implements ProductDao {
	@Autowired
private SessionFactory sf;

	public ProductDaoImpl(){
		System.out.println("ProductDaoImpl bean is created");
	}

	public void addProduct(Product product) {
		Session session=sf.getCurrentSession();
		session.save(product);
	}

	public void updateProduct(Product product) {
		Session session=sf.getCurrentSession();
		session.update(product);
	}

	public Product selectProducts(int id) {
		Session session=sf.getCurrentSession();
		Product product=(Product)session.get(Product.class, id);
		return product;
	}

	public void deleteProducts(int id) {
		Session session=sf.getCurrentSession();
		Product product=(Product)session.get(Product.class, id);
		if(product!=null)
		session.delete(product);
	}

	public List<Product> getAllProducts() {
		Session session=sf.getCurrentSession();
		Query query=session.createQuery("from Product");
		 List<Product> products= query.list();
		 return products;
		
	}

	public List<Category> getAllCategories() {
		Session session=sf.openSession();
		Query query=session.createQuery("from Category");
		List<Category> categories=(List<Category>)query.list();
		return categories;


	}


	public Product getId(int id) {
		Session session=sf.openSession();
		Transaction tans=session.beginTransaction();
		
		Product product= (Product) session.get(Product.class, id);
		tans.commit();
		session.flush();
		session.close();
		return product;
	}


}
