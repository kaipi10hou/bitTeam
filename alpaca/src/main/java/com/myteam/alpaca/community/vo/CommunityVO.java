package com.myteam.alpaca.community.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;


@Component("communityVO")
public class CommunityVO {
	
	private int c_no;
	private String c_title;
	private String c_content;
	private Date c_date;
	private String id;
	
	public CommunityVO() {
		
	}

	public CommunityVO(int c_no, String c_title, String c_content, Date c_date, String id) {
		super();
		this.c_no = c_no;
		this.c_title = c_title;
		this.c_content = c_content;
		this.c_date = c_date;
		this.id = id;
	}


	@Override
	public String toString() {
		return "CommunityVO [c_no=" + c_no + ", c_title=" + c_title + ", c_content=" + c_content +
				 ", c_date=" + c_date + ", id=" + id + "]";
	}


	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}


	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	

}

