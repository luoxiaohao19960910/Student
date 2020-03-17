package com.lxh.bean;

public class TeacherLogin {
	private Integer loginId;
	private String loginPassword;
	public Integer getLoginId() {
		return loginId;
	}
	public void setLoginId(Integer loginId) {
		this.loginId = loginId;
	}
	public String getLoginPassword() {
		return loginPassword;
	}
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
	public TeacherLogin() {

	}
	public TeacherLogin(Integer loginId, String loginPassword) {
		this.loginId = loginId;
		this.loginPassword = loginPassword;
	}
}
