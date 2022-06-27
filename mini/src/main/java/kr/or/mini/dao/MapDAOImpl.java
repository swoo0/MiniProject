package kr.or.mini.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.mini.dto.AnimalVO;
import kr.or.mini.dto.HospitalVO;
import kr.or.mini.dto.MallVO;
import kr.or.mini.dto.ParkVO;
import kr.or.mini.dto.SchoolVO;
import kr.or.mini.dto.SubwayVO;

@Repository
public class MapDAOImpl implements MapDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<SubwayVO> selectSubwayList() throws Exception {
		List<SubwayVO> subwayList = session.selectList("Subway-Mapper.selectSubwayList");
		
		return subwayList;
	}

	@Override
	public List<SchoolVO> selectSchoolList() throws Exception {
		List<SchoolVO> schoolList = session.selectList("School-Mapper.selectSchoolList");
		return schoolList;
	}

	@Override
	public List<ParkVO> selectParkList() throws Exception {
		List<ParkVO> parkList = session.selectList("Park-Mapper.selectParkList");
		return parkList;
	}

	@Override
	public List<MallVO> selectMallList() throws Exception {
		List<MallVO> mallList = session.selectList("Mall-Mapper.selectMallList");
		return mallList;
	}

	@Override
	public List<HospitalVO> selectHospitalList() throws Exception {
		List<HospitalVO> hospitalList = session.selectList("Hospital-Mapper.selectHospitalList");
		return hospitalList;
	}

	@Override
	public List<AnimalVO> selectAnimalList() throws Exception {
		List<AnimalVO> animalList = session.selectList("Animal-Mapper.selectAnimalList");
		return animalList;
	}

}
