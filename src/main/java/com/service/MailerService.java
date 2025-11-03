package com.service;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;


@Service
public class MailerService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendWelcomeMail(String firstname, String email) {
//	SimpleMailMessage msg = new SimpleMailMessage();
//	msg.setTo(email);
//	msg.setSubject("Welcome to TrackerApp");
//	msg.setText("We are happy to help you");
//	mailSender.send(msg);
		
		 try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

	            helper.setTo(email);
	            helper.setSubject("Welcome to Tracker app 🎉");

	            // ✅ HTML email content
	            String htmlContent = """
	            		<html>
	            		  <body style="margin: 0; padding: 0; background: linear-gradient(135deg, #1a1a2e, #162447); font-family: 'Poppins', sans-serif;">
	            		    <table align="center" width="650" cellpadding="0" cellspacing="0" style="background: #ffffff; border-radius: 18px; margin-top: 30px; box-shadow: 0 8px 30px rgba(0,0,0,0.15); overflow: hidden;">
	            		      
	            		      <!-- HEADER -->
	            		      <tr>
	            		        <td style="background: linear-gradient(135deg, #ff6a88, #ffb88c); text-align: center; padding: 25px 10px; color: #fff;">
	            		          <h1 style="margin: 0; font-size: 30px; letter-spacing: 1px;">Welcome to TrackerPro 📊</h1>
	            		          <p style="margin-top: 8px; font-size: 15px;">Your goals, your progress — beautifully tracked!</p>
	            		        </td>
	            		      </tr>
	            		      
	            		      <!-- BODY -->
	            		      <tr>
	            		        <td style="padding: 35px 45px; color: #333;">
	            		          <h2 style="margin-top: 0;">Hey, %s 👋</h2>
	            		          <p style="font-size: 16px; line-height: 1.7;">
	            		            We're thrilled to welcome you to <strong>TrackerPro</strong> — your personal progress tracker that keeps you motivated, productive, and inspired every day.
	            		          </p>
	            		          <p style="font-size: 16px; line-height: 1.7;">
	            		            🎯 Track your habits, 📅 monitor your routines, and 🌟 visualize your journey — all in one place.
	            		          </p>

	            		          <div style="text-align: center; margin: 35px 0;">
	            		            <a href="https://www.trackerpro.com/login" 
	            		               style="background: linear-gradient(45deg, #1a1a2e, #ff6a88); 
	            		                      color: white; padding: 15px 35px; 
	            		                      border-radius: 40px; 
	            		                      text-decoration: none; 
	            		                      font-size: 16px; 
	            		                      font-weight: 600; 
	            		                      letter-spacing: 0.5px;
	            		                      box-shadow: 0 6px 15px rgba(255,106,136,0.3);
	            		                      transition: 0.3s;">
	            		              🚀 Go to Your Dashboard
	            		            </a>
	            		          </div>

	            		          <p style="font-size: 15px; color: #555; line-height: 1.7;">
	            		            💡 Tip: Stay consistent — your tracker grows smarter as you use it!
	            		          </p>
	            		          <p style="font-size: 14px; color: #999; margin-top: 20px;">
	            		            If you ever need help, our support team is just an email away.
	            		          </p>
	            		          <p style="font-size: 14px; color: #999; margin-top: 15px;">
	            		            With determination,<br>
	            		            <strong>The TrackerPro Team ❤️</strong>
	            		          </p>
	            		        </td>
	            		      </tr>

	            		      <!-- FOOTER -->
	            		      <tr>
	            		        <td style="background: #f9f9f9; text-align: center; padding: 18px; font-size: 12px; color: #888;">
	            		          © 2025 TrackerPro. All rights reserved.<br>
	            		          <a href="https://www.trackerpro.com/unsubscribe" style="color: #ff6a88; text-decoration: none;">Unsubscribe</a> |
	            		          <a href="https://www.trackerpro.com/privacy" style="color: #ff6a88; text-decoration: none;">Privacy Policy</a>
	            		        </td>
	            		      </tr>
	            		    </table>
	            		  </body>
	            		</html>
	            		""".formatted(firstname);


	            helper.setText(htmlContent, true); // true = send HTML

	            mailSender.send(message);

	            System.out.println("✅ Email sent successfully to " + email);

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
	 }
	
	 public void sendOtpForForgetPassword(String otp, String email) {

			MimeMessage message = mailSender.createMimeMessage();
			try {
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
				helper.setTo(email);
				helper.setSubject("CampusCare : Reset Password OTP ");

				ClassPathResource resource = new ClassPathResource("templates/forgetpassword.html");
				
				String template = Files.readString(resource.getFile().toPath(), StandardCharsets.UTF_8);
			
				template  = template.replace("{{otp_code}}", otp);	
				helper.setText(template, true);

				mailSender.send(message);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	
}
