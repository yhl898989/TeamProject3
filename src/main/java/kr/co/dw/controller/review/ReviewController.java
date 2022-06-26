package kr.co.dw.controller.review;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;



import kr.co.dw.domain.ReviewDTO;
import kr.co.dw.service.review.ReviewService;
import kr.co.dw.utils.DWUtils;


@RestController
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	private String uploadPath = "C:"+File.separator+"upload";
	
	@RequestMapping(value = "", method = RequestMethod.PUT)
	public ResponseEntity<String> update(@RequestBody Map<String, Object> map) {
		ResponseEntity<String> entity = null;
		
		try {
			rService.update(map);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);			
		} catch (Exception e) {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		
		
		return entity;
	}
	
	@RequestMapping(value = "", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@RequestBody Map<String, Object> map) {
		ResponseEntity<String> entity = null;
		
		List<String> list = rService.getreviewimgfilename(map);
			
		for(int i = 0 ; i < list.size();i++) {
			DWUtils.deleteFile(uploadPath, list.get(i));			
		}
		try {
			rService.delete(map);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{iId}/all", method = RequestMethod.GET)
	public List<ReviewDTO> list(@PathVariable("iId") int iId, Model model){
		List<ReviewDTO> list= rService.list(iId);
		
		for(int i = 0 ; i < list.size(); i++) {
			int rno = list.get(i).getRno();
			List<String> rfilenamelist = rService.getrfilenamelist(rno);
			
			list.get(i).setRfilenamelist(rfilenamelist);
		}
		
		return list;
		
	}
	
	
	

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody Map<String, Object> map) {
		ResponseEntity<String> entity =null;
		
		try {
			rService.insert(map);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	};
}