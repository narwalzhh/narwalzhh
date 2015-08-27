package cn.com.narwal.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.eclipse.jdt.internal.compiler.flow.FinallyFlowContext;

public class SimulationLogin {

	private static CloseableHttpClient chc = HttpClients.createDefault();
	protected static Logger log = Logger.getLogger(SimulationLogin.class);
	
	public static int getStudentCookies(String custStudentId, String custStudentPassword) {
		
		log.info("-------------get cookie for student---------------");
		//http://jwgl.cust.edu.cn/PreLogin.aspx
		String loginUrl = "http://210.47.0.14:80/PreLogin.aspx";
		
		//返回的html code 302
		int htmlCode = 0;
		
		//模拟登陆，按实际服务器端要求选用 Post 或 Get 请求方式
		HttpPost httpPost = new HttpPost(loginUrl);
		log.info("----request line: ----" + httpPost.getRequestLine());
		
		try {
			
			//设置登录信息，post提交数据
			List<NameValuePair> dataToPostList = new ArrayList<NameValuePair>();
			dataToPostList.add(new BasicNameValuePair("__VIEWSTATE", "dDwxNjY4ODI5NjgzO3Q8O2w8aTwxPjs+O2w8dDw7bDxpPDE+Oz47bDx0PHA8cDxsPEJhY2tJbWFnZVVybDs+O2w8aW1hZ2VzL3cxLmdpZjs+Pjs+O2w8aTwxPjs+O2w8dDxwPHA8bDxUZXh0Oz47bDzniYjmnKw6My40LjkxMjI2Nzs+PjtwPGw8c3R5bGU7PjtsPHBhZGRpbmctcmlnaHQ6MTBcOzs+Pj47Oz47Pj47Pj47Pj47bDxyb2xlMTtyb2xlMjtyb2xlMjtyb2xlNTtyb2xlNTtyb2xlNjtyb2xlNjtyb2xlNDtyb2xlNDtyb2xlNztyb2xlNzs+Pg6J6wtOOTiXnOxK+hxHBTjAcpsC"));
			dataToPostList.add(new BasicNameValuePair("role", "role1"));
			dataToPostList.add(new BasicNameValuePair("Username", custStudentId));
			dataToPostList.add(new BasicNameValuePair("Password", custStudentPassword));
			dataToPostList.add(new BasicNameValuePair("BtnLogin", "%E7%99%BB+%E5%BD%95"));
			
			httpPost.setEntity(new UrlEncodedFormEntity(dataToPostList));
			CloseableHttpResponse chr = chc.execute(httpPost);
			
			try {
				
				//获取返回数据
				HttpEntity httpEntity = chr.getEntity();
				log.info("------Response line-------" + chr.getStatusLine());
				log.info("-----cookie-----" + chr.getFirstHeader("Set-Cookie").getValue());
				htmlCode = chr.getStatusLine().getStatusCode();
				EntityUtils.consume(httpEntity);
				
			} catch(Exception e) {
				
			} finally {
				chr.close();
			}
			
		} catch(ClientProtocolException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		//网页状态码
		return htmlCode;
	}
	
	public static int getLoginHtml() {
		log.info("---------get login html--------");
		
		String loginUrl = "http://210.47.0.14:80/Login.aspx?username=120522130&password=itachi4318&role=student";
		int loginCode = 0;
		
		HttpGet httpGet = new HttpGet(loginUrl);
		log.info("-----request line--------" + httpGet.getRequestLine());
		
		
		try {
			
			CloseableHttpResponse chr = chc.execute(httpGet);
			
			try {
				
				HttpEntity httpEntity = chr.getEntity();
				log.info("------Reponse line--------" +  chr.getStatusLine());
				log.info("-----cookie-----" + chr.getFirstHeader("Set-Cookie").getValue());
				loginCode = chr.getStatusLine().getStatusCode();
				String loginHtml = EntityUtils.toString(httpEntity);
				log.info("------------" + loginHtml + "-------------");
				EntityUtils.consume(httpEntity);
				
			} catch(Exception e) {
				
			} finally {
				chr.close();
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return loginCode;
		
		
	}
	
	public static String getResultHtml() {
		log.info("---------get result html--------");
		
		String resultUrl = "http://210.47.0.14:80/cjcx/StudentGrade.aspx";
		String htmlText = "";
		
		try {
			
			HttpGet httpGet = new HttpGet(resultUrl);
			log.info("-----request line--------" + httpGet.getRequestLine());
			CloseableHttpResponse chr = chc.execute(httpGet);
			
			try {
				
				HttpEntity httpEntity = chr.getEntity();
				log.info("------Reponse line--------" +  chr.getStatusLine());
				if(httpEntity != null) {
					htmlText = EntityUtils.toString(httpEntity);
					EntityUtils.consume(httpEntity);
				}
				
			} catch(Exception e) {
				
			} finally {
				chr.close();
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return htmlText;
		
		
	}
	
	public static void main(String[] args) {
		int htmlCode = getStudentCookies("120522130", "itachi4318");
		if(htmlCode == 302) {
			log.info("-------pre登录成功-------");
			int loginCode = getLoginHtml();
			if(loginCode == 302) {
				log.info("-------登录成功-------");
			} else if(loginCode == 200) {
				log.info("-------登录错误-------");
			} else {
				log.info("--------------" + loginCode);
			}
			//String gradeTable = getResultHtml();
			//log.info("----------" + gradeTable + "-----------");
		} else if(htmlCode == 200) {
			log.info("-------pre登录错误-------");
		} else {
			log.info("--------------" + htmlCode);
		}
	}
	
}
