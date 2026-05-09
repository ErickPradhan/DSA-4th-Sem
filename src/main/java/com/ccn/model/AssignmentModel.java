package com.ccn.model;

public class AssignmentModel {

    // Instance Variables
    private int id;
    private int courseId;
    private String title;
    private String description;
    private String deadline;
    private String courseTitle;

    // Empty Constructor
    public AssignmentModel() {

    }

    // Parameterized Constructor
    public AssignmentModel(int id, int courseId, String title,
                           String description, String deadline) {

        this.id = id;
        this.courseId = courseId;
        this.title = title;
        this.description = description;
        this.deadline = deadline;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
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

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getCourseTitle() {
        return courseTitle;
    }

    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

}