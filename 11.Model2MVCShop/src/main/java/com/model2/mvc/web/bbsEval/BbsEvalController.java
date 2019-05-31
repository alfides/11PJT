package com.model2.mvc.web.bbsEval;

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
import com.model2.mvc.service.bbsEval.BbsEvalService;
import com.model2.mvc.service.domain.BbsEval;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;


//==> ��ǰ�� Controller
@Controller
@RequestMapping("/bbsEval/*")
public class BbsEvalController {
	
	///Field
	@Autowired
	@Qualifier("bbsEvalServiceImpl")
	private BbsEvalService bbsEvalService;
	//setter Method ���� ����
		
	public BbsEvalController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	
	@RequestMapping("/addBbsEval")
	public String writeBbsEval(@ModelAttribute("bbsEval") BbsEval bbsEval,
							@RequestParam("file") MultipartFile file,
							Model model,
							HttpServletRequest request) throws Exception {

		System.out.println("/addBbsEval");

		String savePath="C:\\Users\\USER\\git\\11PJT\\11.Model2MVCShop\\WebContent\\images\\uploadFiles";
		
		String originalFile=file.getOriginalFilename();	
		
		System.out.println(file.isEmpty());
		
		if(!file.isEmpty()) {
			try {
				byte[] bytes=file.getBytes();
				BufferedOutputStream stream=new BufferedOutputStream(new FileOutputStream(new File(savePath, originalFile)));
				stream.write(bytes);
				stream.close();
				model.addAttribute("resultMSG", "���� ���ε� ����");
			} catch(Exception e) {
				model.addAttribute("resultMSG", "���ε� ����");
			} 
		} else {
			model.addAttribute("resultMSG", "���� ���� ���");
		}
	
		bbsEval.setFilename(originalFile);
		
		bbsEvalService.addBbsEval(bbsEval);
		
		request.setAttribute("bbsEval", bbsEval);
		
		return "forward:/bbsEval/listBbsEval";
	}
	
	@RequestMapping("/getBbsEval")
	public String getBbsEval(@ModelAttribute("bbsEval") BbsEval bbsEval,
							@ModelAttribute("product") Product product,
							@RequestParam("contentNo") int contentNo,
							@RequestParam("menu") String menu, 
							Map<String, Object> map) throws Exception {

		System.out.println("/getBbsEval");
		
		bbsEval=bbsEvalService.getBbsEval(contentNo);
		ProductService productService=new ProductServiceImpl();
		
		map.put("bbsEval", bbsEval);
		map.put("product", product);
		
		return "forward:/bbsEval/readBbsEval.jsp?contentNo="+contentNo+"&menu="+menu;
		
	}

	
	@RequestMapping("/listBbsEval")
	public String listBbsEval(@ModelAttribute("search") Search search, 
							Model model) throws Exception {
		
		System.out.println("/listBbsEval");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map=bbsEvalService.getBbsEvalList(search);
		System.out.println("listBbsEval ����Ʈ : "+map.toString());
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("ListBbsEvalAction ::"+resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		
		return "forward:/bbsEval/listBbsEval.jsp";
	}
	
	@RequestMapping("/updateBbsEval")
	public String updateProduct(@ModelAttribute("bbsEval") BbsEval bbsEval,
								@RequestParam("file") MultipartFile file,
								Model model,
							HttpServletRequest request) throws Exception {

		System.out.println("/updateProduct");
		
		int contentNo=bbsEval.getContentNo();
		System.out.println(contentNo);
		
		String savePath="C:\\Users\\USER\\git\\11PJT\\11.Model2MVCShop\\WebContent\\images\\uploadFiles";
		
		String originalFile=file.getOriginalFilename();	
		
		System.out.println(file.isEmpty());
		
		if(!file.isEmpty()) {
			try {
				byte[] bytes=file.getBytes();
				BufferedOutputStream stream=new BufferedOutputStream(new FileOutputStream(new File(savePath, originalFile)));
				stream.write(bytes);
				stream.close();
				model.addAttribute("resultMSG", "���� ���ε� ����");
			} catch(Exception e) {
				model.addAttribute("resultMSG", "���ε� ����");
			} 
		} else {
			model.addAttribute("resultMSG", "���� ���� ���");
		}
	
		bbsEval.setFilename(originalFile);
		
		bbsEvalService.addBbsEval(bbsEval);
		
		request.setAttribute("bbsEval", bbsEval);
		
		System.out.println("UPA �� : "+bbsEval);
		
		return "forward:/bbsEval/readBbsEval.jsp?contentNo="+contentNo;
	}
	
	@RequestMapping("/removeBbsEval")
	public String removeBbsEval(@ModelAttribute("bbsEval") BbsEval bbsEval,
								HttpServletRequest request) throws Exception{
		System.out.println("/removeBbsEval");
		
		bbsEvalService.removeBbsEval(bbsEval);
		
		return "forward:/bbsEval/listBbsEval";
	}
}