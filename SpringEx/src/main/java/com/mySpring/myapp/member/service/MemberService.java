package com.mySpring.myapp.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.myapp.member.vo.MemberVO;

public interface MemberService {
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws Exception;
	public List listMembers() throws DataAccessException;
	public MemberVO getMemberById(String id) throws Exception;
	public void modMember(MemberVO member) throws DataAccessException;
	public int removeMember(String id) throws DataAccessException;
	
}
