package com.mastek.assignment.database;

import java.util.Scanner;

public class QueryUtil {
	static Scanner sc = new Scanner(System.in);
	public static String insertRecordQuery() {
		String sql="INSERT INTO Student(StudentName, Email, AdmissionDate, StudyingClass, City) VALUES(?,?,to_date(?,'dd-mm-yyyy'),?,?)";
//		String sqlQuery="INSERT INTO Student(StudentName, Email, AdmissionDate, StudyingClass, City) VALUES('Raj','raj@gmail.com',TO_DATE('1999-05-29','yyyy-mm-dd'),'Class-8','Jaipur')";
		
		return sql;
	}
	
	public static String viewRecordQuery() {
		String sql="SELECT * FROM Student";
		return sql;
	}
	
	public static String viewRecordQueryByID() {
			System.out.println("Enter the Student ID to view the records : ");
			int studentID = Integer.parseInt(sc.nextLine());
			String sql= "SELECT * FROM Student Where StudentID = "+studentID;	
			return sql;
	}
	
	public static String viewRecordQueryByName() {
			System.out.println("Enter the Student Name to view the records : ");
			String studentName = sc.nextLine();
			String sql= "SELECT * FROM Student Where StudentName = '" + studentName + "'";
			return sql;
	}
	
	public static String deleteRecordQuery(String studentName) {
		String sql="DELETE FROM Student WHERE StudentName= '" + studentName + "'";
		return sql;
	}
	
	public static String updateNameQuery(String studentName) {
		String sql="UPDATE Student SET StudentName = ? WHERE StudentName = '" + studentName + "'";
		return sql;
	}

	public static String updateEmailQuery(String studentName) {
		String sql="UPDATE Student SET Email = ? WHERE StudentName = '" + studentName + "'";
		return sql;
	}
	
	public static String updateAdmissionDateQuery(String studentName) {
		String sql="UPDATE Student SET AdmissionDate = ? WHERE StudentName = '" + studentName + "'";
		return sql;
	}
	
	public static String updateClassQuery(String studentName) {
		String sql="UPDATE Student SET StudyingClass = ? WHERE StudentName = '" + studentName + "'";
		return sql;
	}
	
	public static String updateCityQuery(String studentName) {
		String sql="UPDATE Student SET City = ? WHERE StudentName = '" + studentName + "'";
		return sql;
	}
	
}
