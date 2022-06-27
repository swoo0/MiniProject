package kr.or.mini.service;

import java.util.List;

import kr.or.mini.dto.AnimalVO;
import kr.or.mini.dto.HospitalVO;
import kr.or.mini.dto.MallVO;
import kr.or.mini.dto.ParkVO;
import kr.or.mini.dto.SchoolVO;
import kr.or.mini.dto.SubwayVO;

public interface MapService {

//	Map<String, List<Object>> getBaseMarkerList() throws Exception;
	
	List<SubwayVO> getSubwayList() throws Exception; 
	List<SchoolVO> getSchoolList() throws Exception; 
	List<ParkVO> getParkList() throws Exception; 
	List<MallVO> getMallList() throws Exception; 
	List<HospitalVO> getHospitalList() throws Exception; 
	List<AnimalVO> getAnimalList() throws Exception; 
	
}
