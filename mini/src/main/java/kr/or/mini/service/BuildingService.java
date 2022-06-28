package kr.or.mini.service;

import java.util.List;

import kr.or.mini.dto.BuildingVO;
import kr.or.mini.dto.SearchTypeVO;

public interface BuildingService {
	
	List<BuildingVO> getBuildingListBySearchTypes(SearchTypeVO searchTypes) throws Exception;
	
}
