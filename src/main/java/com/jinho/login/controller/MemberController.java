package com.jinho.login.controller;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@Autowired
	private MailSender mailSender;
	
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
		
		
		return "redirect: Main";
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
	
	
	/**
	 * 인증메일 보내기 
	 */
	@GetMapping("/emailConfirm")
	@ResponseBody
	public String emailSend(HttpServletRequest request, String memberEmail) {
		
		HttpSession session = request.getSession();
		
		//랜덤 10자리 인증코드 생성하기
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		String code;
		
		for (int i = 0; i < 10; i++) {
			if(random.nextBoolean()) {
				sb.append(random.nextInt(10));
			}else {
				sb.append((char)(random.nextInt(26)+97));
			}
		}
		code = sb.toString();
		
		session.setAttribute("code", code);
		
		
		  SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		  simpleMailMessage.setTo(memberEmail);
		  simpleMailMessage.setSubject("로그인 인증코드 발송입니다.");
		  simpleMailMessage.setText("인증코드는 발송 메일입니다." + "\r\n인증코드는 ["+ code + "] 입니다");
		  simpleMailMessage.setFrom("shmmer619@gmail.com");
		 
		mailSender.send(simpleMailMessage);
		
		return code;
	}
	
	
	@PostMapping("/memberPage")
	public String goMember(MemberVO memberVO, Model model) {
		System.out.println("goMember");
		memberVO = memberService.getMember(memberVO.getMemberId());
		System.out.println(memberVO);
		model.addAttribute("memberVO",memberVO);
		return "member/checkInfo";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "member/loginMain";
	}
	
	@PostMapping("/changeInfo")
	public String changeGo(Model model,MemberVO memberVO) {
		
		memberVO = memberService.getMember(memberVO.getMemberId());
		
		model.addAttribute("member", memberVO);
		
		return "member/updateInfo";
	}
	
	@PostMapping("/updateInfo")
public String updateInfo(MemberVO memberVO,HttpServletRequest request, Model model) {
		
		MultipartFile file = memberVO.getProfileImg();
		if(file.isEmpty()) {
			System.out.println("이미지파일 그대로 유지");
		}
		
		else {
			String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload");
			File saveFolder = new File(saveDir);
	//		임시저장된 파일
			
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
		}
		
		if(memberService.updateMember(memberVO))
			log.info("등록되었습니다");
		
		model.addAttribute("memberVO",memberVO);
		return "member/checkInfo";	
	}
}
