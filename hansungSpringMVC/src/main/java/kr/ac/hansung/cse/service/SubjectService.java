package kr.ac.hansung.cse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.cse.dao.SubjectDao;
import kr.ac.hansung.cse.model.Subject;
import kr.ac.hansung.cse.model.YearAndSemester;

@Service
public class SubjectService {
	
	@Autowired
	private SubjectDao subjectDao;
	
	
	public List<Subject> getSubject(int year, int semester){
		return subjectDao.getSubject(year, semester);
	}
	
	public List<YearAndSemester> getYearAndSemester(){
		return subjectDao.getYearAndSemester();
	}
	
	public void insert(Subject subject) {
		subjectDao.insert(subject);
	}
	
	public List<Subject> getEnrolledSubject() {
		return subjectDao.getEnrolledSubject();
	}
	
}
