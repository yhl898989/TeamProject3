package kr.co.dw.controller.review;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.ReviewDTO;
import kr.co.dw.service.review.ReviewService;
import kr.co.dw.utils.DWUtils;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	private String uploadPath = "C:"+File.separator+"upload";
	
	@ResponseBody
	@RequestMapping(value = "/reviewcheck", method = RequestMethod.POST)
	public ResponseEntity<String> reviewcheck(@RequestBody Map<String, Object> map){
		ResponseEntity<String> entity = null;
		System.out.println(map);
		int reviewcount = rService.reviewcount(map);
		System.out.println(reviewcount);
		int orderreviewcheck = rService.orderreviewcheck(map);
		System.out.println(orderreviewcheck);
		
		try {
			if (reviewcount < orderreviewcheck) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);	
			}else {
				entity = new ResponseEntity<String>("fail", HttpStatus.OK);	
			}				
		} catch (Exception e) {
			// TODO: handle exception
			entity = new ResponseEntity<String>("realfail", HttpStatus.OK);	
		}
		
		return entity;
	}
	
	
	
	@RequestMapping(value = "/uploadform2", method = RequestMethod.POST)
    public String uploadForm2(MultipartHttpServletRequest request, Model model) throws Exception {
      
       
       String iId = request.getParameter("iId");
       String sRno = request.getParameter("rno");
       int rno = Integer.parseInt(sRno);
       List<String> filelist = rService.getreviewimgfilename(rno);
       for(int i = 0 ; i < filelist.size();i++) {
    	   String delefilename = filelist.get(i);
    	   DWUtils.deleteFile(uploadPath, delefilename);
       }
       rService.deleterfilename(rno);
       
       
      
       List<MultipartFile>list= request.getFiles("file");
      
       
       List<String>filenameList=new ArrayList<String>();
       
       for(int i=0; i<list.size(); i++) {
         
          MultipartFile file = list.get(i);
          
          String uploadedFilename = DWUtils.itemuploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
          
          filenameList.add(uploadedFilename);
       }
      
       rService.insertfilename(filenameList,rno);
      
       
       return "redirect:/item/read/"+iId;
       
    }
	
	@RequestMapping(value = "/uploadform", method = RequestMethod.POST)
    public String uploadForm(MultipartHttpServletRequest request, Model model) throws Exception {
       
       
       String iId = request.getParameter("iId");
      
      
       List<MultipartFile>list= request.getFiles("file");
      
       
       List<String>filenameList=new ArrayList<String>();
       
       for(int i=0; i<list.size(); i++) {
        
          MultipartFile file = list.get(i);
        
          String uploadedFilename = DWUtils.itemuploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
        
          filenameList.add(uploadedFilename);
       }
       Integer rno = rService.Selectrno();
       
       rno = rno-1;
       rService.insertfilename(filenameList,rno);
      
       
       return "redirect:/item/read/"+iId;
       
    }
	@ResponseBody
	@RequestMapping(value = "", method = RequestMethod.PUT)
	public ResponseEntity<String> update(@RequestBody Map<String, Object> map) {
		ResponseEntity<String> entity = null;
		/*
		 * List<String> list = rService.getreviewimgfilename(map); for(int i = 0 ; i <
		 * list.size();i++) { //DWUtils.deleteFile(uploadPath, list.get(i)); }
		 */
		try {
			rService.update(map);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);			
		} catch (Exception e) {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		
		
		return entity;
	}
	@ResponseBody
	@RequestMapping(value = "", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@RequestBody Map<String, Object> map) {
		ResponseEntity<String> entity = null;
		
		List<String> list = rService.getreviewimgfilename(map);
			
		for(int i = 0 ; i < list.size();i++) {
			
			DWUtils.deleteFile(uploadPath, list.get(i));			
		}
		try {
			rService.deleterfilename(map);
			rService.delete(map);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	@ResponseBody
	@RequestMapping(value = "/{iId}/{curpage}/all", method = RequestMethod.GET)
	public PageTO<ReviewDTO> list(@PathVariable("iId") int iId, @PathVariable("curpage") int curpage, Model model){
		PageTO<ReviewDTO> pt= rService.list(iId, curpage);
		
		for(int i = 0 ; i < pt.getList().size(); i++) {
			int rno = pt.getList().get(i).getRno();
			List<String> rfilenamelist = rService.getrfilenamelist(rno);
			
			pt.getList().get(i).setRfilenamelist(rfilenamelist);
		}
		
		return pt;
		
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody Map<String, Object> map) {
		ResponseEntity<String> entity =null;
		System.out.println(map);
		try {
			
				rService.insert(map);
			
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	};
}