package com.model2.mvc.web.product;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


//==> 상품관리 Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	
	@RequestMapping("/addProduct")
	public String addProduct(@ModelAttribute("product") Product product,
							@RequestParam("file") MultipartFile file,
							Model model,
							HttpServletRequest request) throws Exception {

		System.out.println("/addProduct"+product.getManuDate());

		String savePath="C:\\Users\\USER\\git\\11PJT\\11.Model2MVCShop\\WebContent\\images\\uploadFiles";
		
		String originalFile=file.getOriginalFilename();	
		
		System.out.println(file.isEmpty());
		
		if(!file.isEmpty()) {
			try {
				byte[] bytes=file.getBytes();
				BufferedOutputStream stream=new BufferedOutputStream(new FileOutputStream(new File(savePath, originalFile)));
				stream.write(bytes);
				stream.close();
				model.addAttribute("resultMSG", "파일 업로드 성공");
			} catch(Exception e) {
				model.addAttribute("resultMSG", "업로드 실패");
			} 
		} else {
			model.addAttribute("resultMSG", "파일 선택 요망");
		}
	
		product.setFileName(originalFile);
		
		productService.addProduct(product);
		
		request.setAttribute("product", product);
		
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping("/getProduct")
	public String getProduct(@ModelAttribute("product") Product product,
							@RequestParam("prodNo") int prodNo,
							@RequestParam("menu") String menu, 
							Map<String, Object> map) throws Exception {

		System.out.println("/getProduct");
		
		product=productService.getProduct(prodNo);
		
		System.out.println("AAAA : "+product);
		map.put("product", product);
		
		if(menu.equals("manage")) {
			
			System.out.println("GPA MENU값 : "+menu);
			System.out.println("VO값 : "+product);
			return "forward:/product/updateProduct.jsp";
		}
		return "forward:/product/readProduct.jsp";
		
	}

	
	@RequestMapping(value="listProduct")
	public String listProduct(@ModelAttribute("search") Search search,
							@RequestParam("menu") String menu, 
							Model model) throws Exception {
		
		System.out.println("/listProduct");
		System.out.println(menu);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map=productService.getProductList(search);
		System.out.println("listProduct 리스트 : "+map.toString());
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("ListProductAction ::"+resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		
		return "forward:/product/listProduct.jsp";
	}
	
	@RequestMapping("/updateProduct")
	public String updateProduct(@ModelAttribute("product") Product product,
								@RequestParam("file") MultipartFile file,
								Model model,
							HttpServletRequest request) throws Exception {

		System.out.println("/updateProduct");
		
		int prodNo=product.getProdNo();
		System.out.println(prodNo);
		
		String savePath="C:\\Users\\USER\\git\\11PJT\\11.Model2MVCShop\\WebContent\\images\\uploadFiles";
		
		String originalFile=file.getOriginalFilename();	
		
		System.out.println(file.isEmpty());
		
		if(!file.isEmpty()) {
			try {
				byte[] bytes=file.getBytes();
				BufferedOutputStream stream=new BufferedOutputStream(new FileOutputStream(new File(savePath, originalFile)));
				stream.write(bytes);
				stream.close();
				model.addAttribute("resultMSG", "파일 업로드 성공");
			} catch(Exception e) {
				model.addAttribute("resultMSG", "업로드 실패");
			} 
		} else {
			model.addAttribute("resultMSG", "파일 선택 요망");
		}
	
		product.setFileName(originalFile);
		
		productService.updateProduct(product);
		
		request.setAttribute("product", product);
		
		System.out.println("UPA 끝 : "+product);
		

		
		return "forward:/product/readProduct.jsp?prodNo="+prodNo;
	}
}