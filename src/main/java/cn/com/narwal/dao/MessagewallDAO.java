package cn.com.narwal.dao;

import java.util.Date;
import java.sql.Timestamp;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.core.JdbcTemplate;
import cn.com.narwal.utils.CommonDAOImpl;

public class MessagewallDAO extends CommonDAOImpl {
	
	protected JdbcTemplate jdbcTemplate = new CommonDAOImpl().getJdbcTemplate();
	
	
	public void save(String name, String content, Timestamp time) throws Exception {
		// TODO Auto-generated method stub
		String sql = "insert into n_messagewall (n_id, n_nickname, n_content, n_time) values (?, ?, ?, ?)";
		jdbcTemplate.update(sql, 
			new Object[] {
				null,
				name,
				content,
				time
		});
	}
	
	public static void main(String[] args) throws Exception {
		Resource rs = new 
				FileSystemResource("/home/zhh/workspace/eclipseworkspace/narwalzhh/src/main/webapp/WEB-INF/bean.xml");
		BeanFactory factory = new XmlBeanFactory(rs);
		factory.getBean("messagewallDao");
		
		MessagewallDAO md = new MessagewallDAO();
		Timestamp ts = new Timestamp(new Date().getTime());
		Logger log = Logger.getLogger(MessagewallDAO.class);
		log.info("--------" + ts + "------------");
		for(int i = 0; i < 10; i++) {
			md.save("nickname", "this is content", ts);
		}
	}

}
