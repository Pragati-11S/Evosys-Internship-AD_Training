package com.mastek.assignment.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
	
//	private static Connection connection=null;
	private static String url = "jdbc:oracle:thin:@//localhost:1521/xe";
	private static String user = "c##aduser";
	private static String password = "root";
	
	public MyConnection() {
		super();
	}
	
	public Connection getConnection() throws SQLException{
		return DriverManager.getConnection(url, user, password);
	}
}
