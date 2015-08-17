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

/*
 * 可以作为模板DAO的写法
 * 前台：save listAll
 * 管理界面：delete multiDelete listAll findOne
 */

public class MessagewallDAO extends CommonDAOImpl {
	
	protected JdbcTemplate jdbcTemplate = new JdbcUtils().getJdbcTemplate();
	protected Logger log = Logger.getLogger(MessagewallDAO.class);
	
	private final String insertSql = 
			"insert into n_messagewall (n_id, n_nickname, n_content, n_time) values (?, ?, ?, ?)";
	private final String selectAllSql = 
			"select * from n_messagewall order by n_id desc, n_time desc";
	private final String selectOneSql = 
			"select * from n_messagewall where n_id = ?";
	private final String deleteSql = 
			"delete from n_messagewall where n_id = ?";
	private final String updateSql = 
			"update n_messagewall set n_nickname = ?, n_content = ?, n_time = ? where n_id = ?";
	
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
	public List<Messagewall> listAll() {
		// TODO Auto-generated method stub
		final List<Messagewall> messagewallList = new ArrayList<Messagewall>();
		jdbcTemplate.query(selectAllSql, 
				new ResultSetExtractor<Object>() {

					public Object extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						// TODO Auto-generated method stub
						while(rs.next()) {
							Messagewall messagewall = new Messagewall();
							messagewall.setPropertyValues(rs);
							messagewallList.add(messagewall);
						}
						return null;
					}
		
		});
		return messagewallList;
	}
	
	//重写删除一条记录的方法
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		jdbcTemplate.update(deleteSql, new Object[] {
			id
		});
	}
	
	//重写删除多条记录的方法
	@Override
	public void multiDelete(int[] id) {
		// TODO Auto-generated method stub
		for(int i : id) {
			jdbcTemplate.update(deleteSql, new Object[] {
					i
			});
		}
	}
	
	//重写更新记录的方法
	@Override
	public void update(Object obj) {
		// TODO Auto-generated method stub
		jdbcTemplate.update(updateSql, getUpdateValues((Messagewall)obj) );
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
	
	//获取所要更新的各个属性的值，即需要更新的数据
	public Object[] getUpdateValues(Messagewall messagewall) {
		return new Object[] {
			messagewall.getNickname(),
			messagewall.getContent(),
			messagewall.getTime(),
			messagewall.getId()
		};
	}
	
	public static void main(String[] args) throws Exception {
		
		Messagewall mw = new Messagewall();
		mw.setNickname("narwal");
		mw.setContent("我是narwalzhh！");
		mw.setTime(new Timestamp(new Date().getTime()));
		
		MessagewallDAO md = new MessagewallDAO();
		Logger log = Logger.getLogger(MessagewallDAO.class);
		log.info("--------" + mw.toString() + "------------");
		
		/*for(int i = 0; i < 10; i++) {
			md.save(mw);
		}*/
		//log.info("------main-------" + md.findOne(20) + "---------------");
		//log.info("------main-------" + md.listAll() + "---------------");
		//md.delete(11);
		/*int[] toBeDeleted = {1, 4, 9};
		md.multiDelete(toBeDeleted);*/
		//md.update(mw);
	}

}
