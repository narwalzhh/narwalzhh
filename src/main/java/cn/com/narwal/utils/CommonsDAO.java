package cn.com.narwal.utils;

import java.util.List;

public interface CommonsDAO {
	
	public List<Object> listAll();
	
	public Object findOne(int id);
	
	public void save(Object obj);
	
	public void update(int id);
	
	public void delete(int id);
	
	public void multiDelete(int[] id);

}
