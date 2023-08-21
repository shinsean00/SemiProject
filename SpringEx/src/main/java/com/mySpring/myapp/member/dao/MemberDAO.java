package com.mySpring.myapp.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.myapp.member.vo.MemberVO;


public interface MemberDAO {
	public int insertMember(MemberVO memberVO) throws DataAccessException;
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	public List selectAllMemberList() throws DataAccessException;
	public MemberVO getMemberById(String id) throws DataAccessException;
	public void modMember(MemberVO memberVO) throws DataAccessException;
	public int deleteMember(String id) throws DataAccessException;
	 

}
