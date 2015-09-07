package cn.com.narwal.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

public class MyAuthenticationFilter extends FormAuthenticationFilter {
	
	
	protected Logger log = Logger.getLogger(MyAuthenticationFilter.class);

	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	protected boolean onLoginSuccess(AuthenticationToken token,
			Subject subject, ServletRequest request, ServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		
		try {
			
			String currentUser = subject.getPrincipal().toString();
			subject.getSession().setAttribute(currentUser, "username");
			
		} catch(Exception e) {
			log.info("----------error occured in myauthenticationfilter!");
			e.printStackTrace();
		}
		
		return super.onLoginSuccess(token, subject, request, response);
	}
	
	@Override
	protected AuthenticationToken createToken(ServletRequest request,
			ServletResponse response) {
		// TODO Auto-generated method stub
		
		String username = getUsername(request);
		String password = getPassword(request);
		
		boolean rememberMe = isRememberMe(request);
		String host = getHost(request);
		String status = request.getParameter("status");
		
		return new MyUsernamePasswordToken(username, password, rememberMe, host, status);
	}

}
