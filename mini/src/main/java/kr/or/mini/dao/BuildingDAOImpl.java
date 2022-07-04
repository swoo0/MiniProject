package kr.or.mini.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.mini.dto.PrivateBgVO;
import kr.or.mini.dto.PublicBgVO;
import kr.or.mini.dto.SearchTypeVO;

@Repository
public class BuildingDAOImpl implements BuildingDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<PublicBgVO> selectPublicBuildingListBySearchTypes(SearchTypeVO searchTypes) throws Exception {
		List<PublicBgVO> buildingList = session.selectList("Building-Mapper.selectPublicBgListBySearchTypes", searchTypes);
		return buildingList;
	}
	
	@Override
	public List<PrivateBgVO> selectPrivateBuildingListBySearchTypes(SearchTypeVO searchTypes) throws Exception {
		List<PrivateBgVO> buildingList = session.selectList("Building-Mapper.selectPrivateBgListBySearchTypes", searchTypes);
		return buildingList;
	}
	
}
