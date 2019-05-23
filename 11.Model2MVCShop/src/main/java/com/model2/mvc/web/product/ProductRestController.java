package com.model2.mvc.web.product;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


//==> 惑前包府 Controller
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 备泅 臼澜
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}

	//@RequestMapping("/addProduct")
	public String addProduct(@ModelAttribute("product") Product product,
							HttpServletRequest request) throws Exception {

		System.out.println("/addProduct"+product.getManuDate());

		
		productService.addProduct(product);
		
		request.setAttribute("product", product);
		
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping(value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception {

		System.out.println("/product/json/getProduct : GET");

		return productService.getProduct(prodNo);
		
	}

	
	//@RequestMapping(value="listProduct")
//	public String listProduct(@ModelAttribute("search") Search search,
//							@RequestParam("menu") String menu, 
//							Model model) throws Exception {
//		
//		System.out.println("/listProduct");
//		System.out.println(menu);
//		
//		if(search.getCurrentPage() ==0 ){
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		
//		Map<String, Object> map=productService.getProductList(search);
//		System.out.println("listProduct 府胶飘 : "+map.toString());
//		
//		Page resultPage	= 
//				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println("ListProductAction ::"+resultPage);
//		
//		model.addAttribute("list", map.get("list"));
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
//		
//		
//		return "forward:/product/listProduct.jsp";
//	}
	
//	//@RequestMapping("/updateProduct")
//	public String updateProduct(@ModelAttribute("product") Product product, 
//							HttpServletRequest request) throws Exception {
//
//		System.out.println("/updateProduct");
//		
//		int prodNo=Integer.parseInt(request.getParameter("prodNo"));
//		
//		productService.updateProduct(product);
//		
//		System.out.println("UPA 场 : "+product);
//		
//
//		
//		return "forward:/product/readProduct.jsp?prodNo="+prodNo;
//	}
}