package cn.com.narwal.model;

import java.sql.Timestamp;

public class Messagewall {
	
	private int id;	//留言信息id
	private String nickname; //留言人昵称
	private String content;	//留言内容
	private Timestamp time;	//留言时间
	
	//生成构造方法
	public Messagewall() {
		super();
	}
	public Messagewall(int id, String nickname, String content, Timestamp time) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.content = content;
		this.time = time;
	}

	//get and set method
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
	//生成 toString 方法
	@Override
	public String toString() {
		return "Messagewall [id=" + id + ", nickname=" + nickname
				+ ", content=" + content + ", time=" + time + "]";
	}
	
}
