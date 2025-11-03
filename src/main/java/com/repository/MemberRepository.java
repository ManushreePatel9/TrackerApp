package com.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.MemberEntity;
import com.entity.UserEntity;

@Repository
public interface MemberRepository extends JpaRepository<MemberEntity, UUID> {
//	List<MemberEntity> findMembers(UserEntity user.user);
	List<MemberEntity> findAllByUserUserId(UUID userId);



	
	
}
