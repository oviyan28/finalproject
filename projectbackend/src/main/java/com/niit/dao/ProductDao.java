package com.niit.dao;

import java.util.List;

import com.niit.model.Category;
import com.niit.model.Product;

public interface ProductDao
{
	void addProduct(Product product);
	void updateProduct(Product product);
	public void deleteProducts(int id);
	public Product selectProducts(int id);
	public List<Product> getAllProducts();
    public List<Category> getAllCategories();
    Product getId(int id);
      
}
