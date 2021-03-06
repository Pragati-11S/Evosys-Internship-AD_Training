package com.mastek.assignment.model;

public class Student {
	private int studentID;
	private String studentName;
	private String email;
	private String admissionDate;
	private String studyingClass;
	private String city;
	
	public Student(int studentID, String studentName, String email, String admissionDate, String studyingClass,
			String city) {
		super();
		this.studentID = studentID;
		this.studentName = studentName;
		this.email = email;
		this.admissionDate = admissionDate;
		this.studyingClass = studyingClass;
		this.city = city;
	}
	public Student(String studentName, String email, String admissionDate, String studyingClass, String city) {
		super();
		this.studentName = studentName;
		this.email = email;
		this.admissionDate = admissionDate;
		this.studyingClass = studyingClass;
		this.city = city;
	}
	public int getStudentID() {
		return studentID;
	}
	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAdmissionDate() {
		return admissionDate;
	}
	public void setAdmissionDate(String admissionDate) {
		this.admissionDate = admissionDate;
	}
	public String getStudyingClass() {
		return studyingClass;
	}
	public void setStudyingClass(String studyingClass) {
		this.studyingClass = studyingClass;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	
}
