package kr.or.mini.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.mini.dao.BuildingDAO;
import kr.or.mini.dto.BuildingVO;
import kr.or.mini.dto.SearchTypeVO;

@Service
public class BuildingServiceImpl implements BuildingService {

	@Autowired
	private BuildingDAO buildingDAO;

	@Override
	public List<BuildingVO> getBuildingListBySearchTypes(SearchTypeVO searchTypes) throws Exception {
		List<BuildingVO> buildingList = null;
		
		buildingList = buildingDAO.selectBuildingListBySearchTypes(searchTypes);
		
		return buildingList;
	}
	
}
