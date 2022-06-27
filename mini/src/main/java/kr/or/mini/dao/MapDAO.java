package kr.or.mini.dao;

import java.util.List;

import kr.or.mini.dto.AnimalVO;
import kr.or.mini.dto.HospitalVO;
import kr.or.mini.dto.MallVO;
import kr.or.mini.dto.ParkVO;
import kr.or.mini.dto.SchoolVO;
import kr.or.mini.dto.SubwayVO;

public interface MapDAO {

	List<SubwayVO> selectSubwayList() throws Exception; 
	List<SchoolVO> selectSchoolList() throws Exception; 
	List<ParkVO> selectParkList() throws Exception; 
	List<MallVO> selectMallList() throws Exception; 
	List<HospitalVO> selectHospitalList() throws Exception; 
	List<AnimalVO> selectAnimalList() throws Exception; 
	
}
