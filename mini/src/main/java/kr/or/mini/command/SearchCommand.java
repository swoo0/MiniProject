package kr.or.mini.command;

import java.util.List;

import kr.or.mini.dto.SearchTypeVO;

public class SearchCommand {

	private List<String> searchList;   // 검색 세권 목록.

	
	public SearchTypeVO toSerchTypeVO() throws Exception {
		SearchTypeVO serch = new SearchTypeVO();
		
		for (String str : searchList) {
			System.out.println(str);
		}
		
		
		
		return serch;
	}
	
	
	
	
	
	
}