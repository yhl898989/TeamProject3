package kr.co.dw.controller.member;

import java.io.IOException;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.sts.NaverLoginBO;
import kr.co.dw.domain.AdminDTO;
import kr.co.dw.domain.MemberDTO;
import kr.co.dw.service.member.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

   @Autowired
   private MemberService mService;

   @Autowired
   private NaverLoginBO naverLoginBO;

   /* 비밀번호 찾기 */
   @RequestMapping(value = "/pw2", method = RequestMethod.GET)
   public void findPwGET() throws Exception {
   }

   @RequestMapping(value = "/pw2", method = RequestMethod.POST)
   public void findPwPOST(@ModelAttribute MemberDTO mDto, HttpServletResponse response) throws IOException {
      mService.pw2(response, mDto);
   }

   // 비밀번호 찾기
   @RequestMapping(value = "/findpw", method = RequestMethod.POST)
   public String findpw(HttpServletResponse response, MemberDTO mDto, Model model) {
      System.out.println(mDto);
      String mpw = mService.findpw(mDto);
      model.addAttribute("mpw", mpw);
      return "/member/findpw";
   }

   // 비밀번호 찾기 폼
   @RequestMapping(value = "/findpwform", method = RequestMethod.GET)
   public String findPWForm() throws Exception {
      return "/member/findpwform";
   }

   // 아이디 찾기
   @RequestMapping(value = "/findid", method = RequestMethod.POST)
   public String findid(HttpServletResponse response, MemberDTO mDto, Model model) {
      System.out.println(mDto);
      String mid = mService.findid(mDto);
      model.addAttribute("mid", mid);
      return "/member/findid";
   }

   // 아이디 찾기 폼
   @RequestMapping(value = "/findidform", method = RequestMethod.GET)
   public String findIdForm() throws Exception {
      return "/member/findidform";
   }

   // 중복확인
   @ResponseBody
   @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
   public int getIdCheck(HttpServletRequest req) throws Exception {
      String mid = req.getParameter("mid");
      int result = mService.idCheck(mid);// 중복아이디 있으면 1, 없으면 0

      return result;
   }

   @RequestMapping(value = "/login2", method = RequestMethod.GET)
   public String login2(HttpSession session) {
      MemberDTO login = (MemberDTO) session.getAttribute("login");
      AdminDTO alogin = (AdminDTO) session.getAttribute("alogin");

      if (login != null || alogin != null) {
         return "redirect:/item/main";
      }
      
      return "/member/login2";
   }

   @RequestMapping(value = "/logout", method = RequestMethod.GET)
   public String logout() {

      return "redirect:/item/main";
   }

   @RequestMapping(value = "/loginui", method = { RequestMethod.GET, RequestMethod.POST })
   public String login(Model model, HttpSession session) {
      
      AdminDTO alogin = (AdminDTO) session.getAttribute("alogin");

      if (alogin != null) {
         return "redirect:/item/main";
      }
      
      /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

      // https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
      // redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
      System.out.println("네이버:" + naverAuthUrl);

      // 네이버
      model.addAttribute("url", naverAuthUrl);
      return "/member/login";
   }

   @RequestMapping(value = "/login", method = RequestMethod.POST)
   public String login(MemberDTO mDto, Model model, HttpServletRequest request) {

      MemberDTO login = mService.login(mDto);
      System.out.println(login);
      if (login == null) {
         request.setAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
         request.setAttribute("url", "/member/loginui");
         return "/alert/alert";
      }
      model.addAttribute("login", login);

      return "redirect:/item/main";
   }

   @RequestMapping(value = "/delete", method = RequestMethod.POST)
   public String delete(MemberDTO dto, HttpSession session) {
      MemberDTO login = (MemberDTO) session.getAttribute("login");

      if (login != null) {
         session.invalidate();
      }
      mService.delete(dto);

      return "redirect:/item/main";
   }

   @RequestMapping(value = "/delete/{mid}", method = RequestMethod.GET)
   public String deleteUI(@PathVariable("mid") String mid, Model model, HttpSession session) {
      MemberDTO login = (MemberDTO) session.getAttribute("login");
      AdminDTO alogin = (AdminDTO) session.getAttribute("alogin");

      if (alogin == null) {
         if (login == null || !login.getMid().equals(mid)) {
            return "redirect:/item/main";
         }
      }

      model.addAttribute("mid", mid);
      return "/member/delete";
   }

   @RequestMapping(value = "/s_delete", method = RequestMethod.GET)
   public String s_delete(HttpSession session) {
      MemberDTO login = (MemberDTO) session.getAttribute("login");
      System.out.println(login);
      if (login != null) {
         session.invalidate();
      }
      mService.s_delete(login);

      return "redirect:/item/main";
   }

   @RequestMapping(value = "/update", method = RequestMethod.POST)
   public String update(MemberDTO dto, HttpSession session) {
      AdminDTO alogin = (AdminDTO) session.getAttribute("alogin");

      mService.update(dto);

      if (alogin != null) {
         return "redirect:/admin/mlist";
      }
      return "redirect:/member/mypage/" + dto.getMid();
   }

   @RequestMapping(value = "/update/{mid}", method = RequestMethod.GET)
   public String updateUI(@PathVariable("mid") String mid, Model model, HttpSession session) {
      MemberDTO login = (MemberDTO) session.getAttribute("login");
      AdminDTO alogin = (AdminDTO) session.getAttribute("alogin");

      if (alogin == null) {
         if (login == null || !login.getMid().equals(mid)) {
            return "redirect:/item/main";
         }
      }
      MemberDTO dto = mService.updateUI(mid);

      model.addAttribute("dto", dto);
      return "/member/update";
   }

   @RequestMapping(value = "/mypage/{mid}")
   public String mypage(@PathVariable("mid") String mid, Model model, HttpSession session) {
      MemberDTO login = (MemberDTO) session.getAttribute("login");
      AdminDTO alogin = (AdminDTO) session.getAttribute("alogin");

      if (alogin == null) {
         if (login == null || !login.getMid().equals(mid)) {
            return "redirect:/item/main";
         }
      }

      MemberDTO dto = mService.mypage(mid);

      model.addAttribute("dto", dto);
      return "/member/mypage";
   }

   @RequestMapping(value = "/s_mypage/{mid}")
   public String s_mypage(@PathVariable("mid") String mid, Model model, HttpSession session) {
      MemberDTO login = (MemberDTO) session.getAttribute("login");
      AdminDTO alogin = (AdminDTO) session.getAttribute("alogin");

      if (alogin == null) {
         if (login == null || !login.getMid().equals(mid)) {
            return "redirect:/item/main";
         }
      }

      MemberDTO dto = mService.mypage(mid);

      model.addAttribute("dto", dto);
      return "/member/s_mypage";
   }

   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public String list(Model model) {

      List<MemberDTO> list = mService.list();

      model.addAttribute("list", list);

      return "/member/list";
   }

   @RequestMapping(value = "/insert", method = RequestMethod.POST)
   public String insert(MemberDTO dto) {
      System.out.println(dto);
      mService.insert(dto);

      return "redirect:/item/main";
   }

   @RequestMapping(value = "/insert", method = RequestMethod.GET)
   public String insertUI() {
      return "/member/insert";
   }

   @RequestMapping(value = "/charge", method = RequestMethod.POST)
   public ResponseEntity<String> charge(HttpServletRequest request, HttpSession session) {
      MemberDTO login = (MemberDTO) session.getAttribute("login");
      String sMmoney = request.getParameter("mmoney");
      System.out.println(sMmoney);
      long mmoney = Long.parseLong(sMmoney);
      System.out.println(mmoney);
      ResponseEntity<String> entity = null;
      login.setMmoney(mmoney);

      try {
         mService.charge(login);
         entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

      } catch (Exception e) {
         // TODO: handle exception
         entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
      }

      return entity;
   }

}