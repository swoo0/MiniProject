package kr.or.mini.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.mini.dao.BuildingDAO;
import kr.or.mini.dto.PrivateBgVO;
import kr.or.mini.dto.PublicBgVO;
import kr.or.mini.dto.SearchTypeVO;

@Service
public class BuildingServiceImpl implements BuildingService {

	@Autowired
	private BuildingDAO buildingDAO;

	@Override
	public List<PublicBgVO> getPublicBuildingListBySearchTypes(SearchTypeVO searchTypes) throws Exception {
		List<PublicBgVO> buildingList = null;
		buildingList = buildingDAO.selectPublicBuildingListBySearchTypes(searchTypes);
		
		return buildingList;
	}
	
	@Override
	public List<PrivateBgVO> getPrivateBuildingListBySearchTypes(SearchTypeVO searchTypes) throws Exception {
		List<PrivateBgVO> buildingList = null;
		buildingList = buildingDAO.selectPrivateBuildingListBySearchTypes(searchTypes);
		
		return buildingList;
	}
	
}
