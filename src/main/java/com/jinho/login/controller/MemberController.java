package com.jinho.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jinho.login.domain.vo.MemberVO;

import lombok.extern.log4j.Log4j;

/* 0. 이미지 파일 저장 - 다음페이지 출력
 * 1. 해야 할 일 insert 구현 
 * 2. 아이디 중복 버튼 ajax 
 * 3. 비밀번호 확인 
 * 4. 이메일 보내기
 * 5. 
 * 
 */
@Controller
@Log4j
public class MemberController {
	
	@RequestMapping("/Main")
	public String goMain() {
		return "member/loginMain";
	}

	@RequestMapping("/insert")
	public String goInsert() {
		return "member/insertForm";
	}
	
	@PostMapping("/insertOk")
	public String insertOk(MemberVO memberVO) {
		
		log.info(memberVO);
		
		return "member/loginMain";
	}
	
	
}
