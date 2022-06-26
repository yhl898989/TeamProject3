package kr.co.dw.controller.order;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.dw.domain.OrderDTO;
import kr.co.dw.domain.OrderPageDTO;
import kr.co.dw.service.member.MemberService;
import kr.co.dw.service.order.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService oService;
	@Autowired
	private MemberService mService;

	@RequestMapping(value = "/order/{mid}", method = RequestMethod.GET)
	public String orderPage(@PathVariable("mid") String mid, OrderPageDTO opd, Model model) {

		System.out.println("mid  :" + mid);
		System.out.println("orders :" + opd.getOrders());
		
		
		 model.addAttribute("orderList", oService.getItemsInfo(opd.getOrders()));
		 model.addAttribute("memberInfo", mService.mypage(mid));
		 

		return "/order";

	}
	
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String orderPagePost(OrderDTO od, HttpServletRequest request) {
		
		System.out.println("::::::::::::::::::::::::");
		System.out.println(od);
		
		oService.order(od);
		
		return "redirect:/";
	}
	
}
