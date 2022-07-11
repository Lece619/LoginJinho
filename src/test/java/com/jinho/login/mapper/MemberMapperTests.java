package com.jinho.login.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jinho.login.domain.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	/*
	 * @Autowired private TimeMapper timeMapper;
	 * 
	 * @Test public void testGetTime() { log.info(timeMapper.getClass().getName());
	 * log.info(timeMapper.getTime()); }
	 */
	@Autowired
	private MemberMapper memberMapper;
	
//	@Test
//	public void testGetList() {
//		log.info("----------------------------------------------");
//		memberMapper.getList().forEach(log::info);
//	}
	@Test
	public void testInsert() {
		MemberVO vo = new MemberVO();
		vo.setMemberId("ds");
		memberMapper.insert(vo);
		
		log.info("----------------------------------------------");
		memberMapper.getList().forEach(log::info);
	}
	 
	
}
