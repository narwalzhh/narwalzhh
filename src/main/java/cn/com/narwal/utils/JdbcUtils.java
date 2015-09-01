package cn.com.narwal.utils;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

/*
 * 使用JdbcTemplate对数据库进行操作
 * 所有使用到jdbcTemplate的操作都应实例化此对象
 */
public class JdbcUtils {
	
	//todo: 需要将jdbcTemplate改为静态的
	private JdbcTemplate jdbcTemplate;
	protected Logger log = Logger.getLogger(JdbcUtils.class);

	public JdbcTemplate getJdbcTemplate() {
		//在CommonDAOImpl中注入DataSource，实现jdbc操作
		if(jdbcTemplate == null) {
			/*//路径为绝对路径
			String beanUrl = "/home/zhh/workspace/eclipseworkspace/narwalzhh/src/main/webapp/WEB-INF/bean.xml";
			Resource reource = new FileSystemResource(beanUrl);
			//XmlBeanFactory方法已被废弃
			BeanFactory factory = new XmlBeanFactory(reource);
			//log.info("-------------" + factory.toString() + "---------------");
			JdbcTemplate jt = (JdbcTemplate)factory.getBean("jdbcTemplate");
			jdbcTemplate = jt;*/
			
			//这种方法没有差不多和文档提供的方法相同
			ApplicationContext ac = new FileSystemXmlApplicationContext("src/main/webapp/WEB-INF/bean.xml");
			JdbcTemplate jt = (JdbcTemplate)ac.getBean("jdbcTemplate");
			jdbcTemplate = jt;
		}
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

}
