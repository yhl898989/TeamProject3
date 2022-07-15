package kr.co.dw.controller.order;

import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Comparator;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dw.domain.AdminDTO;
import kr.co.dw.domain.OrderCancelDTO;
import kr.co.dw.domain.OrderDTO;
import kr.co.dw.domain.OrderItemDTO;
import kr.co.dw.domain.OrderPageDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.SaleDTO;
import kr.co.dw.service.member.MemberService;
import kr.co.dw.service.order.OrderService;

@Controller
public class OrderController {
   @Autowired
   private OrderService oService;
   @Autowired
   private MemberService mService;

   
   
   @RequestMapping(value = "/order/orderRead2/{orderId}", method = RequestMethod.GET)
   public String orderRead2(@PathVariable("orderId") String orderId, Model model) {
      // 그리고 정보를 가져오려면 get방식을 이용해서 가져와야함. return 쪽에는 파일을 가져와서 jsp 파일만 쓰면 된다ㅓ.

      System.out.println(orderId);
      OrderDTO ODto = oService.orderRead(orderId);

      OrderItemDTO OIDto = oService.orderItemRead(orderId);

      model.addAttribute("odto", ODto);
      model.addAttribute("oidto", OIDto);

      return "/order/orderRead2"; // jsp의 파일을 갖고오는 위치 (이름을 쓰면되고 servlet에서 prifix와 surfix 들어가는 값에서 나옴.)
   }
   
   // 여기는 url 값을 가져오는 값을 쓰면 된다. 주소창에서 가져옴.
   @RequestMapping(value = "/order/orderRead/{orderId}", method = RequestMethod.GET)
   public String orderRead(@PathVariable("orderId") String orderId, Model model) {
      // 그리고 정보를 가져오려면 get방식을 이용해서 가져와야함. return 쪽에는 파일을 가져와서 jsp 파일만 쓰면 된다ㅓ.

      System.out.println(orderId);
      OrderDTO ODto = oService.orderRead(orderId);

      OrderItemDTO OIDto = oService.orderItemRead(orderId);

      model.addAttribute("odto", ODto);
      model.addAttribute("oidto", OIDto);

      return "/order/orderRead"; // jsp의 파일을 갖고오는 위치 (이름을 쓰면되고 servlet에서 prifix와 surfix 들어가는 값에서 나옴.)
   }

   // 내 주문 찾기
   @RequestMapping(value = "/myorderList/{mid}", method = RequestMethod.GET)
   public String OrderList(@PathVariable("mid") String mid, Integer curpage, Model model) {
      // @PathVariable 은 @RequestMapping 의value = "/orderList/{mid}에서 mid를 가져올수 있게해줌.

      if (curpage == null) {
         curpage = 1;

      }

      PageTO<OrderDTO> pt = oService.myorderList(curpage, mid);

//      
//      List<OrderDTO> orderList = new ArrayList<OrderDTO>();
//      
//      orderList = oService.orderList(mid);

      model.addAttribute("mid", mid);

      model.addAttribute("olist", pt.getList());

      model.addAttribute("pt", pt);

      return "/member/myorderList";
   }

   @RequestMapping(value = "/order/{mid}", method = RequestMethod.GET)
   public String orderPage(@PathVariable("mid") String mid, OrderPageDTO opd, Model model) {

      model.addAttribute("orderList", oService.getItemsInfo(opd.getOrders()));
      model.addAttribute("memberInfo", mService.mypage(mid));

      return "/order/order";

   }

   @RequestMapping(value = "/order", method = RequestMethod.POST)
   public String orderPagePost(OrderDTO od, HttpServletRequest request) {

      oService.order(od);

      return "redirect:/";
   }

