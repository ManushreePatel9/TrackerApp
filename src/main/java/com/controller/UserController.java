package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	
	@GetMapping("userdashboard")
	public String userdashboard() {
		return "UserDashboard";
	}
	@GetMapping("profile")
	public String profile() {
		
		return "Profile";
	}
	
	
	
}
