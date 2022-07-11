package com.jinho.login.exception;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomError {

	@GetMapping("/error")
	public String goErrorPage(HttpServletRequest request) {
		/*
		 * Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		 * System.out.println(RequestDispatcher.ERROR_STATUS_CODE);
		 * System.out.println(HttpStatus.NOT_FOUND.value()); if(status != null) { int
		 * statusCode = Integer.valueOf(status.toString()); if(statusCode ==
		 * HttpStatus.NOT_FOUND.value()) { return "error/404"; } }
		 */
		return "error/error";
	}
}
