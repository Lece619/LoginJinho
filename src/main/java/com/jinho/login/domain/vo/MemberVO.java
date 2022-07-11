package com.jinho.login.domain.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Component
@Data
public class MemberVO {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private String memberZipcode;
	private String memberAddress;
	private String memberAddressDetail;
	private String memberAddressEtc;
	private MultipartFile profileImg;
	private String imgName;
	
}
