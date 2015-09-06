package cn.com.narwal.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class Messagepanel {
	
	private int id;
	private String from;
	private String say_something;
	private String to;
	private Timestamp time;
	
	
	public Messagepanel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Messagepanel(int id, String from, String say_something, String to,
			Timestamp time) {
		super();
		this.id = id;
		this.from = from;
		this.say_something = say_something;
		this.to = to;
		this.time = time;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getSay_something() {
		return say_something;
	}
	public void setSay_something(String say_something) {
		this.say_something = say_something;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
	
	@Override
	public String toString() {
		return "Messagepanel [id=" + id + ", from=" + from + ", say_something="
				+ say_something + ", to=" + to + ", time=" + time + "]";
	}
	
	
	//设置返回对象或各个属性的值
	public void setPropertyValues(ResultSet rs) throws SQLException {
		id = rs.getInt("n_id");
		from = rs.getString("n_from");
		say_something = rs.getString("n_say_something");
		to = rs.getString("n_to");
		time = rs.getTimestamp("n_time");
	}
	

}
