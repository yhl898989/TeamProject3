package kr.co.dw.controller.notice;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import kr.co.dw.domain.NoticeDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QaDTO;
import kr.co.dw.service.notice.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService nService;

	@RequestMapping(value = "/delete/{nno}", method = RequestMethod.GET)
	public String delete(@PathVariable("nno") int nno, HttpSession session) {
		AdminDTO alogin = (AdminDTO) session.getAttribute("alogin");
		if (alogin == null) {
			return "redirect:/item/main";
		}
		
		NoticeDTO ndto = new NoticeDTO(nno, null, null, null, null, null, 0, null);

		nService.delete(ndto);

		return "redirect:/notice/list";// 다시 그곳으로 향하다
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<String> update(MultipartHttpServletRequest request) {
		ResponseEntity<String> entity = null;

		String sNno = request.getParameter("nno");
		int nno = Integer.parseInt(sNno);
		String aid = request.getParameter("aid");
		String ntitle = request.getParameter("ntitle");

		String ncontent = request.getParameter("ncontent");
		try {
			NoticeDTO ndto = new NoticeDTO(nno, aid, ntitle, ncontent, null, null, 0, null);

			nService.update(ndto);

			System.out.println(ndto);

			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("" + (-1), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/update/{nno}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("nno") int nno, Model model, HttpSession session) {
		AdminDTO alogin = (AdminDTO) session.getAttribute("alogin");
		if (alogin == null) {
			return "redirect:/item/main";
		}
		
		NoticeDTO ndto = nService.updateUI(nno);

		model.addAttribute("ndto", ndto);
		return "/notice/update";
	}

//   @RequestMapping(value = "/list", method = RequestMethod.GET)
//   public String list(Integer curpage, Model model) {
//      if(curpage==null) {
//    	  curpage=1;
//      }
//		/* List<NoticeDTO> list = nService.list(); */
//      List<NoticeDTO> list = nService.list(curpage);
//      model.addAttribute("list", list);
//      
//      return "/notice/listpage";
//   }
	// 임병기버전
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam(value = "curPage", defaultValue = "1") Integer curpage, Model model) {
		if (curpage == null) {
			curpage = 1;
		}
		PageTO<NoticeDTO> pt = new PageTO<>(curpage);
		Integer amount = nService.getamount();
		pt.setAmount(amount);
		pt.setCurPage(curpage);
		/* List<NoticeDTO> list = nService.list(); */
		// List<NoticeDTO> list = nService.list(curpage);
		// model.addAttribute("list", list);
		List<NoticeDTO> listpage = nService.listpage(curpage);
		pt.setList(listpage);
		System.out.println(listpage);
		model.addAttribute("pt", pt);

		return "/notice/listpage";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> insert(HttpServletRequest request, HttpSession session) {

		ResponseEntity<String> entity = null;

		String ntitle = request.getParameter("ntitle");
		System.out.println(ntitle);

		String ncontent = request.getParameter("ncontent");
		System.out.println(ncontent);
		String aid = request.getParameter("aid");
		// int nno = -1;

		try {

			NoticeDTO nDto = new NoticeDTO(0, aid, ntitle, ncontent, null, null, 0, null);
			session.setAttribute("principal", nDto);
			nService.insert(nDto);

			entity = new ResponseEntity<>("" + nDto.getNno(), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<>("" + (-1), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertUI(HttpSession session) {
		AdminDTO alogin = (AdminDTO) session.getAttribute("alogin");
		if (alogin == null) {
			return "redirect:/item/main";
		}
		
		return "/notice/insert";
	}

	@RequestMapping(value = "/read/{nno}", method = RequestMethod.GET)
	public String read(@PathVariable("nno") int nno, Model model) {

		NoticeDTO ndto = nService.read(nno);

		model.addAttribute("ndto", ndto);

		return "/notice/read";
	}

	@RequestMapping(value = "/{nno}/{curpage}", method = RequestMethod.GET)
	public List<NoticeDTO> list(@PathVariable("nno") int nno, @PathVariable("curpage") int curPage) {
		List<NoticeDTO> list = nService.list(nno, curPage);

		System.out.println(list);

		return list;
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(Integer curpage, String criteria, String keyword, Model model) {
		if (curpage == null) {
			curpage = 1;
		}

		PageTO<NoticeDTO> pt = nService.search(curpage, criteria, keyword);
		model.addAttribute("list", pt.getList());
		model.addAttribute("pt", pt);
		model.addAttribute("criteria", criteria);
		model.addAttribute("keyword", keyword);
	}

}