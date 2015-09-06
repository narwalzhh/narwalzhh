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

import cn.com.narwal.dao.MessagepanelDAO;
import cn.com.narwal.model.Messagepanel;

import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("json-default")
@Namespace(value="/module/message")
@Results({  
    @Result(name = "json",type = "json", params = {"root","msg"})  
}) 
public class MessagepanelAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	private Messagepanel messagepanelobj;
	protected Logger log = Logger.getLogger(MessagepanelAction.class);
	private Map<String, Object> msg;
	public Messagepanel getMessagepanelobj() {
		return messagepanelobj;
	}
	public void setMessagepanelobj(Messagepanel messagepanelobj) {
		this.messagepanelobj = messagepanelobj;
	}
	public Map<String, Object> getMsg() {
		return msg;
	}
	public void setMsg(Map<String, Object> msg) {
		this.msg = msg;
	}
	
	@Action(value="saveMessage")
	public String saveMessage() {
		
		msg = new HashMap<String, Object>();
		MessagepanelDAO messagepanelDAO = new MessagepanelDAO();
		Timestamp timestamp = new Timestamp(new Date().getTime());
		
		msg.put("flag", "success");
		
		messagepanelobj.setTime(timestamp);
		
		Map<String, Object> savedMessage = new HashMap<String, Object>();
		savedMessage.put("id", messagepanelobj.getId());
		savedMessage.put("from", messagepanelobj.getFrom());
		savedMessage.put("say_someting", messagepanelobj.getSay_something());
		savedMessage.put("to", messagepanelobj.getTo());
		savedMessage.put("time", messagepanelobj.getTime());
		
		msg.put("savedMessage", savedMessage);
		
		log.info("-----action messagepanel saveMessage-----------");
		
		messagepanelDAO.save(messagepanelobj);
		
		return "json";
	}

	@Action(value="listAllMessage")
	public String listAllMessage() {
		
		msg = new HashMap<String, Object>();
		MessagepanelDAO messagepanelDAO = new MessagepanelDAO();
		List<Messagepanel> messagepanelList = new ArrayList<Messagepanel>();
		Map<String, List<Messagepanel>> messageList = new HashMap<String, List<Messagepanel>>();
		
		messagepanelList = messagepanelDAO.listAll();
		
		msg.put("flag", "success");
		
		messageList.put("messageList", messagepanelList);
		
		msg.put("messagepanelList", messageList);
		
		log.info("----------messagepanelaction listAllMessage-------");
		return "json";
	}
}
