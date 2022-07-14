package com.jinho.login.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jinho.login.domain.service.MemberService;
import com.jinho.login.domain.vo.MemberVO;

import lombok.extern.log4j.Log4j;

/*
 * 1. 이메일 보내기
 * 2. 로그인 후 페이지 
 * 3. 수정 페이지 
 * 4. 탈퇴 버튼 
 * 
 */
@Controller
@Log4j
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value={"/","/Main"})
	public String goMain() {
		return "member/loginMain";
	}

	@RequestMapping("/insert")
	public String goInsert(HttpServletRequest request) {
		
		return "member/insertForm";
	}
	
	@PostMapping("/insertOk")
	public String insertOk(MemberVO memberVO,HttpServletRequest request) {
		
//		D: spring_kjh workspace LoginJinho src main web app resources upload
//		서버가 아닌 로컬에 저장하는 방법.
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload");
		File saveFolder = new File(saveDir);
//		임시저장된 파일
		MultipartFile file = memberVO.getProfileImg();
//		저장될 이미지의 이름
		String imgName = file.getOriginalFilename();
		long time = System.currentTimeMillis() % 10000;
		imgName = time+"_"+imgName;
		
		
		//폴더가 없다면 생성 하는데 mkdir vs mkdirs 는 상위폴더가 없으면 mkdirs로 해줘야 전부생성
		if(!saveFolder.exists()) {
			saveFolder.mkdirs();
		}
		//새로운 파일을 생성 지정한 이름
		File upload = new File(saveFolder,imgName);
		
		try {
			//받아온 파일을 upload파일로 변경(이전)
			file.transferTo(upload);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}	
		memberVO.setImgName(upload.getName());
		
		if(memberService.insertMember(memberVO))
			log.info("등록되었습니다");
		
		
		return "member/loginMain";
	}
	
	@PostMapping("/loginCheck")
	@ResponseBody
	public String loginCheck(MemberVO memberVO) {
		log.info("-==----------------------");
		log.info(memberVO);
		if(memberService.loginCheck(memberVO)) {
			return "ok";
		}
		
		return "false";
	}
	
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(String memberId) {
		
		return memberService.idCheck(memberId);
	}
	
}
