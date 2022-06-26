package kr.co.dw.controller.review;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dw.service.review.ReviewService;
import kr.co.dw.utils.DWUtils;

@Controller
@RequestMapping("/review2")
public class ReviewController2 {

	@Autowired
	private ReviewService rService;
	
	private String uploadPath = "C:"+File.separator+"upload";
	
	@RequestMapping(value = "/uploadform", method = RequestMethod.POST)
    public String uploadForm(MultipartHttpServletRequest request, Model model) throws Exception {
       // MultipartRequest호출하는 것 자체가 파일 업로드 하는 것이기 때문이다.
       
       String iId = request.getParameter("iId");
       System.out.println(iId);
       
       //여러 개의 파일이 업로드 되었을 때 해당 파일들의 목록을 가져오는 코드
       List<MultipartFile>list= request.getFiles("file");
      
       //여러 개의 파일들이 업로드 된후 파일명을 반복문을 이용해서 실제로 저장하게 하는 코드
       List<String>filenameList=new ArrayList<String>();
       
       for(int i=0; i<list.size(); i++) {
          //list에 들어 있는 multipartfile 객체 하나씩 획득
          MultipartFile file = list.get(i);
          //multipartfile에 들어 있는 파일 데이터를 파일로 저장하는 코드
          String uploadedFilename = DWUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
          //여러 개의 업로드된 파일명을 저장하는 코드
          filenameList.add(uploadedFilename);
       }
       int rno = rService.Selectrno();
       System.out.println(rno);
       rService.insertfilename(filenameList,rno);
       
       
       return "redirect:/item/read/"+iId;// 업로드 파일에 /2022가 슬래쉬가 있다.
       
    }
}
