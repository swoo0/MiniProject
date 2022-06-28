package kr.or.mini.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.mini.dto.AnimalVO;
import kr.or.mini.dto.HospitalVO;
import kr.or.mini.dto.MallVO;
import kr.or.mini.dto.ParkVO;
import kr.or.mini.dto.SchoolVO;
import kr.or.mini.dto.SubwayVO;
import kr.or.mini.service.MapService;

@Controller
public class MapController {

	@Autowired	
	MapService mapService;
	
	@RequestMapping(value = "/subway", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<SubwayVO>> subway(Model model) throws Exception {
		ResponseEntity<List<SubwayVO>> entity = null;
		
		List<SubwayVO> subwayList = new ArrayList<>();
		try {
			subwayList = mapService.getSubwayList();
			entity = new ResponseEntity<List<SubwayVO>>(subwayList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<SubwayVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value = "/school", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<SchoolVO>> school(Model model) throws Exception {
		ResponseEntity<List<SchoolVO>> entity = null;
		
		List<SchoolVO> schoolList = new ArrayList<>();
		try {
			schoolList = mapService.getSchoolList();
			entity = new ResponseEntity<List<SchoolVO>>(schoolList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<SchoolVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value = "/park", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<ParkVO>> park(Model model) throws Exception {
		ResponseEntity<List<ParkVO>> entity = null;
		
		List<ParkVO> parkList = new ArrayList<>();
		try {
			parkList = mapService.getParkList();
			entity = new ResponseEntity<List<ParkVO>>(parkList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ParkVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value = "/mall", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<MallVO>> mall(Model model) throws Exception {
		ResponseEntity<List<MallVO>> entity = null;
		
		List<MallVO> mallList = new ArrayList<>();
		try {
			mallList = mapService.getMallList();
			entity = new ResponseEntity<List<MallVO>>(mallList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<MallVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value = "/hospital", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<HospitalVO>> hospital(Model model) throws Exception {
		ResponseEntity<List<HospitalVO>> entity = null;
		
		List<HospitalVO> hospitalList = new ArrayList<>();
		try {
			hospitalList = mapService.getHospitalList();
			entity = new ResponseEntity<List<HospitalVO>>(hospitalList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<HospitalVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value = "/animal", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<AnimalVO>> animal(Model model) throws Exception {
		ResponseEntity<List<AnimalVO>> entity = null;
		
		List<AnimalVO> animalList = new ArrayList<>();
		try {
			animalList = mapService.getAnimalList();
			entity = new ResponseEntity<List<AnimalVO>>(animalList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<AnimalVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
}
