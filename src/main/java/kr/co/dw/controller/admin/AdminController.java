package kr.co.dw.controller.admin;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Logger;

import javax.inject.Inject;
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
import kr.co.dw.domain.ItemDTO;
import kr.co.dw.domain.MemberDTO;
import kr.co.dw.domain.OrderDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.itemPageTO;
import kr.co.dw.service.admin.AdminService;
import kr.co.dw.service.member.MemberService;
import kr.co.dw.service.order.OrderService;
import kr.co.dw.utils.DWUtils;

@Controller
@RequestMapping("/admin")
public class AdminController {

   @Autowired
   private AdminService aService;

   @Autowired
   private MemberService mService;

   @Inject
   private OrderService oService;

   @RequestMapping(value = "/logout", method = RequestMethod.GET)
   public String logout() {

      return "redirect:/item/main";
   }

   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public String login(HttpSession session) {
      MemberDTO login = (MemberDTO) session.getAttribute("login");
      AdminDTO alogin = (AdminDTO) session.getAttribute("alogin");

      if (login != null || alogin != null) {
         return "redirect:/item/main";
      }
      
      return "/admin/login";
   }

   @RequestMapping(value = "/login", method = RequestMethod.POST)
   public String login(AdminDTO aDto, Model model, HttpServletRequest request) {

      AdminDTO alogin = aService.login(aDto);
      System.out.println(alogin);

      if (alogin == null) {
         request.setAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
         request.setAttribute("url", "/admin/login");
         return "/alert/alert";
      } else if (alogin.getAauth() == 0) {
         request.setAttribute("msg", "승인대기 중입니다.");
         request.setAttribute("url", "/item/main");
         return "/alert/alert";
      }

      model.addAttribute("alogin", alogin);

      return "redirect:/item/main";
   }

   @RequestMapping(value = "/mlist", method = RequestMethod.GET)
   public String mlist(@RequestParam(value = "curPage", defaultValue = "1") String ScurPage, Model model,
         HttpSession session) {
      AdminDTO aDto = (AdminDTO) session.getAttribute("alogin");
      if (aDto == null || aDto.getAauth() < 1) {
         return "redirect:/item/main";
      }

      List<MemberDTO> mlist = mService.list();
      List<AdminDTO> alist = aService.list();
      model.addAttribute("mlist", mlist);
      model.addAttribute("alist", alist);

      int curPage = Integer.parseInt(ScurPage);

      PageTO<MemberDTO> pt = new PageTO<MemberDTO>();

      int amount = aService.getamount();
      pt.setAmount(amount);
      pt.setCurPage(curPage);
      List<MemberDTO> list = aService.mlist(curPage);
      pt.setList(list);

      model.addAttribute("pt", pt);

      return "/admin/mlist";

   }

   @RequestMapping(value = "/main", method = RequestMethod.GET)
   public String main(HttpSession session) {
      AdminDTO aDto = (AdminDTO) session.getAttribute("alogin");
      if (aDto == null || aDto.getAauth() < 1) {
         return "redirect:/item/main";
      }
      return "/admin/main";
   }

   @RequestMapping(value = "/insert", method = RequestMethod.GET)
   public String insert() {
      return "/admin/insert";
   }

   @RequestMapping(value = "/insert", method = RequestMethod.POST)
   public String insert(AdminDTO aDto) {
      aService.insert(aDto);
      return "redirect:/item/main";
   }

   @RequestMapping(value = "/giveauth", method = RequestMethod.POST)
   public String giveAuth(String aid, int aauth, HttpSession session) {
      AdminDTO aDto = (AdminDTO) session.getAttribute("alogin");
      if (aDto == null || aDto.getAauth() < 1) {
         return "redirect:/item/main";
      }

      aService.giveauth(aid, aauth);
      return "redirect:/admin/mlist";
   }

   

   @RequestMapping(value = "/search", method = RequestMethod.GET)
   public String search(@RequestParam(value = "curPage", defaultValue = "1") String ScurPage,
         @RequestParam(value = "criteria", required = false) String Scriteria,
         @RequestParam(value = "keyword", required = false) String Skeyword, HttpServletRequest request,
         Model model) {
      String criteria = request.getParameter("criteria");
      if (Scriteria != null) {
         criteria = Scriteria;
      }

      String keyword = request.getParameter("keyword");
      if (Skeyword != null) {
         keyword = Skeyword;
      }
      int curPage = Integer.parseInt(ScurPage);

      PageTO<MemberDTO> pt = new PageTO<MemberDTO>(curPage);
      Integer amount = aService.getamount(criteria, keyword);
      pt.setAmount(amount);
      List<MemberDTO> list = aService.search(criteria, keyword, curPage);
      pt.setList(list);

      model.addAttribute("criteria", criteria);
      model.addAttribute("keyword", keyword);
      model.addAttribute("pt", pt);

      return "/admin/search";
   }
}