package cn.com.narwal.utils;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.core.JdbcTemplate;

public class JdbcUtils {
	
	private JdbcTemplate jdbcTemplate;
	protected Logger log = Logger.getLogger(JdbcUtils.class);

	public JdbcTemplate getJdbcTemplate() {
		//在CommonDAOImpl中注入DataSource，实现jdbc操作
		if(jdbcTemplate == null) {
			//路径为绝对路径
			String beanUrl = "/home/zhh/workspace/eclipseworkspace/narwalzhh/src/main/webapp/WEB-INF/bean.xml";
			Resource reource = new FileSystemResource(beanUrl);
			//XmlBeanFactory方法已被废弃
			BeanFactory factory = new XmlBeanFactory(reource);
			//log.info("-------------" + factory.toString() + "---------------");
			JdbcTemplate jt = (JdbcTemplate)factory.getBean("jdbcTemplate");
			jdbcTemplate = jt;
		}
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

}
