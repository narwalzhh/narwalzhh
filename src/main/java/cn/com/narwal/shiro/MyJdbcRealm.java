package cn.com.narwal.shiro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashSet;
import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.shiro.realm.jdbc.JdbcRealm;

public class MyJdbcRealm extends JdbcRealm {

	protected Logger log = Logger.getLogger(MyJdbcRealm.class);
	
	@Override
	protected Set<String> getRoleNamesForUser(Connection conn, String username)
			throws SQLException {
		// TODO Auto-generated method stub
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		Set<String> roleNames = new LinkedHashSet<String>();
		
		try {
			ps = conn.prepareStatement("userRolesQuery");
			ps.setString(1, username);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				String roles = rs.getString(1);
				
				if(roles != null) {
					String[] roleAttr = roles.split(",");
					for(String role : roleAttr) {
						roleNames.add(role);
					}
				} else {
					log.info("--------" + username + "has no role!-------------");
				}
				
			}
		} catch(Exception e) {
			log.info("---------myjdbcrealm error occurs!------------");
			e.printStackTrace();
		} finally {
			rs.close();
			ps.close();
		}
		
		
		
		return roleNames;
	}
	
}
