package kr.or.mini.dao;

import java.util.List;

import kr.or.mini.dto.PrivateBgVO;
import kr.or.mini.dto.PublicBgVO;
import kr.or.mini.dto.SearchTypeVO;

public interface BuildingDAO {
	
	List<PublicBgVO> selectPublicBuildingListBySearchTypes(SearchTypeVO searchTypes) throws Exception;
	List<PrivateBgVO> selectPrivateBuildingListBySearchTypes(SearchTypeVO searchTypes) throws Exception;
	
}
