package cn.com.narwal.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import cn.com.narwal.utils.SimulationLogin;

import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("json-default")
@Namespace("/")
public class QueryForGradeAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	protected Logger log = Logger.getLogger(QueryForGradeAction.class);
	
	private String custStuId;
	
	private String custStuPwd;
	
	private Map<String, Object> msg;
	

	public Map<String, Object> getMsg() {
		return msg;
	}

	public void setMsg(Map<String, Object> msg) {
		this.msg = msg;
	}

	public String getCustStuId() {
		return custStuId;
	}

	public void setCustStuId(String custStuId) {
		this.custStuId = custStuId;
	}

	public String getCustStuPwd() {
		return custStuPwd;
	}

	public void setCustStuPwd(String custStuPwd) {
		this.custStuPwd = custStuPwd;
	}
	
	@Action(value="queryForGrade", results={@Result(name="json", type="json", params={"root", "msg"})})
	public String queryForGrade() {
		
		SimulationLogin sl = new SimulationLogin();
		msg = new HashMap<String, Object>();
		
		
		log.info("----query for grade-----" + custStuId );
		
		int statusCode = sl.getLoginHtml(custStuId, custStuPwd);
		if(statusCode == 200) {
			msg.put("flag", "success");
			String resultHtml = sl.getResultHtml();
			resultHtml = resultHtml.substring(resultHtml.indexOf("<form"), resultHtml.indexOf("</form>") + 7);
			//给学生各科目成绩统计表这个标题设置样式
			int index = resultHtml.indexOf("pageDiv");
			StringBuilder strBuilder = new StringBuilder(resultHtml);
			strBuilder.insert(index + 8, " align=\"center\"");
			strBuilder.toString();
			//设置第一个border为1
			int indexBorder = strBuilder.indexOf("border=\"0\"");
			strBuilder.setCharAt(indexBorder + 8, '1');
			String str = strBuilder.toString();
			StringBuilder stringBuilder = new StringBuilder(str);
			stringBuilder.replace(str.lastIndexOf("<a"), str.lastIndexOf("</a>") + 4,  "");
			String modifyHtml = stringBuilder.toString();
			msg.put("result", modifyHtml);
			log.info("-------query for grade-------" + modifyHtml.substring(0, 600));
		} else {
			msg.put("flag", "error");
			msg.put("errormsg", "程序异常！");
		}
		return "json";
	}
		
}
