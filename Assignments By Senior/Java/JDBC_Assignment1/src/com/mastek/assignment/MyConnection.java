package com.mastek.assignment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class MyConnection {
	private static final String url = "jdbc:oracle:thin:@//localhost:1521/xe";
	private static final String user = "c##aduser";
	private static final String password = "root";
	private static Connection conn;
	
	public MyConnection(){
		super();
	}
	
	public static Connection getConnection()throws Exception {
		Connection conn=DriverManager.getConnection(url,user,password);
		if(conn!=null) {
			if(!conn.isClosed())
			{
				System.out.println("Connected");
				return conn;
			}
		}
		return null;
	}
}
