package cn.com.narwal.utils;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;

import org.apache.log4j.Logger;

public class QueryIpAddr {

	@Resource
	private static WebServiceContext wsc;
	protected static Logger log = Logger.getLogger(QueryIpAddr.class);
	
	public static String getIpAddr() { 
		
		String ipAddr = null;
		
		MessageContext mc = wsc.getMessageContext();
		HttpServletRequest hsr = (HttpServletRequest) mc.get(mc.SERVLET_REQUEST);
		
		ipAddr = hsr.getHeader("x-forwarded-for");
		
		if(ipAddr == null || ipAddr.length() == 0 ||
				"unknown".equalsIgnoreCase(ipAddr)) {
			ipAddr = hsr.getHeader("Proxy-Client-IP");
		}
		if(ipAddr == null || ipAddr.length() == 0 ||
				"unknown".equalsIgnoreCase(ipAddr)) {
			ipAddr = hsr.getHeader("WL-Proxy-Client-IP");
		}
		if(ipAddr == null || ipAddr.length() == 0 ||
				"unknown".equalsIgnoreCase(ipAddr)) {
			ipAddr = hsr.getRemoteAddr();
			
			//获取本机的ip,
			if(ipAddr.equals("127.0.0.1") ||
					ipAddr.endsWith("0:0:0:0:0:0:1")) {
				InetAddress inet = null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				ipAddr = inet.getHostAddress();
			}
			
		}
		
		//对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		// "***.***.***.***".length() = 15
		if (ipAddr != null && ipAddr.length() > 15) { 

			if (ipAddr.indexOf(",") > 0) {
				ipAddr = ipAddr.substring(0, ipAddr.indexOf(","));
			}
		}
		
		return ipAddr;
		
	}
	
}
