package com.test.sts;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.dw.domain.MemberDTO;
import kr.co.dw.service.member.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {

   @Autowired
   private MemberService mService;
   
   /* NaverLoginBO */
   private NaverLoginBO naverLoginBO;
   private String apiResult = null;
   
   @Autowired
   private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
      this.naverLoginBO = naverLoginBO;
   }



   //네이버 로그인 성공시 callback호출 메소드
   @RequestMapping(value = "/naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
   public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request)
         throws IOException {
      System.out.println("여기는 callback");
      OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
       apiResult = naverLoginBO.getUserProfile(oauthToken);
      model.addAttribute("result", apiResult);
      
      System.out.println(apiResult + "here");      
       
      JSONObject jsonobject = new JSONObject(apiResult);
      JSONObject response = (JSONObject) jsonobject.get("response");
      
      String email = (String) response.get("email");
      String[] tmp = email.split("@");
      String id = tmp[0];
      String name = (String) response.get("name");
      
      MemberDTO mDto = new MemberDTO();
      mDto.setMid(id);
      mDto.setMname(name);
      
      int result = mService.idCheck(mDto.getMid());//중복아이디 있으면 1, 없으면 0
      
      if (result == 0) {
         mService.socialInsert(mDto);
      }
      
      MemberDTO login = mService.socialLogin(mDto);
      System.out.println(login + "세션위치");
            
      model.addAttribute("login", login);      
      
      request.setAttribute("msg", "로그인하셨습니다.");
      request.setAttribute("url", "/item/main");
      return "/alert/alert";
      
   }  

   
   
}