package com.niit.service;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.dao.ProductDao;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.service.ProductService;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao pdao;
	public ProductServiceImpl() {
		System.out.println("ProductServiceImplementation Bean Has Been Created");
	}
	public void addProducts(Product product) {
	pdao.addProduct(product);
	}
	public void updateProducts(Product product) {
		pdao.updateProduct(product);
	}
	public void deleteProducts(int id) {
		pdao.deleteProducts(id);
	}
	public Product selectProducts(int id) {
		
		return pdao.selectProducts(id);
		
	}
	public List<Product> getAllProducts()
	{
		return pdao.getAllProducts();
	}

	public List<Category> getAllCategories() {

		return pdao.getAllCategories();
	}

	public Product getId(int id) {

		return pdao.getId(id);
	}

}
