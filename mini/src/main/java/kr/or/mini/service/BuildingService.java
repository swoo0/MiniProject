package kr.or.mini.service;

import java.util.List;

import kr.or.mini.dto.PrivateBgVO;
import kr.or.mini.dto.PublicBgVO;
import kr.or.mini.dto.SearchTypeVO;

public interface BuildingService {
	
	List<PublicBgVO> getPublicBuildingListBySearchTypes(SearchTypeVO searchTypes) throws Exception;
	List<PrivateBgVO> getPrivateBuildingListBySearchTypes(SearchTypeVO searchTypes) throws Exception;
	
}
