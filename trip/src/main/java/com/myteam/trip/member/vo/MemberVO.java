package com.myteam.trip.member.vo;


import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private String name;
	private String email;
	private String pwd;
	private String id;
	
	public MemberVO() {
		
	}

	public MemberVO(String name, String email, String pwd, String id) {
		super();
		this.name = name;
		this.email = email;
		this.pwd = pwd;
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	
}
