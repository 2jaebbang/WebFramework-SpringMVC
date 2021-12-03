package kr.ac.hansung.cse.controller;


import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.hansung.cse.model.Subject;
import kr.ac.hansung.cse.model.YearAndSemester;
import kr.ac.hansung.cse.service.SubjectService;

@Controller
public class SubjectController {
	
	@Autowired
	private SubjectService subjectService;
	
	
	//년도&학기별 취득학점 & 상세링크 
	@RequestMapping("/subjects")
	public String printSubjects(Model model) {

		List<YearAndSemester> yearAndSemester = subjectService.getYearAndSemester();
		
		model.addAttribute("yearAndSemesters", yearAndSemester);
		
		return "subjects";
	}
	
	//년도&학기별 교과목 출력
	@RequestMapping("/detail")
	public String printDetail(@RequestParam("year") int year, @RequestParam("semester") int semester, Model model) {
		List<Subject> subjects = subjectService.getSubject(year, semester);
		
		model.addAttribute("subjects", subjects);
		
		return "detail";
	}
	
	
	//수강신청하기 
	@RequestMapping("/enrollment")
	public String createSubject(Model model) {
		
		Subject subject = new Subject();
		//미리 22년 1학기로 세팅
		subject.setYear(2022);
		subject.setSemester(1);
		
		model.addAttribute("subject", subject);
		
		return "enrollment";
	}
	
	//수강신청 검증
	@RequestMapping("/verifyEnrollment")
	public String verifyEnrollment(Model model, @Valid Subject subject, BindingResult result) {

		if (result.hasErrors()) {
			System.out.println("===From data does not validated");
			List<ObjectError> errors = result.getAllErrors();
			for (ObjectError error : errors)
				System.out.println(error.getDefaultMessage());
			return "enrollment";
		}
		subject.setYear(2022);
		subject.setSemester(1);
		subjectService.insert(subject);

		return "enrolled";
	}
	
	//수강신청 내역 출력
	@RequestMapping("/readEnrollment")
	public String readEnrollment(Model model) {
		List<Subject> subjects = subjectService.getEnrolledSubject();
		model.addAttribute("subjects", subjects);
		return "readEnrollment";
	}
	
}
