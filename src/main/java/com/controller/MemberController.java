package com.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.MemberEntity;
import com.entity.UserEntity;
import com.repository.MemberRepository;
import com.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	
	@Autowired
	MemberRepository memberRepository;
	UserRepository userRepository;
	
	@GetMapping("addmember1")
	public String a() {
		return "AddMember";
	}
	
	
	@PostMapping("addmember")
	public String addMem(MemberEntity member , UUID userId) {
		memberRepository.save(member);
		System.out.println("Member added");
		return "UserDashboard";
	}
	
	@GetMapping("mymember")
	public String mymember(HttpSession session , Model model) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		UUID userId = user.getUserId();
		
	    List<MemberEntity> members = memberRepository.findAllByUserUserId(userId);
	    model.addAttribute("members" , members);
	    return "AllMembers";
	}
}
