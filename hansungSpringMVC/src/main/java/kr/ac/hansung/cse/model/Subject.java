package kr.ac.hansung.cse.model;


import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class Subject {
	
	@Size(min=7, max=7, message="CourseId must be 7 chars")
	@NotEmpty(message="hansungID cannot be empty")
	private String course_id;
	
	private int year;
	private int semester;
	
	@NotEmpty(message="Title cannot be empty")
	private String title;
	
	@NotEmpty(message="Category cannot be empty")
	private String category;
	
	@NotEmpty(message="Professor cannot be empty")
	private String professor;
	
	
	private int credit;
}