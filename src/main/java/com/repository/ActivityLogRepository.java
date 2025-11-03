package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.entity.ActivityLog;

public interface ActivityLogRepository extends JpaRepository<ActivityLog, Integer>{

}
