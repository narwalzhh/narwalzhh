package cn.com.narwal.utils;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.core.JdbcTemplate;

public class CommonDAOImpl implements CommonsDAO {
	
	private JdbcTemplate jdbcTemplate;
	protected Logger log = Logger.getLogger(CommonDAOImpl.class);
	
	public JdbcTemplate getJdbcTemplate() {
		if(jdbcTemplate == null) {
			String beanUrl[] = {"/home/zhh/workspace/eclipseworkspace/narwalzhh/src/main/webapp/WEB-INF/bean.xml"};
			/*Resource reource = new FileSystemResource(beanUrl);
			BeanFactory factory = new XmlBeanFactory(reource);
			log.info("-------------" + factory.toString() + "---------------");
			JdbcTemplate jt = (JdbcTemplate)factory.getBean("jdbcTemplate");
			jdbcTemplate = jt;*/
			
			ApplicationContext ac = new FileSystemXmlApplicationContext(beanUrl);
			JdbcTemplate jt = (JdbcTemplate)ac.getBean("jdbcTemplate");
			jdbcTemplate = jt;
		}
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	

	public List<Object> listAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public Object findOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void save(Object obj) {
		// TODO Auto-generated method stub
		
	}

	public void update(int id) {
		// TODO Auto-generated method stub
		
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	public void multiDelete(int[] id) {
		// TODO Auto-generated method stub
		
	}

}
