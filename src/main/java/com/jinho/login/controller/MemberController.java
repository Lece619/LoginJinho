package com.jinho.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jinho.login.domain.vo.MemberVO;

import lombok.extern.log4j.Log4j;

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
