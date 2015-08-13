package cn.com.narwal.dao;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import cn.com.narwal.model.Messagewall;
import cn.com.narwal.utils.CommonDAOImpl;
import cn.com.narwal.utils.JdbcUtils;

public class MessagewallDAO extends CommonDAOImpl {
	
	protected JdbcTemplate jdbcTemplate = new JdbcUtils().getJdbcTemplate();
	protected Logger log = Logger.getLogger(MessagewallDAO.class);
	
	private final String insertSql = 
			"insert into n_messagewall (n_id, n_nickname, n_content, n_time) values (?, ?, ?, ?)";
	
	@Override
	public void save(Object obj) {
		// TODO Auto-generated method stub
		jdbcTemplate.update(insertSql, getInsertValues((Messagewall)obj));
	}
	
	public Object[] getInsertValues(Messagewall messagewall) {
		
		return new Object[] {
			null,
			messagewall.getNickname(),
			messagewall.getContent(),
			messagewall.getTime()
		};
		
	}
		
	public static void main(String[] args) throws Exception {
		
		Messagewall mw = new Messagewall();
		mw.setNickname("zhh");
		mw.setContent("我要给zhh留言！");
		mw.setTime(new Timestamp(new Date().getTime()));
		
		MessagewallDAO md = new MessagewallDAO();
		Logger log = Logger.getLogger(MessagewallDAO.class);
		log.info("--------" + mw.toString() + "------------");
		for(int i = 0; i < 10; i++) {
			md.save(mw);
		}
	}

}
