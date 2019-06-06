package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("class not found");
		}
	}
	
	/**
	 * Get DB Connection
	 * @return
	 * @throws SQLException
	 */
	public static Connection getDBConnection() {
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/1DTwZGVaqH", "1DTwZGVaqH", "29K1wxq4LJ");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}

}
