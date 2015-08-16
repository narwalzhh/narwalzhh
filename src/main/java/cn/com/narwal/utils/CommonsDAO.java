package cn.com.narwal.utils;

import java.util.List;

/*
 * 对数据库的增删查该的基本操作接口
 * 开发过程中可以对参数进行修改
 */
public interface CommonsDAO {
	
	public List<Object> listAll();	//列出所有
	
	public Object findOne(int id);	//根据id获取一条记录
	
	public void save(Object obj);	//向数据库保存一个对象
	
	public void update(Object obj);		//更新数据库中一个对象
	
	public void delete(int id);		//删除一条记录	
	
	public void multiDelete(int[] id);	//批量删除多条记录

}
