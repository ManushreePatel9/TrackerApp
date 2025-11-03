package com.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.UserEntity;
import com.repository.UserRepository;
import com.service.MailerService;
import com.service.OtpGeneratorService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SessionController {

    private final UserController userController;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	MailerService mailerService;
	
	@Autowired
	OtpGeneratorService otpService;
	
	

	
	
	@GetMapping("forgetpassword")
	public String forgetpassword() {
		return "ForgetPassword";
	}
	
	
	@PostMapping("sendotp")
	public String sendOtp(String email, Model model , HttpSession session) {

		Optional<UserEntity> op = userRepository.findByEmail(email);
		if(op.isPresent()) {
			System.out.println("email mil gya");
			String otp = otpService.generateOtp(6);
			session.setAttribute("otp", otp);
			session.setAttribute("email", email);

					mailerService.sendOtpForForgetPassword(otp,email);
			return "ChangePassword"; 

		}else {
			model.addAttribute("error", "Invalid Email");
			System.out.println("Error Invalid email");
			return "ForgetPassword";
		}

	}
	
	


	
	@PostMapping("changepassword")
	public String changePassword(String otp, String password, HttpSession session, Model model) {

	    String email = (String) session.getAttribute("email");
	    String originalOtp = (String) session.getAttribute("otp");
	    System.out.println("Og otp : " + originalOtp);
	    System.out.println("Email : " + email);

	    if (originalOtp != null && originalOtp.equals(otp)) {

	       
	        Optional<UserEntity> optionalUser = userRepository.findByEmail(email);

	        if (optionalUser.isPresent()) {
	            UserEntity user = optionalUser.get();

	            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	            String encodedPwd = passwordEncoder.encode(password);

	           
	            user.setPassword(encodedPwd);
	            userRepository.save(user);

	            model.addAttribute("message", "Password changed successfully!");
	            return "Login";

	        } else {
	            model.addAttribute("error", "User not found!");
	            return "ForgetPassword";
	        }

	    } else {
	        model.addAttribute("error", "Invalid OTP!");
	        return "ForgetPassword";
	    }
	}

	


    SessionController(UserController userController) {
        this.userController = userController;
    }
	
		


	
	@GetMapping("/")
	public String root() {
		return "Signup";
	}
	@GetMapping("login")
	public String login1() {
		return "Login";
	}
	
	@PostMapping("saveuser")
	public String saveuser(UserEntity user) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		String ePwd = passwordEncoder.encode(user.getPassword());
		user.setPassword(ePwd);
		userRepository.save(user);
		mailerService.sendWelcomeMail(user.getFirstName() , user.getEmail());
		
		return "redirect:/login";
	}
	
	@PostMapping("login")
	public String login(String email , String password , Model model , HttpSession session) {
		
		Optional<UserEntity> op = userRepository.findByEmail(email);
		if(op.isPresent()) {
			UserEntity user = op.get();
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

			
			
			try {
				try {
					if(passwordEncoder.matches(password , user.getPassword())) {
					
//				if(user.getPassword().equals(password)) {
						System.out.println(user.getFirstName() + " Verified");
						session.setAttribute("user", user);
						model.addAttribute("user",user);
						return "UserDashboard";
					}else {
						model.addAttribute("error","Invalid email or password");
						return "Login";
					}
				} catch (Exception e) {
					model.addAttribute("error","Invalid email or password");
					return "Login";
					// TODO Auto-generated catch block
//					e.printStackTrace();
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "Login";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "Login";
	}
	
	
}
