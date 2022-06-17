package kr.co.dw.controller.member;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dw.domain.MemberDTO;
import kr.co.dw.service.member.MemberService;
import kr.co.dw.utils.DWUtils;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
			
		return "redirect:/item/list";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		return "/member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberDTO mDto, Model model) {
		
		MemberDTO login = mService.login(mDto);
		//System.out.println(login);
		model.addAttribute("login", login);
		
		return "redirect:/item/list";
	}
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(MemberDTO dto, HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		session.invalidate();
		mService.delete(dto);
	
		
		return "redirect:/item/list";
	}
	
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String deleteUI(@PathVariable("id") String id, Model model) {
		
		
		
		model.addAttribute("id", id);
		return "/member/delete";
	}
	

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(MemberDTO dto) {
		
		mService.update(dto);
		
		return "redirect:/member/mypage/"+dto.getId();
	}
	
	
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("id") String id, Model model) {
		
		MemberDTO dto = mService.updateUI(id);
		
		model.addAttribute("dto", dto);
		return "/member/update";
	}
	
	
	@RequestMapping(value = "/mypage/{id}") 
	public String mypage(@PathVariable("id") String id, Model model) {
		
		MemberDTO dto = mService.mypage(id);
		
		model.addAttribute("dto", dto);
		return "/member/mypage";
	}
	
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		
		
		List<MemberDTO> list = mService.list();
		
		model.addAttribute("list", list);
		
		return "/member/list";
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MemberDTO dto) {
		
		mService.insert(dto);
		
		return "redirect:/item/list";
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertUI() {
		return "/member/insert";
	}
	
}
