package com.hms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hms.entity.Specialist;

public class SpecialistDAO {
	
	private Connection conn;

	public SpecialistDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addSpecialist(String sp) {
		
		boolean f = false;
		
		try {
			
			String sql = "insert into specialist (specialist_name) values(?)";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			
			pstmt.setString(1, sp);
			
			pstmt.executeUpdate();
			
			f = true;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return f;
		
	}
	
	public List<Specialist> getAllSpecialist(){
		
		List<Specialist> spList = new ArrayList<Specialist>();
		
		Specialist specialistObj = null;
		
		try {
			
			String sql = "select * from specialist";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			ResultSet resultSet = pstmt.executeQuery();
			
			while(resultSet.next()) {
				
				//create object
				specialistObj = new Specialist();
				//specialistObj.setId(resultSet.getInt("id"));
				//specialistObj.setSpecialistName(resultSet.getString("specialist_name"));
				//above two line same as below line
				specialistObj.setId(resultSet.getInt(1));//column index number 1 -(id)
				specialistObj.setSpecialistName(resultSet.getString(2));//column index number 2 -(specialist_name)
				
				//now add specialist object into List 
				spList.add(specialistObj);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return spList;
	}

}
