package kr.or.mini.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
	public ResponseEntity<List<BuildingVO>> searchBuilding(SearchTypeVO searchTypes, HttpServletRequest request) throws Exception {
		
		ResponseEntity<List<BuildingVO>> entity = null;
		
		List<BuildingVO> buildingList = null;
		
		try {
			buildingList = buildingService.getBuildingListBySearchTypes(searchTypes);
			
			// 결과 cnt 확인.
			if (buildingList != null) System.out.println(buildingList.size());
			
			entity = new ResponseEntity<List<BuildingVO>>(buildingList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<BuildingVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	
}
