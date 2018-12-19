package com.niit.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletRequest;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.service.ProductService;


@Controller
public class ProductController {
	@Autowired
private ProductService 	productService;
	
public ProductController(){
	System.out.println("productController bean is created");
}
@RequestMapping(value="/all/getallproducts")
public String getallproducts(Model model){
	List<Product> products=productService.getAllProducts();
	model.addAttribute("products",products);
	return "listofproducts"; 
}
@RequestMapping(value="/all/getproduct")
public String getproduct(@RequestParam int id,Model model){
	Product product=productService.selectProducts(id);
	  model.addAttribute("productAttr",product);
	  return "viewproduct";
}

@RequestMapping(value="/admin/deleteproduct")
public String deleteproduct(@RequestParam int id){
	productService.deleteProducts(id);
	return "redirect:/all/getallproducts";
	
} 

@RequestMapping(value="/admin/getproductform")
public String getproductform(Model model){
	Product p=new Product();
	model.addAttribute("product",p);
	List<Category> categories=productService.getAllCategories();
	model.addAttribute("categories",categories);
	return "productform";
}
@RequestMapping(value="/admin/addproduct")
public String addproduct(@Valid @ModelAttribute Product product,BindingResult result,Model model, ServletRequest request){	
	if(result.hasErrors()){
       List<Category> categories=productService.getAllCategories();
		model.addAttribute("categories",categories);
		
		return "productform";
	}
	
	productService.addProducts(product);
	MultipartFile img=product.getImage();
	

	System.out.println(request.getServletContext().getRealPath("/"));
	
	
	Path path=Paths.get(request.getServletContext().getRealPath("/")+"/WEB-INF/resources/images/"+product.getId()+".png");
	
	
	try {
		if(img!=null && !img.isEmpty()){
		File file=new File(path.toString());
		img.transferTo(file);
		}
	} catch (IllegalStateException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return "redirect:/all/getallproducts";
}
@RequestMapping(value="/admin/getupdateproductform")
public String getupdateproductform(@RequestParam int id,Model model){
	Product product=productService.selectProducts(id);
	model.addAttribute("product",product);
	List<Category> categories=productService.getAllCategories();
	model.addAttribute("categories",categories);
	
	return "updateproductform";
}
@RequestMapping(value="/admin/updateproduct")
public String updateProduct(@Valid @ModelAttribute Product product,BindingResult result, ServletRequest request,Model model ){
	if(result.hasErrors()){
		List<Category> categories=productService.getAllCategories();
		model.addAttribute("categories",categories);
		return "updateproductform";
	}
	productService.updateProducts(product);
	MultipartFile img=product.getImage();
	System.out.println(request.getServletContext().getRealPath("/"));
	
	Path path=Paths.get(request.getServletContext().getRealPath("/")+"/WEB-INF/resources/images/"+product.getId()+".png");
	
	
	try {
		if(img!=null && !img.isEmpty()){
		File file=new File(path.toString());
		img.transferTo(file);
		}
	} catch (IllegalStateException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "redirect:/all/getallproducts";
}

}
