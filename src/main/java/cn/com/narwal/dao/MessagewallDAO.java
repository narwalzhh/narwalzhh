package cn.com.narwal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import cn.com.narwal.model.Messagewall;
import cn.com.narwal.utils.CommonDAOImpl;
import cn.com.narwal.utils.JdbcUtils;

public class MessagewallDAO extends CommonDAOImpl {
	
	protected JdbcTemplate jdbcTemplate = new JdbcUtils().getJdbcTemplate();
	protected Logger log = Logger.getLogger(MessagewallDAO.class);
	
	private final String insertSql = 
			"insert into n_messagewall (n_id, n_nickname, n_content, n_time) values (?, ?, ?, ?)";
	private final String selectAllSql = 
			"select * from n_messagewall";
	private final String selectOneSql = 
			"select * from n_messagewall where n_id = ?";
	
	//重写save方法
	@Override
	public void save(Object obj) {
		// TODO Auto-generated method stub
		jdbcTemplate.update(insertSql, getInsertValues((Messagewall)obj));
	}
	
	//重写获取一条记录方法
	@Override
	public Object findOne(int id) {
		// TODO Auto-generated method stub
		return jdbcTemplate.query(selectOneSql, new Object[] {
				id
		}, new RowMapper<Messagewall>() {

			public Messagewall mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				Messagewall messagewall = new Messagewall();
				messagewall.setPropertyValues(rs);
				//log.info("方法体--------------" + messagewall.getNickname() + "--------------");
				return messagewall;
			}
			
		});
	}
	
	//重写获取全部信息的方法
	@Override
	public List<Object> listAll() {
		// TODO Auto-generated method stub
		final List<Object> messagewallList = new ArrayList<Object>();
		return jdbcTemplate.query(selectAllSql, 
				new RowMapper<Object>() {

					public Object mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						// TODO Auto-generated method stub
						Messagewall messagewall = new Messagewall();
						messagewall.setPropertyValues(rs);
						messagewallList.add(messagewall);
						return messagewallList;
					}
		});
	}
	
	//获取所要保存对象的各个属性，即需要插入的值
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
		//log.info("--------" + mw.toString() + "------------");
		/*for(int i = 0; i < 10; i++) {
			md.save(mw);
		}*/
		
		//log.info("------main-------" + md.findOne(20) + "---------------");
		//log.info("------main-------" + md.listAll() + "---------------");
	}

}
