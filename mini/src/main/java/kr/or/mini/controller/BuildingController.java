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

import kr.or.mini.dto.BuildingVO;
import kr.or.mini.dto.SearchTypeVO;
import kr.or.mini.service.BuildingService;

@Controller
@RequestMapping("/building")
public class BuildingController {

	@Autowired
	BuildingService buildingService;
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<BuildingVO>> searchBuilding(@RequestBody Map<String,String> searchTypeMap, HttpServletRequest request) throws Exception {
		
		ResponseEntity<List<BuildingVO>> entity = null;

		SearchTypeVO searchTypes = new SearchTypeVO();
	    
		Iterator<String> searchTypeIt = searchTypeMap.keySet().iterator();
        while (searchTypeIt.hasNext()) {
            String type = searchTypeIt.next();
            String value = searchTypeMap.get(type);
            
            System.out.println(value);
            
            if (value.equals("subway")) searchTypes.setSubway(value);
            if (value.equals("school")) searchTypes.setSchool(value);
            if (value.equals("park")) searchTypes.setPark(value);
            if (value.equals("mall")) searchTypes.setMall(value);
            if (value.equals("hospital")) searchTypes.setHospital(value);
            if (value.equals("animal24")) searchTypes.setAnimal24(value);
        }	
		
		List<BuildingVO> buildingList = null;
		try {
			buildingList = buildingService.getBuildingListBySearchTypes(searchTypes);
			
			// 결과 cnt 확인.
			if (buildingList != null) System.out.println("검색된 공용주택 갯수 : " + buildingList.size() + "개");
			
			entity = new ResponseEntity<List<BuildingVO>>(buildingList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<BuildingVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
}
