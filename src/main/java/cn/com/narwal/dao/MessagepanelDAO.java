package cn.com.narwal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import cn.com.narwal.model.Messagepanel;
import cn.com.narwal.utils.CommonDAOImpl;
import cn.com.narwal.utils.JdbcUtils;

public class MessagepanelDAO extends CommonDAOImpl {

	protected JdbcTemplate jdbcTemplate = new JdbcUtils().getJdbcTemplate();
	protected Logger log = Logger.getLogger(MessagepanelDAO.class);
	
	private final String insertSql = 
			"insert into n_messagepanel (n_id, n_from, n_say_something, n_to, n_time) values (?, ?, ?, ?, ?)";
	private final String selectAllSql = 
			"select * from n_messagepanel order by n_id desc, n_time desc";
	private final String selectOneSql = 
			"select * from n_messagepanel where n_id = ?";
	private final String deleteSql = 
			"delete from n_messagepanel where n_id = ?";
	
	@Override
	public void save(Object obj) {
		// TODO Auto-generated method stub
		jdbcTemplate.update(insertSql, getInsertValues((Messagepanel)obj));
	}
	
	@Override
	public Object findOne(int id) {
		// TODO Auto-generated method stub
		return jdbcTemplate.query(selectOneSql, new Object[] {
				id
		}, new RowMapper<Messagepanel>() {

			public Messagepanel mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				// TODO Auto-generated method stub
				Messagepanel messagepanel = new Messagepanel();
				messagepanel.setPropertyValues(rs);
				return messagepanel;
			}
			
		});
	}
	
	@Override
	public List<Messagepanel> listAll() {
		// TODO Auto-generated method stub
		final List<Messagepanel> messagepanelList = new ArrayList<Messagepanel>();
		jdbcTemplate.query(selectAllSql,
				new ResultSetExtractor<Messagepanel>() {

					public Messagepanel extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						// TODO Auto-generated method stub
						while(rs.next()) {
							Messagepanel messagepanel = new Messagepanel();
							messagepanel.setPropertyValues(rs);
							messagepanelList.add(messagepanel);
						}
						return null;
					}
			
		});
		return messagepanelList;
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		jdbcTemplate.update(deleteSql, new Object[] {
				id
			});
	}
	
	public Object[] getInsertValues(Messagepanel messagepanel) {
		
		return new Object[] {
			null,
			messagepanel.getFrom(),
			messagepanel.getSay_something(),
			messagepanel.getTo(),
			messagepanel.getTime()
		};
		
	}
	
}
