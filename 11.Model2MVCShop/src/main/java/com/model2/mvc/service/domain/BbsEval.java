package com.model2.mvc.service.domain;

import java.sql.Date;

public class BbsEval {
	
	//Field
	private int contentNo;
	private User bbsUser;
	private Product bbsProd;
	private String contentName;
	private Date regDate;
	private int evalPoint;
	private String content;
	private String filename;
	
	//Constructor
	public BbsEval() {
		
	}
	
	//Method	
	
	public final int getContentNo() {
		return contentNo;
	}
	public final void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}
	public final User getBbsUser() {
		return bbsUser;
	}
	public final void setBbsUser(User bbsUser) {
		this.bbsUser = bbsUser;
	}
	public final Product getBbsProd() {
		return bbsProd;
	}
	public final void setBbsProd(Product bbsProd) {
		this.bbsProd = bbsProd;
	}
	public final String getContentName() {
		return contentName;
	}
	public final void setContentName(String contentName) {
		this.contentName = contentName;
	}
	public final Date getRegDate() {
		return regDate;
	}
	public final void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public final int getEvalPoint() {
		return evalPoint;
	}
	public final void setEvalPoint(int evalPoint) {
		this.evalPoint = evalPoint;
	}
	public final String getContent() {
		return content;
	}
	public final void setContent(String content) {
		this.content = content;
	}

	public final String getFilename() {
		return filename;
	}

	public final void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "BbsEval [contentNo=" + contentNo + ", bbsUser=" + bbsUser + ", bbsProd=" + bbsProd + ", contentName="
				+ contentName + ", regDate=" + regDate + ", evalPoint=" + evalPoint + ", content=" + content
				+ ", filename=" + filename + "]";
	}	

}
