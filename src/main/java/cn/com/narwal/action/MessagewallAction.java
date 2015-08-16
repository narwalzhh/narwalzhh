package cn.com.narwal.action;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.log4j.Logger;

import cn.com.narwal.dao.MessagewallDAO;
import cn.com.narwal.model.Messagewall;

import com.opensymphony.xwork2.ActionSupport;

public class MessagewallAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private Messagewall messagewallObj;
	protected Logger log = Logger.getLogger(MessagewallAction.class);

	
	public Messagewall getMessagewallObj() {
		return messagewallObj;
	}

	public void setMessagewallObj(Messagewall messagewallObj) {
		this.messagewallObj = messagewallObj;
	}

	//保存留言的方法
	public String saveNote() {
		MessagewallDAO messagewallDao = new MessagewallDAO();
		Timestamp timestamp = new Timestamp(new Date().getTime());
		messagewallObj.setTime(timestamp);
		log.info("-----action saveNote-----------" + messagewallObj.toString());
		messagewallDao.save(messagewallObj);
		return SUCCESS;
	}

}
