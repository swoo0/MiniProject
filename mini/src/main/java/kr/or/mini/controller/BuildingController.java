package kr.or.mini.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.mini.dto.PrivateBgVO;
import kr.or.mini.dto.PublicBgVO;
import kr.or.mini.dto.SearchTypeVO;
import kr.or.mini.service.BuildingService;

@Controller
@RequestMapping("/building")
public class BuildingController {

	@Autowired
	BuildingService buildingService;
	
	@RequestMapping(value = "/public/search", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<PublicBgVO>> searchPublicBuilding(@RequestBody Map<String,String> searchTypeMap, HttpServletRequest request) throws Exception {
		
		ResponseEntity<List<PublicBgVO>> entity = null;

		SearchTypeVO searchTypes = new SearchTypeVO();
		
		System.out.println();
	    
		Iterator<String> searchTypeIt = searchTypeMap.keySet().iterator();
        while (searchTypeIt.hasNext()) {
            String type = searchTypeIt.next();
            String value = searchTypeMap.get(type);
            
            if (value.equals("subway")) searchTypes.setSubway(value);
            if (value.equals("school")) searchTypes.setSchool(value);
            if (value.equals("park")) searchTypes.setPark(value);
            if (value.equals("mall")) searchTypes.setMall(value);
            if (value.equals("hospital")) searchTypes.setHospital(value);
            if (value.equals("animal24")) searchTypes.setAnimal24(value);
        }	
		
        List<PublicBgVO> publicBgList = null;
        
    	try {
    		publicBgList = buildingService.getPublicBuildingListBySearchTypes(searchTypes);
    		entity = new ResponseEntity<List<PublicBgVO>>(publicBgList, HttpStatus.OK);
    	} catch (Exception e) {
    		e.printStackTrace();
    		entity = new ResponseEntity<List<PublicBgVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
    	}
		
		return entity;
	}
	
	
	@RequestMapping(value = "/private/search", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<PrivateBgVO>> searchPrivateBuilding(@RequestBody Map<String,String> searchTypeMap, HttpServletRequest request) throws Exception {
		
		ResponseEntity<List<PrivateBgVO>> entity = null;
		
		SearchTypeVO searchTypes = new SearchTypeVO();
		
		Iterator<String> searchTypeIt = searchTypeMap.keySet().iterator();
		while (searchTypeIt.hasNext()) {
			String type = searchTypeIt.next();
			String value = searchTypeMap.get(type);
			
			if (value.equals("subway")) searchTypes.setSubway(value);
			if (value.equals("school")) searchTypes.setSchool(value);
			if (value.equals("park")) searchTypes.setPark(value);
			if (value.equals("mall")) searchTypes.setMall(value);
			if (value.equals("hospital")) searchTypes.setHospital(value);
			if (value.equals("animal24")) searchTypes.setAnimal24(value);
		}	
		
		List<PrivateBgVO> privateBgList = null;
		
		try {
			privateBgList = buildingService.getPrivateBuildingListBySearchTypes(searchTypes);
			entity = new ResponseEntity<List<PrivateBgVO>>(privateBgList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<PrivateBgVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
}
