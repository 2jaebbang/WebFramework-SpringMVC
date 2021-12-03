package kr.ac.hansung.cse.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	@RequestMapping("/login")
	public String showLogin(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {

		// 에러발생 메시지 띄움
		if (error != null)
			model.addAttribute("errorMsg", "Invalid username and password");

		// 로그아웃 메시지 띄움
		if (logout != null)
			model.addAttribute("logoutMsg", "You have been logged out successfully");

		System.out.println("log in!");

		return "login";
	}
}
