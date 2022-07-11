package com.jinho.login.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jinho.login.domain.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	//조회
	public List<MemberVO> getList();
	
	public void insert(MemberVO memberVO);
}
