package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.ActivityEntity;
import com.entity.ActivityLog;
import com.entity.AddActivityDB;
import com.entity.MemberEntity;
import com.entity.UserEntity;
import com.repository.ActivityLogRepository;
import com.repository.ActivityRepository;
import com.repository.ActvityAddDB;
import com.repository.MemberRepository;
import com.repository.UserRepository;

@Controller
public class ActivityController {


	@Autowired
	ActivityRepository activityRepo;
	@Autowired
	UserRepository userRepository;
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	ActivityLogRepository activityLogRepository;
	@Autowired
	ActvityAddDB activityAdddbRepo;



	
	@GetMapping("addactivity1")
	public String addactivity1(Model model) {

        List<ActivityEntity> activities = activityRepo.findAll();
        List<MemberEntity> members = memberRepository.findAll();
        
        HashMap<Integer,String> activityMap = new HashMap<>();
        HashMap<UUID,String> memberMap = new HashMap<>();
        
        for (ActivityEntity act : activities) {
            activityMap.put(act.getActivityId(), act.getActivityName());
        }

        for (MemberEntity mem : members) {
            memberMap.put(mem.getMemberId(), mem.getFirstName());
        }
        
        model.addAttribute("activityMap", activities);
        model.addAttribute("memberMap", members);
        
        return "AddActivity";
	}
	
	
	@PostMapping("addactivity")
	public String addactivity(ActivityLog activityLogEntity) {
		activityLogRepository.save(activityLogEntity);
		System.out.println("Done");
		return "success";
	}
	
	@GetMapping("addactivitydb")
	public String addactivitydb() {
		
		return "AddActivityDb";
	}
	
	@PostMapping("addActivityDB")
	public String addActivityDB(ActivityEntity activityEntity,Model model) {
		
		activityRepo.save(activityEntity);
		System.out.println("Save");
		model.addAttribute("msg","Saved");
		return "AddActivityDb";
	}
	
	@GetMapping("viewactivity")
	public String viewactivity(Model model) {
	
		List<ActivityLog> logs = activityLogRepository.findAll();
	    model.addAttribute("logs", logs);
		
        return "ViewLogs"; 
	}
	
}
