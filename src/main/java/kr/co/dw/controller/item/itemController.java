package kr.co.dw.controller.item;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

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

import kr.co.dw.domain.ItemDTO;
import kr.co.dw.domain.itemPageTO;
import kr.co.dw.service.item.itemService;
import kr.co.dw.utils.DWUtils;

@Controller
@RequestMapping("/item")
public class itemController {

	@Autowired
	private itemService iService;
	
	
	private String uploadPath = "C:"+File.separator+"upload";
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> deleteitem(HttpServletRequest request){
		ResponseEntity<String> entity = null;
		String adminlistiId = request.getParameter("adminlistiId");
		int iId = Integer.parseInt(adminlistiId);
		
		try {
			
			List<String> list = iService.getitemfilelist(iId);
			for(int i = 0 ; i < list.size();i++) {
				String deleteifilename = list.get(i);
				DWUtils.deleteFile(uploadPath, deleteifilename);
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
	
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(HttpServletRequest request, Model model) {
		String criteria = request.getParameter("criteria");
		
		String keyword = request.getParameter("keyword");
		
		List<ItemDTO> list = iService.search(criteria,keyword);
		
		model.addAttribute("list", list);
		
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
		
		List<ItemDTO> list = iService.select();

		model.addAttribute("list", list);
		
		return "/item/main";
	}
	

	@RequestMapping(value = "/adminlist", method = RequestMethod.GET)
	public String adminlist(@RequestParam(value ="curPage" , defaultValue = "1") String ScurPage, Model model) {
		
		int curPage = Integer.parseInt(ScurPage);
		
		itemPageTO<ItemDTO> pt = new itemPageTO<ItemDTO>();
		
		int amount = iService.getamount();
		pt.setAmount(amount);
		pt.setCurPage(curPage);
		List<ItemDTO> list = iService.adminlist(curPage);
		pt.setList(list);

		model.addAttribute("pt", pt);
		  
		 
		return "/item/adminlist";
	}
	
	@RequestMapping(value = "/read/{iId}", method = RequestMethod.GET)
	public String read(@PathVariable("iId") int iId, Model model) {
		
		ItemDTO item = iService.read(iId);
		model.addAttribute("item", item);
		return "/item/read";
	}
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam(value = "Category", defaultValue = "옷") String Catrgory,  
					   @RequestParam(value = "showhowitemlist", defaultValue = "itemsequence") String showhowitemlist,
					   @RequestParam(value = "curPage", defaultValue = "1") String ScurPage,
			Model model) {
		
		int curPage = Integer.parseInt(ScurPage);
		
		itemPageTO<ItemDTO> pt = new itemPageTO<ItemDTO>(curPage);
		Integer amount = iService.getamount(Catrgory);
		System.out.println(amount);
		if(amount == null){
		      amount = 0;
		   }
		pt.setAmount(amount);
		
		
		try {
			List<ItemDTO> categoryList = iService.categoryList(Catrgory, showhowitemlist,curPage);
			
			
			
			pt.setList(categoryList);
			System.out.println(pt.getFinishPageNum());
			System.out.println(categoryList);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
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
			String mainimgfilename = DWUtils.uploadFile(uploadPath, mainimgfile.getOriginalFilename(), mainimgfile.getBytes());
			
			List<String> filenameList = new ArrayList<String>();
			filenameList.add(mainimgfilename);
			Set<String> set = map.keySet();
			
			
			Iterator<String> it = set.iterator();
			
			while (it.hasNext()) {
				String key = it.next();
				MultipartFile file = map.get(key);
				if(file.equals(mainimgfile)) {
					continue;
				}
				
				String uploadedFilename = DWUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				
				filenameList.add(uploadedFilename);
				
			}
			
			String ifilename = filenameList.get(0);
			String prifix = ifilename.substring(0,12);
			String suffix = ifilename.substring(14);
			ifilename = prifix + suffix;
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
	public String insertui() {
		return "/item/insert";
	}
	
}