package com.lxh.bean;

import java.util.List;

public class Msg {
	private Integer code;
	private String msg;
	private Integer count;
	private List data;
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public List getData() {
		return data;
	}
	public void setData(List list) {
		this.data = list;
	}
	public Msg() {
		
	}
	public Msg(Integer code, String msg, Integer count, List data) {
		super();
		this.code = code;
		this.msg = msg;
		this.count = count;
		this.data = data;
	}
}
