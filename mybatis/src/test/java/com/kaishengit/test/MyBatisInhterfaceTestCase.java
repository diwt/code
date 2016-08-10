package com.kaishengit.test;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Maps;
import com.kaishengit.mapper.UserMapper;
import com.kaishengit.pojo.User;
import com.kaishengit.util.MyBatisUtil;

import junit.framework.Assert;

public class MyBatisInhterfaceTestCase {
	private Logger logger = LoggerFactory.getLogger(MyBatisInhterfaceTestCase.class);
	
	@Test
	public void testFindByMap(){
		SqlSession session = MyBatisUtil.getSqlSession();
		UserMapper userMapper = session.getMapper(UserMapper.class);
		Map<String, Object> param = Maps.newHashMap();
		param.put("username", "Rose");
		param.put("password", "123123");
		User user = userMapper.findByMap(param);
		logger.debug("{}",user);
		Assert.assertNotNull(user);
	}
	@Test
	public void testFindByParams(){
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		User user = userMapper.findByParams("James", "123123");
		logger.debug("{}",user);
		Assert.assertNotNull(user);
	}
	
	@Test
	public void testFindByQueryParam(){
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		Map<String, Object> queryParam = Maps.newHashMap();
		queryParam.put("password", "123123");
		queryParam.put("username", "Rose");
		userMapper.findByQueryParam(queryParam);
		sqlSession.close();
	}	
	
	
}
