package kr.or.mini.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.mini.dto.HomeDto;

@Repository
public class HomeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<HomeDto> sel() {
		return sqlSession.selectList("sql.sel");
	}
}
