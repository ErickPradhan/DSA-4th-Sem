package com.ccn.model;

public class CourseModel {
	
	//Instance Variables:
	private int id;
	private String title;
	private String description;
	private String createdAt;
	private String category;
	private String instructor;
	private String status;
	
	// Empty Constructor:
	public CourseModel() {
		// ???
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	//Parameterized constructor:
	public CourseModel(int id, String title, String description, String createdAt) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.createdAt = createdAt;
	}

	// Getter and Setter methods:
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	
	
	
}
