package com.jinho.login.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jinho.login.domain.vo.MemberVO;
import com.jinho.login.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	public boolean insertMember(MemberVO memberVO) {
		
		return memberMapper.insert(memberVO) == 1 ;
	}
	
}
