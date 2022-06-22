package kr.co.dw.controller.admin;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dw.domain.AdminDTO;
import kr.co.dw.domain.MemberDTO;
import kr.co.dw.service.admin.AdminService;
import kr.co.dw.service.member.MemberService;
import kr.co.dw.utils.DWUtils;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	@Autowired
	private MemberService mService;

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
			
		return "redirect:/item/main";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		return "/admin/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(AdminDTO aDto, Model model) {
		
		AdminDTO alogin = aService.login(aDto);
		model.addAttribute("alogin", alogin);
		
		return "redirect:/item/main";
	}
	
	@RequestMapping(value = "/mlist", method = RequestMethod.GET)
	public String mlist(Model model) {
		
		
		List<MemberDTO> mlist = mService.list();
		
		model.addAttribute("mlist", mlist);
		
		return "/admin/mlist";
	
	
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		
		return "/admin/main";
	}
	
	
	
}
