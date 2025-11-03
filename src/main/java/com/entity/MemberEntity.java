package com.entity;

import java.util.List;
import java.util.UUID;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "members")
public class MemberEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	UUID memberId;
	String firstName;
	String lastName;
	String gender;
	


	
	@ManyToOne
	@JoinColumn(name="userId")
	UserEntity user;
}
