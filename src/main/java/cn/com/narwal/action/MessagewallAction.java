package cn.com.narwal.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import cn.com.narwal.dao.MessagewallDAO;
import cn.com.narwal.model.Messagewall;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("json-default")
@Namespace("/module/messagewall")
@Results({  
    @Result(name = "json",type = "json", params = {"root","msg"})  
}) 
public class MessagewallAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private Messagewall messagewallObj;
	protected Logger log = Logger.getLogger(MessagewallAction.class);
	private Map<String, Object> msg;
	

	public Map<String, Object> getMsg() {
		return msg;
	}

	public void setMsg(Map<String, Object> msg) {
		this.msg = msg;
	}

	public Messagewall getMessagewallObj() {
		return messagewallObj;
	}

	public void setMessagewallObj(Messagewall messagewallObj) {
		this.messagewallObj = messagewallObj;
	}

	//保存留言的方法
	@Action(value="saveNote")
	public String saveNote() {
		msg = new HashMap<String, Object>();
		MessagewallDAO messagewallDao = new MessagewallDAO();
		Timestamp timestamp = new Timestamp(new Date().getTime());
		
		msg.put("flag", "success");
		
		messagewallObj.setTime(timestamp);
		
		Map<String, Object> savedNote = new HashMap<String, Object>();
		savedNote.put("id", messagewallObj.getId());
		savedNote.put("nickname", messagewallObj.getNickname());
		savedNote.put("content", messagewallObj.getContent());
		savedNote.put("time", messagewallObj.getTime());
		 
		msg.put("savedNote", savedNote);
		
		log.info("-----action saveNote-----------");
		messagewallDao.save(messagewallObj);
		return "json";	
	}
	
	//取得所有留言墙的message并返回list
	@Action(value="listAllNote")
	public String listAllNote() {
		
		msg = new HashMap<String, Object>();
		MessagewallDAO messagewallDao = new MessagewallDAO();
		List<Messagewall> messagewallList = new ArrayList<Messagewall>();
		Map<String, List<Messagewall>> noteList = new HashMap<String, List<Messagewall>>();
		
		messagewallList = messagewallDao.listAll();
		
		msg.put("flag", "success");
		
		noteList.put("noteList", messagewallList);
		
		msg.put("messagewallList", noteList);
		
		log.info("----------messagewallaction listAllNote-------");
		return "json";
	}

}
