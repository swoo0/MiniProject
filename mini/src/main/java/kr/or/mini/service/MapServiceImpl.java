package kr.or.mini.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.mini.dao.MapDAO;
import kr.or.mini.dto.AnimalVO;
import kr.or.mini.dto.HospitalVO;
import kr.or.mini.dto.MallVO;
import kr.or.mini.dto.ParkVO;
import kr.or.mini.dto.SchoolVO;
import kr.or.mini.dto.SubwayVO;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	private MapDAO mapDAO;
	
//	@Override
//	public Map<String, List<Object>> getBaseMarkerList() throws Exception {
//		Map<String, List<Object>> dataMap = new HashMap<String, List<Object>>();
//		
//		List<SubwayVO> subwayList = mapDAO.selectSubwayList();
//		List<SchoolVO> schoolList = mapDAO.selectSchoolList();
//		List<ParkVO> parkList = mapDAO.selectParkList();
//		List<MallVO> mallList = mapDAO.selectMallList();
//		List<HospitalVO> hospitalList = mapDAO.selectHospitalList();
//		List<AnimalVO> animalList = mapDAO.selectAnimalList();
//		
//		dataMap.put("subwayList", subwayList);
//		dataMap.put("schoolList", schoolList);
//		dataMap.put("parkList", parkList);
//		dataMap.put("mallList", mallList);
//		dataMap.put("hospitalList", hospitalList);
//		dataMap.put("animalList", animalList);
//		
//		return dataMap;
//	}
	
	@Override
	public List<SubwayVO> getSubwayList() throws Exception {
		List<SubwayVO> subwayList = null;
		subwayList = mapDAO.selectSubwayList();
		return subwayList;
	}

	@Override
	public List<SchoolVO> getSchoolList() throws Exception {
		List<SchoolVO> schoolList = null;
		schoolList = mapDAO.selectSchoolList();
		return schoolList;
	}

	@Override
	public List<ParkVO> getParkList() throws Exception {
		List<ParkVO> parkList = null;
		parkList = mapDAO.selectParkList();
		return parkList;
	}

	@Override
	public List<MallVO> getMallList() throws Exception {
		List<MallVO> mallList = null;
		mallList = mapDAO.selectMallList();
		return mallList;
	}

	@Override
	public List<HospitalVO> getHospitalList() throws Exception {
		List<HospitalVO> hospitalList = null;
		hospitalList = mapDAO.selectHospitalList();
		return hospitalList;
	}

	@Override
	public List<AnimalVO> getAnimalList() throws Exception {
		List<AnimalVO> animalList = null;
		animalList = mapDAO.selectAnimalList();
		return animalList;
	}

}
