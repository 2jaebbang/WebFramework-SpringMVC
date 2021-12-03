package kr.ac.hansung.cse.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.cse.model.Subject;
import kr.ac.hansung.cse.model.YearAndSemester;

@Repository("subjectDao")
public class SubjectDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	//학점 총합 확인
	public int getTotalCreditCount() {
		String sqlStatement = "select sum(credit) where year<2022 from mySubjectdb.subjects";
		return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
	}
	
	//각 년도&학기별 학점 총합
	public int getCreditCount(int year, int semester) {
		String sqlStatement = "select sum(credit) from mySubjectdb.subjects where year="+year+" and semester="+semester;
		return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
	}
	
	
	//각 년도&학기별 교과목 확인
	public List<Subject> getSubject(int year, int semester) {
		String sqlStatement = "select * from mySubjectdb.subjects where year=? and semester=?";
		return jdbcTemplate.query(sqlStatement, new Object[] {year, semester} , new RowMapper<Subject>() {

			@Override
			public Subject mapRow(ResultSet rs, int rowNum) throws SQLException {
				Subject subject = new Subject();

				subject.setYear(rs.getInt("year"));
				subject.setSemester(rs.getInt("semester"));
				subject.setTitle(rs.getString("title"));
				subject.setCategory(rs.getString("category"));
				subject.setProfessor(rs.getString("professor"));
				subject.setCredit(rs.getInt("credit"));

				return subject;
			}
		});
	}
	
	
	
	
	//search year&semester
	public List<YearAndSemester> getYearAndSemester() {
		String sqlStatement = "select distinct year, semester from mySubjectdb.subjects where year<2022 order by year desc, semester desc";     //distinct 중복제거 
		return jdbcTemplate.query(sqlStatement, new RowMapper<YearAndSemester>() {
			@Override
			public YearAndSemester mapRow(ResultSet rs, int rowNum) throws SQLException {
				YearAndSemester yearAndSemester = new YearAndSemester();
				
				yearAndSemester.setYear(rs.getInt("year"));
				yearAndSemester.setSemester(rs.getInt("semester"));
				yearAndSemester.setCredit(getCreditCount(yearAndSemester.getYear(), yearAndSemester.getSemester()));
				return yearAndSemester;
			}
		});
	}

	

	// Crud Method
	public boolean insert(Subject subject) {
		
		String course_id = subject.getCourse_id();
		int year = subject.getYear();
		int semester = subject.getSemester();
		String title = subject.getTitle();
		String category = subject.getCategory();
		String professor = subject.getProfessor();
		int credit = subject.getCredit();

		String sqlStatement = "insert into mySubjectdb.subjects (year, semester, course_id, title, category, professor, credit) values (?,?,?,?,?,?,?)";
		return (jdbcTemplate.update(sqlStatement, new Object[] { year, semester, course_id, title, category, professor, credit }) == 1);
	}
	
	//22년 수강신청 내역 확인
	public List<Subject> getEnrolledSubject(){
		String sqlStatement = "select * from mySubjectdb.subjects where year=2022";
		return jdbcTemplate.query(sqlStatement, new RowMapper<Subject>() {
			@Override
			public Subject mapRow(ResultSet rs, int rowNum) throws SQLException {
				Subject subject = new Subject();
				
				subject.setYear(rs.getInt("year"));
				subject.setSemester(rs.getInt("semester"));
				subject.setCourse_id(rs.getString("course_id"));
				subject.setTitle(rs.getString("title"));
				subject.setCategory(rs.getString("category"));
				subject.setProfessor(rs.getString("professor"));
				subject.setCredit(rs.getInt("credit"));
				return subject;
			}
		});
	}

	// crUd Method
	public boolean update(Subject subject) {
		
		String course_id = subject.getCourse_id();
		int year = subject.getYear();
		int semester = subject.getSemester();
		String title = subject.getTitle();
		String category = subject.getCategory();
		String professor = subject.getProfessor();
		int credit = subject.getCredit();

		String sqlStatement = "update mySubjectdb.subjects set year=?, semster=?, course_id=?, category=?, credit=? where title=? and professor=?";
		return (jdbcTemplate.update(sqlStatement, new Object[] { year, semester, course_id, title, category, professor, credit }) == 1);
	}

	// cruD Method
	public boolean delete(String title, String professor) {
		String sqlStatement = "delete from mySubjectdb.subjects where title=? and professor=?";
		return (jdbcTemplate.update(sqlStatement, new Object[] { title, professor }) == 1);
	}
	
}
