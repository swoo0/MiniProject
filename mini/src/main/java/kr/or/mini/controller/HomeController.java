package kr.or.mini.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.mini.dao.HomeDao;
import kr.or.mini.dto.HomeDto;

@Controller
public class HomeController {
	
	@Autowired
	HomeDao homeDao;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/test/home", method = RequestMethod.GET)
	public void home(Model model) {
		List<HomeDto> list = homeDao.sel();
		for(int i=0; i<list.size(); i++){
			logger.info(list.get(i).getAccount_idx());
			logger.info(list.get(i).getId());
			model.addAttribute("ID", list.get(0).getId() );
		}
	}
	
	@RequestMapping(value = "/ol/ol3_306", method = RequestMethod.GET)
	public String ol3_106() {
		String url = "ol/ol3_306";
		
		return url;
	}
	
	@RequestMapping(value = "/vworld", method = RequestMethod.GET)
	public void vworld() {}

}
