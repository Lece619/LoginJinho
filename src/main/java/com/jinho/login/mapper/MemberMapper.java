package com.jinho.login.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jinho.login.domain.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	//조회
	public List<MemberVO> getList();
	
	public int insert(MemberVO memberVO);

	public int loginCheck(MemberVO memberVO);

	public int hasId(String memberId);
	
	public MemberVO getById(String memberId);

	public int update(MemberVO memberVO);
}