   @RequestMapping(value = "/order/check", method = RequestMethod.POST)
   public ResponseEntity<String> orderupdate(HttpServletRequest request) {
      ResponseEntity<String> entity = null;

      String orderId = request.getParameter("orderId");
      String SsavePoint = request.getParameter("savePoint");
      String mid = request.getParameter("mid");
      int savePoint = Integer.parseInt(SsavePoint);
      
      System.out.println(orderId);
      System.out.println(SsavePoint);
      System.out.println(mid);
      System.out.println(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
      
      try {

         oService.orderUpdate(orderId, savePoint, mid);
         

         entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
      } catch (Exception e) {
         e.printStackTrace();
         entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
      }

      return entity;
   }

   @RequestMapping(value = "/order/orderCancle", method = RequestMethod.POST)
   public ResponseEntity<String> orderCancle(HttpServletRequest request) {
      ResponseEntity<String> entity = null;

      try {

         String orderId = request.getParameter("orderId");
         String mid = request.getParameter("mid");

         OrderCancelDTO dto = new OrderCancelDTO(mid, orderId);
         
         oService.orderCancle(dto);

         entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
      } catch (Exception e) {
         e.printStackTrace();
         entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
      }

      return entity;
   }

   @RequestMapping(value = "/order/orderCancle2", method = RequestMethod.POST)
   public String orderCancle(OrderCancelDTO dto) {

      System.out.println(dto);

      oService.orderCancle(dto);

      return "redirect:/myorderList/" + dto.getMid();
   }

   @RequestMapping(value = "/order/updateUI/{orderId}", method = RequestMethod.GET)
   public String orderUpdateUI(@PathVariable("orderId") String orderId, Model model) {

      OrderDTO ODto = oService.orderRead(orderId);

      OrderItemDTO OIDto = oService.orderItemRead(orderId);

      model.addAttribute("odto", ODto);
      model.addAttribute("oidto", OIDto);

      return "/order/orderUpdate";
   }

   @RequestMapping(value = "/order/update", method = RequestMethod.POST)
   public String orderUpdate(OrderDTO odto) {

      System.out.println(odto);

      oService.orderAddUpdate(odto);

      return "redirect:/order/orderRead/" + odto.getOrderId();

   }

   @RequestMapping(value = "/order/orderSale", method = RequestMethod.GET)
   public String Ordersale(Model model, HttpSession session) {
      AdminDTO aDto = (AdminDTO) session.getAttribute("alogin");

      if (aDto == null || aDto.getAauth() < 2) {
         return "redirect:/item/main";
      }

      Calendar cal = new GregorianCalendar();
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

      List<String> list = new ArrayList<String>();

      for (int i = 0; i < 7; i++) {
         list.add(format.format(cal.getTime()));
         cal.add(Calendar.DATE, -1);
      }
      // System.out.println(list);

      list.sort(Comparator.naturalOrder());

      List<Long> salesday = new ArrayList<Long>();

      salesday = oService.weekSale(list);

      for (int i = 0; i < salesday.size(); i++) {
         if (salesday.get(i) == null) {
            salesday.set(i, (long) 0);
         }
      }

      model.addAttribute("list", list);
      System.out.println(list.size());
      model.addAttribute("salesday", salesday);
      System.out.println(salesday.size());

      List<String> Month = new ArrayList<String>();
      SimpleDateFormat formonth = new SimpleDateFormat("yyyy-MM");

      cal.add(Calendar.MONTH, 5);
      Month.add(formonth.format(cal.getTime()));
      for (int i = 0; i < 11; i++) {
         cal.add(Calendar.MONTH, -1);
         Month.add(formonth.format(cal.getTime()));
      }

      List<Long> MonthSales = oService.monthSale(Month);

      for (int i = 0; i < MonthSales.size(); i++) {
         if (MonthSales.get(i) == null) {
            MonthSales.set(i, (long) 0);
         }
      }

      model.addAttribute("MonthSales", MonthSales);
      model.addAttribute("Month", Month);

      List<Integer> todaytotal = oService.gettodaytotal();

      System.out.println(todaytotal);

      model.addAttribute("todaytotal", todaytotal);

      List<OrderItemDTO> oiDTO = new ArrayList<OrderItemDTO>();
      oiDTO = oService.orderItem();

      System.out.println(oiDTO);

      List<Integer> s = new ArrayList<Integer>();

      for (int i = 0; i < oiDTO.size(); i++) {
         s.add(i, (int) (oiDTO.get(i).getiCount() + oiDTO.get(i).getiPrice()));
      }

      model.addAttribute("oiDTO", oiDTO);
      model.addAttribute("s", s);

      System.out.println("오류문제없음을 확인해주세요");

//      String [] arr = {"옷","가방","신발","악세사리","모자"};
      List<String> arr = new ArrayList<String>();
      arr.add("옷");
      arr.add("신발");
      arr.add("가방");
      arr.add("모자");
      arr.add("악세사리");

      List<Long> pietotal = oService.pietotal(arr);

      for (int i = 0; i < pietotal.size(); i++) {
         if (pietotal.get(i) == null) {
            pietotal.set(i, (long) 0);
         }
      }

      model.addAttribute("arr", arr);
      model.addAttribute("category", pietotal);

      System.err.println(arr);
      System.out.println(pietotal);

      long toprice = oService.gettodayPrice();

      long allprice = oService.getAllPrice();
       
       if(allprice == 0) {
          allprice = 0;
       }
       
       if(toprice == 0) {
          toprice = 0;                  
       }

       model.addAttribute("allprice", allprice);

       model.addAttribute("toprice", toprice);

      return "/order/orderSale";
   }

   @ResponseBody
   @RequestMapping(value = "/order/sale", method = RequestMethod.POST)
   public String test(SaleDTO sdto) {

      long sale = oService.getsale(sdto);

      if (sale == 0) {
         sale = 0;
      }

      return "" + sale;

   }

   @RequestMapping(value = "/orderList", method = RequestMethod.GET)
   public String OrderList(Model model, HttpSession session, Integer curpage) {
      AdminDTO aDto = (AdminDTO) session.getAttribute("alogin");

      if (aDto == null || aDto.getAauth() < 1) {
         return "redirect:/item/main";
      }
      if (curpage == null) {
         curpage = 1;
      }

      long toprice = oService.gettodayPrice();

      long allprice = oService.getAllPrice();

      PageTO<OrderDTO> pt = oService.list(curpage);

      if (toprice == 0) {
         toprice = 0;
      }

      if (allprice == 0) {
         allprice = 0;
      }

      model.addAttribute("allprice", allprice);

      model.addAttribute("toprice", toprice);

      model.addAttribute("olist", pt.getList());

      model.addAttribute("pt", pt);

      return "/admin/orderList";
   }

}