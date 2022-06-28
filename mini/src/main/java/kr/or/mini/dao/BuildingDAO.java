package kr.or.mini.dao;

import java.util.List;

import kr.or.mini.dto.BuildingVO;
import kr.or.mini.dto.SearchTypeVO;

public interface BuildingDAO {
	
	List<BuildingVO> selectBuildingListBySearchTypes(SearchTypeVO searchTypes) throws Exception;
	
}
