package kr.or.mini.service;

import java.util.List;

import kr.or.mini.dto.BuildingVO;
import kr.or.mini.dto.SearchTypeVO;

public interface BuildingService {
	
	/**
	 * searchTypes에 null 체크 후 쿼리문 추가.
	 * @param searchTypes
	 * @return
	 * @throws Exception
	 */
	List<BuildingVO> getBuildingListBySearchTypes(SearchTypeVO searchTypes) throws Exception;
	
	
}
