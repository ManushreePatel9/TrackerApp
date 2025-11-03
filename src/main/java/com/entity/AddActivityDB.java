package com.entity;

import java.beans.JavaBean;
import java.util.UUID;

import org.springframework.stereotype.Controller;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name="activities")
public class AddActivityDB {
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY) 
		Integer activityId;
		String activityName;
		
		  @ManyToOne
		   @JoinColumn(name = "userId")
		    UserEntity user;
}
