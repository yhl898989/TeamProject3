package kr.co.dw.controller.qa;

import java.util.List;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dw.domain.MemberDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QaDTO;
import kr.co.dw.service.qa.QaService;

@Controller
@RequestMapping("/qa")
public class QaController {

	@Autowired
	private QaService qService;
	
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(Integer curpage, String criteria, String keyword, 
						Model model) {
		if(curpage == null) {
			curpage = 1;
		}
		
		PageTO<QaDTO> pt = qService.search(curpage, criteria, keyword);
		model.addAttribute("list", pt.getList());
		model.addAttribute("pt", pt);
		model.addAttribute("criteria", criteria);
		model.addAttribute("keyword", keyword);
	}

	@RequestMapping(value = "/delete/{qno}", method = RequestMethod.GET)
	public String delete(@PathVariable("qno") int qno) {

		QaDTO nQdto = new QaDTO(qno, null, null, null, null, null, 0);

		qService.delete(nQdto);

		return "redirect:/qa/list";// 다시 그곳으로 향하다
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam(value = "curPage", defaultValue = "1") Integer curpage, Model model) {
		if (curpage == null) {
			curpage = 1;
		}
		PageTO<QaDTO> pt = new PageTO<>(curpage);
		Integer amount = qService.getamount();
		pt.setAmount(amount);
		pt.setCurPage(curpage);

		List<QaDTO> listpage = qService.listpage(curpage);
		pt.setList(listpage);
		model.addAttribute("pt", pt);

		return "/qa/listpage";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<String> update(MultipartHttpServletRequest request) {
		ResponseEntity<String> entity = null;

		String sQno = request.getParameter("qno");
		int qno = Integer.parseInt(sQno);
		String mid = request.getParameter("mid");
		String qtitle = request.getParameter("qtitle");

		String qcontent = request.getParameter("qcontent");
		try {
			QaDTO nQdto = new QaDTO(qno, mid, qtitle, qcontent, null, null, 0);

			qService.update(nQdto);

			System.out.println(nQdto);

			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("" + (-1), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> insert(HttpServletRequest request) {
		ResponseEntity<String> entity = null;

		String qtitle = request.getParameter("qtitle");
		System.out.println(qtitle);
		String qcontent = request.getParameter("qcontent");
		System.out.println(qcontent);
		String mid = request.getParameter("mid");

		try {
			QaDTO nQdto = new QaDTO(0, mid, qtitle, qcontent, null, null, 0);

			qService.insert(nQdto);

			entity = new ResponseEntity<>("" + nQdto.getQno(), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<>("" + (-1), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertUI(HttpSession session) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login");
		System.out.println(mDto);
		if (mDto == null) {
			return "/member/login";
		}
		return "/qa/insert";
	}

	@RequestMapping(value = "/read/{qno}", method = RequestMethod.GET)
	public String read(@PathVariable("qno") int qno, Model model, HttpSession session) {

		
		QaDTO nQdto = qService.read(qno);
		model.addAttribute("nQdto", nQdto);

		return "/qa/read";
	}

	@RequestMapping(value = "/update/{qno}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("qno") int qno, Model model, HttpSession session) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login");
		System.out.println(mDto);
		if (mDto == null) {
			return "/member/login";
		}
		QaDTO nQdto = qService.updateUI(qno);

		model.addAttribute("nQdto", nQdto);
		return "/qa/update";
	}
}
