package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

//==> 备概包府 Controller
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	///Constructor
	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	///Method
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping("/addPurchaseView")
	public String addPurchaseView(@ModelAttribute("purchase") Purchase purchase,
								@ModelAttribute("product") Product product,
								@ModelAttribute("user") User user,
								@RequestParam("prodNo") int prodNo,
								@RequestParam("userId") String userId,
								Map<String , Object> map) throws Exception{
		
		System.out.println("/addPurchaseView");
		
		user=userService.getUser(userId);
		product=productService.getProduct(prodNo);

		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		
		map.put("purchase", purchase);
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	@RequestMapping("/addPurchase")
	public String addPurchase(@ModelAttribute("purchase") Purchase purchase,
							@ModelAttribute("product") Product product,
							@ModelAttribute("user") User user,
							@RequestParam("prodNo") int prodNo,
							@RequestParam("buyerId") String userId,
							@RequestParam("tranCode") String tranCode,
							Map<String , Object> map) throws Exception{
		
		System.out.println("/addPurchase");
		
		user=userService.getUser(userId);
		product=productService.getProduct(prodNo);

		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		purchase.setTranCode(tranCode);
		
		purchaseService.addPurchase(purchase);
		
		map.put("purchase", purchase);
		
		return "forward:/purchase/addPurchase.jsp";
		
	}
	
	@RequestMapping("/getPurchase")
	public String getPurchase(@ModelAttribute("purchase") Purchase purchase,
							@RequestParam("tranNo") int tranNo,
							Map<String, Object> map) throws Exception{
	
		purchase=purchaseService.getPurchase(tranNo);
		
		map.put("purchase", purchase);
		
		return "forward:/purchase/getPurchase.jsp";
	}
	
	@RequestMapping("/updateTranCode1")
	public String updateTranCode1(@ModelAttribute("purchase") Purchase purchase,
								@RequestParam("prodNo") int prodNo,
								@RequestParam("tranCode") String tranCode,
								Map<String, Object> map) throws Exception{
		
		System.out.println("/updateTranCode1");
		
		purchase=purchaseService.getPurchase2(prodNo);
		
		purchase.setTranCode(tranCode);
		
		purchaseService.updateTranCode(purchase);
		
		map.put("purchase", purchase);
		
		return "forward:/product/listProduct?menu=manage";
	}
	
	@RequestMapping("/updateTranCode2")
	public String updateTranCode2(@ModelAttribute("purchase") Purchase purchase,
								@RequestParam("tranNo") int tranNo,
								@RequestParam("tranCode") String tranCode,
								Map<String, Object> map) throws Exception{
		
		System.out.println("/updateTranCode2");
		
		purchase=purchaseService.getPurchase(tranNo);
		
		purchase.setTranCode(tranCode);
		
		purchaseService.updateTranCode(purchase);
		
		map.put("purchase", purchase);
		
		return "forward:/purchase/listPurchase";
	}
	
	@RequestMapping("/listPurchase")
	public String listPurchase(@ModelAttribute("search") Search search,
								HttpServletRequest request,
								Model model) throws Exception{
		
		System.out.println("/listPurchase");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println(pageSize);
		
		User user=(User)request.getSession().getAttribute("user");
		Purchase purchase=new Purchase();
		
		purchase.setBuyer(user);
		System.out.println(purchase);
		String buyerId=purchase.getBuyer().getUserId();
		System.out.println(buyerId);
		
		Map<String, Object> map=purchaseService.getPurchaseList(search, buyerId);
		System.out.println(map);
		
		Page resultPage=
				new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("ListPurchase ::"+resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("buyerId", buyerId);
		
		return "forward:/purchase/listPurchase.jsp";
	}
	
	@RequestMapping("/updatePurchaseView")
	public String updatePurchaseView(@ModelAttribute("purchase") Purchase purchase,
								@ModelAttribute("product") Product product,
								@ModelAttribute("user") User user,
								@RequestParam("tranNo") int tranNo,
								Map<String , Object> map) throws Exception{
		
		System.out.println("/updatePurchaseView");
		
		purchase=purchaseService.getPurchase(tranNo);
		
		map.put("purchase", purchase);
		
		return "forward:/purchase/updatePurchaseView.jsp";
	}
	
	@RequestMapping("/updatePurchase")
	public String updatePurchase(@ModelAttribute("purchase") Purchase purchase, 
							HttpServletRequest request) throws Exception {

		System.out.println("/updatePurchase");
		
		purchaseService.updatePurchase(purchase);
		
		System.out.println("UPurA 场 : "+purchase);
		
		return "forward:/purchase/listPurchase";
	}
	
	@RequestMapping("/removePurchase")
	public String removePurchase(@ModelAttribute("purchase") Purchase purchase,
								HttpServletRequest request) throws Exception{
		System.out.println("/removePurchase");
		
		purchaseService.removePurchase(purchase);
		
		return "forward:/purchase/listPurchase";
	}
}
