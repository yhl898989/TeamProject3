package kr.co.dw.controller.item;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dw.domain.AdminDTO;
import kr.co.dw.domain.ItemDTO;
import kr.co.dw.domain.itemPageTO;
import kr.co.dw.service.item.itemService;
import kr.co.dw.service.review.ReviewService;
import kr.co.dw.utils.DWUtils;

@Controller
@RequestMapping("/item")
public class itemController {

   @Autowired
   private itemService iService;
   
   @Inject
   private ReviewService rService;
   
   private String uploadPath = "C:"+File.separator+"upload";
   
   @RequestMapping(value = "/updatesubitemimg", method = RequestMethod.POST)
   public ResponseEntity<String> updatesubitemimg(MultipartHttpServletRequest request){
      
      ResponseEntity<String> entity = null;
      String siId = request.getParameter("iId");
      String deleteFilenameArr = request.getParameter("deleteFilenameArr");
      int iId = Integer.parseInt(siId);
      
      List<String> filenameList = new ArrayList<String>();
      String[] arr = deleteFilenameArr.split(",");
      try {
         Map<String, MultipartFile> map = request.getFileMap();
         Set<String> set = map.keySet();
         Iterator<String> it = set.iterator();
      while (it.hasNext()) {
         String key = it.next();
         MultipartFile file = map.get(key);      
         String uploadedFilename = DWUtils.itemuploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
         
         filenameList.add(uploadedFilename);
      }
      iService.uploadsubfilename(iId,filenameList);
      for(int i = 0 ; i < arr.length;i++) {
         String deletefile = arr[i];
         iService.deleteitemfilename(iId,deletefile);
         DWUtils.deleteFile(uploadPath, deletefile);
      }
      
         entity = new ResponseEntity<String>("SUCCESS" , HttpStatus.OK);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         entity = new ResponseEntity<String>("FAIL" , HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }
   
   @RequestMapping(value = "/getsubimgfilename", method = RequestMethod.POST)
   public ResponseEntity<List<String>> getsubimgfilename(int iId){
      ResponseEntity<List<String>> entity = null;
      
      
      try {
         List<String> subfilename = iService.getitemfilelist(iId);
         entity = new ResponseEntity<List<String>>(subfilename, HttpStatus.OK);
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
         entity = new ResponseEntity<List<String>>(HttpStatus.OK);
      }
      
      return entity;
   }
   
   @RequestMapping(value = "/updateitemimg", method = RequestMethod.POST)
   public ResponseEntity<String> updateitemimg(MultipartHttpServletRequest request){
      ResponseEntity<String> entity = null;
      String siId = request.getParameter("iId");
      int iId = Integer.parseInt(siId);
      MultipartFile file = request.getFile("itemimgfile");
      
      try {
         String uploadedFilename = DWUtils.itemuploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
         String deleteFilenames = request.getParameter("deletefilename");
         
         DWUtils.deleteFile(uploadPath, deleteFilenames);
         
         
         iService.updateitemimg(uploadedFilename,iId);
         entity = new ResponseEntity<String>("SUCCESS" , HttpStatus.OK);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         entity = new ResponseEntity<String>("FAIL" , HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }
   
   @RequestMapping(value = "/getmainimgfilename", method = RequestMethod.POST)
   public ResponseEntity<List<String>> getmainimgfilename(int iId){
      ResponseEntity<List<String>> entity = null;
      
      String getmainimgfilename = iService.getmainimgfilename(iId);
         
      try {
         
         List<String> list = new ArrayList<String>();
         list.add(getmainimgfilename);
         entity = new ResponseEntity<List<String>>(list, HttpStatus.OK);
         
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
         entity = new ResponseEntity<List<String>>(HttpStatus.BAD_REQUEST);
         
      }
         
      return entity;
   }
   @Transactional
   @RequestMapping(value = "/delete", method = RequestMethod.POST)
   public ResponseEntity<String> deleteitem(HttpServletRequest request){
      ResponseEntity<String> entity = null;
      String adminlistiId = request.getParameter("adminlistiId");
      int iId = Integer.parseInt(adminlistiId);
      
      Integer ordercheck = iService.ordercheck(iId);
      System.out.println(ordercheck);
      if(ordercheck != 0) {
    	  
    	  entity = new ResponseEntity<String>("ordercheck",HttpStatus.OK);
    	  return entity;
      }
      
      try {
         
         List<String> list = iService.getitemfilelist(iId);
         
         List<Integer> rno = rService.getRno(iId);
         
         List<String> filelist = rService.getreviewimgfilename(rno);
         
         for(int i = 0 ; i < filelist.size(); i++) {
            if(filelist.get(i) != null) {
               DWUtils.deleteFile(uploadPath, filelist.get(i));
            }
         }
         
         for(int i = 0 ; i < list.size();i++) {
            String deleteifilename = list.get(i);
            DWUtils.deleteFile(uploadPath, deleteifilename);
         }
         String getmainimgfilename = iService.getmainimgfilename(iId);
         int deletecount = iService.deleteimgcount(getmainimgfilename);
         if(deletecount == 0) {
            DWUtils.deleteFile(uploadPath, getmainimgfilename);
         }
         
         iService.deleteitem(iId);
         
         entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
         entity = new ResponseEntity<String>("FAIL",HttpStatus.OK);
      }

      return entity;
   }
   
   
   @RequestMapping(value = "/update", method = RequestMethod.POST)
   public ResponseEntity<String> updateitem(HttpServletRequest request){
      ResponseEntity<String> entity = null;
      String updateiId = request.getParameter("updateiId");
      int iId = Integer.parseInt(updateiId);
      String iName = request.getParameter("updateiName");
      String updateiPrice = request.getParameter("updateiPrice");
      int iPrice = Integer.parseInt(updateiPrice);
      String updateiDc = request.getParameter("updateiDc");
      int iDc = Integer.parseInt(updateiDc);
      String updateiCount = request.getParameter("updateiCount");
      int iCount = Integer.parseInt(updateiCount);
      String i_CATEGORY = request.getParameter("updatei_CATEGORY");
      
      try {
         ItemDTO iDto = new ItemDTO(iId, iName, iPrice, iDc, iCount, null, i_CATEGORY);
         iService.updateitem(iDto);
         entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
         entity = new ResponseEntity<String>("FAIL",HttpStatus.OK);
      }

      return entity;
   }
   
   
   @RequestMapping(value = "/search", method = RequestMethod.GET)
   public String search(@RequestParam(value ="curPage" , defaultValue = "1") String ScurPage,
                   @RequestParam(value = "showhowitemlist", defaultValue = "itemsequence") String showhowitemlist,
                   @RequestParam(value = "criteria", required = false) String Scriteria,
                   @RequestParam(value = "keyword", required = false) String Skeyword,
                   HttpServletRequest request,
                   Model model) {
      String criteria = request.getParameter("criteria");
      if(Scriteria != null) {
         criteria = Scriteria;
      }
      String keyword = request.getParameter("keyword");
      if(Skeyword != null) {
         keyword = Skeyword;
      }
      int curPage = Integer.parseInt(ScurPage);
      
      itemPageTO<ItemDTO> pt = iService.search(criteria,keyword,curPage,showhowitemlist);
      for(int i = 0 ; i <pt.getList().size();i++) {           
            int iPrice =  pt.getList().get(i).getiPrice();
            int iDC =  pt.getList().get(i).getiDc();                  
            int iSale = (int)((iPrice*(iDC*0.01)));
            
            iSale = iPrice - iSale;
                   
                  
            pt.getList().get(i).setIsaleiPrice(iSale);
         }
      model.addAttribute("criteria", criteria);
      model.addAttribute("keyword", keyword);
      model.addAttribute("showhowitemlist", showhowitemlist);
      model.addAttribute("pt", pt);
      
      return "/item/search";
   }
   
   @RequestMapping(value = "/getitemfilelist/{iId}", method = RequestMethod.GET)
   public ResponseEntity<List<String>> getitemfilelist(@PathVariable("iId") int iId){
      ResponseEntity<List<String>> entity = null;
      
      try {
         List<String> itemfilelist = iService.getitemfilelist(iId);
         entity = new ResponseEntity<List<String>>(itemfilelist,HttpStatus.OK);
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
         entity = new ResponseEntity<List<String>>(HttpStatus.OK);
      }
      
      return entity;
   }
   
   
   @Transactional
   @RequestMapping(value = "/main", method = RequestMethod.GET)
   public String main(Model model) {
      
      List<ItemDTO> list = iService.main();
      for(int i = 0 ; i <list.size();i++) {           
            int iPrice =  list.get(i).getiPrice();
            int iDC = list.get(i).getiDc();                  
            int iSale = (int)((iPrice*(iDC*0.01)));
            
            iSale = iPrice - iSale;
            
            list.get(i).setIsaleiPrice(iSale);
         }
      model.addAttribute("list", list);
      
      return "/item/main";
   }
   

   @RequestMapping(value = "/adminlist", method = RequestMethod.GET)
   public String adminlist(@RequestParam(value ="curPage" , defaultValue = "1") String ScurPage, 
                     @RequestParam(value ="category" , defaultValue = "all") String category,
         Model model, HttpSession session) {
      AdminDTO aDto = (AdminDTO) session.getAttribute("alogin");

      if (aDto == null || aDto.getAauth() < 1) {
         return "redirect:/item/main";
      }
      
      int curPage = Integer.parseInt(ScurPage);
      

      itemPageTO<ItemDTO> pt = iService.adminlist(curPage,category);
      model.addAttribute("category", category);
      model.addAttribute("pt", pt);
        
       
      return "/item/adminlist";
   }
   
   @RequestMapping(value = "/read/{iId}", method = RequestMethod.GET)
   public String read(@PathVariable("iId") int iId, Model model) {
      
      ItemDTO item = iService.read(iId);
      int iPrice = item.getiPrice();
      int iDc = item.getiDc();
      int iSale = (int)((iPrice*(iDc*0.01)));
      
      iSale = iPrice - iSale;
               
        item.setIsaleiPrice(iSale);
      model.addAttribute("item", item);
      return "/item/read";
   }
   
   
   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public String list(@RequestParam(value = "Category", defaultValue = "옷") String Catrgory,  
                  @RequestParam(value = "showhowitemlist", defaultValue = "itemsequence") String showhowitemlist,
                  @RequestParam(value = "curPage", defaultValue = "1") String ScurPage,
         Model model) {
      
      int curPage = Integer.parseInt(ScurPage);
   
      itemPageTO<ItemDTO> pt = iService.categoryList(Catrgory, showhowitemlist,curPage);
      for(int i = 0 ; i <pt.getList().size();i++) {           
            int iPrice =  pt.getList().get(i).getiPrice();
            int iDC = pt.getList().get(i).getiDc();                  
            int iSale = (int)((iPrice*(iDC*0.01)));
            
            iSale = iPrice - iSale;
                      
            pt.getList().get(i).setIsaleiPrice(iSale);
         }
      model.addAttribute("category", Catrgory);
      model.addAttribute("showhowitemlist", showhowitemlist);
      model.addAttribute("pt", pt);
      
      return "/item/list";
   }
   
   @RequestMapping(value = "/insert", method = RequestMethod.POST)
   public ResponseEntity<String> insert(MultipartHttpServletRequest request) {
      ResponseEntity<String> entity = null;
      String iName = request.getParameter("iName");
      String iPrice = request.getParameter("iPrice");
      int Price = Integer.parseInt(iPrice);
      String iDc = request.getParameter("iDc");
      int DC = Integer.parseInt(iDc);
      String iCount = request.getParameter("iCount");
      int Count = Integer.parseInt(iCount);
      String i_CATEGORY = request.getParameter("icategory");
         
      try {
         Map<String, MultipartFile>map = request.getFileMap();
         MultipartFile mainimgfile = request.getFile("itemimgfile");
         String mainimgfilename = DWUtils.itemuploadFile(uploadPath, mainimgfile.getOriginalFilename(), mainimgfile.getBytes());
         
         List<String> filenameList = new ArrayList<String>();
         
         Set<String> set = map.keySet();
         
         
         Iterator<String> it = set.iterator();
         
         while (it.hasNext()) {
            String key = it.next();
            MultipartFile file = map.get(key);
            if(file.equals(mainimgfile)) {
               continue;
            }
            
            String uploadedFilename = DWUtils.itemuploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
            
            filenameList.add(uploadedFilename);
            
            
         }
         
         String ifilename = mainimgfilename;
      
         ItemDTO iDto = new ItemDTO(0, iName, Price, DC, Count, ifilename, i_CATEGORY);
         
         iDto.setIfilenameList(filenameList);
               
         iService.insert(iDto);   
         entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
         entity = new ResponseEntity<String>("FAIL",HttpStatus.BAD_REQUEST);
      }
      return entity;
   }

   @RequestMapping(value = "/insert", method = RequestMethod.GET)
   public String insertui(HttpSession session) {
      AdminDTO aDto = (AdminDTO) session.getAttribute("alogin");

      if (aDto == null || aDto.getAauth() < 1) {
         return "redirect:/item/main";
      }
      
      return "/item/insert";
   }
   
}