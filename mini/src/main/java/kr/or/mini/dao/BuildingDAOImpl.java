package kr.or.mini.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.mini.dto.BuildingVO;
import kr.or.mini.dto.SearchTypeVO;

@Repository
public class BuildingDAOImpl implements BuildingDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<BuildingVO> selectBuildingListBySearchTypes(SearchTypeVO searchTypes) throws Exception {
		List<BuildingVO> buildingList = session.selectList("Building-Mapper.selectBuildingListBySearchTypes", searchTypes);
		return buildingList;
	}

}
