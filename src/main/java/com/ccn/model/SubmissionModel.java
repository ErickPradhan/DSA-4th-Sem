package com.ccn.model;

import java.util.List;

public class SubmissionModel {

	// Instance Variables:
	private int id;
	private int studentId;
	private int assignmentId;
	private String filePath;
	private String submissionDate;
	private String studentName;
	private String assignmentTitle;
	private String courseTitle;
	private String status;
	private List<SubmissionFileModel>
    submissionFiles;
	
	public List<SubmissionFileModel> getSubmissionFiles() {
		return submissionFiles;
	}

	public void setSubmissionFiles(List<SubmissionFileModel> submissionFiles) {
		this.submissionFiles = submissionFiles;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	// Empty Constructor:
	public SubmissionModel() {
		
	}

	// Parameterized Constructor:
	public SubmissionModel(int id, int studentId, int assignmentId, String filePath, String submissionDate) {
		super();
		this.id = id;
		this.studentId = studentId;
		this.assignmentId = assignmentId;
		this.filePath = filePath;
		this.submissionDate = submissionDate;
	}

	// Getter and Setter methods:
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getAssignmentId() {
		return assignmentId;
	}

	public void setAssignmentId(int assignmentId) {
		this.assignmentId = assignmentId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getSubmissionDate() {
		return submissionDate;
	}

	public void setSubmissionDate(String submissionDate) {
		this.submissionDate = submissionDate;
	}
	
	public String getStudentName() {
	    return studentName;
	}

	public void setStudentName(String studentName) {
	    this.studentName = studentName;
	}

	public String getAssignmentTitle() {
	    return assignmentTitle;
	}

	public void setAssignmentTitle(String assignmentTitle) {
	    this.assignmentTitle = assignmentTitle;
	}

	public String getCourseTitle() {
	    return courseTitle;
	}

	public void setCourseTitle(String courseTitle) {
	    this.courseTitle = courseTitle;
	}
	
}
