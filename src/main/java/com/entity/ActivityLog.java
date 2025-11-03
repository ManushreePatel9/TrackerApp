package com.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name="activity_log")
public class ActivityLog {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	Integer activityLogId;
	
	String countable;
	String notes;
    LocalDateTime logDateTime;
    

    
    @ManyToOne
    @JoinColumn(name = "userId")
    private UserEntity user;

    @ManyToOne
    @JoinColumn(name = "memberId")
    private MemberEntity memberId;

    @ManyToOne
    @JoinColumn(name = "activityId")
    private ActivityEntity activityId;
    
    
    @PrePersist
    public void prePersist() {
        this.logDateTime = LocalDateTime.now();
    }

}
