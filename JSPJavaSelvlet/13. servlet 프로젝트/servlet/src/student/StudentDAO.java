package student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
	
	// 데이터베이스 커넥션(접속) 객체 선언
	Connection conn = null;
	// sql 실행할 객체
	Statement stmt = null;
	// sql 실행결과를 담을 객체
	ResultSet rs = null;
	
	PreparedStatement pstmt = null;

	
	// 생성자 (아이피, 포트, DB명, 아이디, 비밀번호)
	// 매개변수를 입력받아 Connection 객체를 생성
	public StudentDAO() {
		
		try {
			// 데이터베이스 접속(커넥션)
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:aidb");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	// 등록
	// 학생정보를 입력받아 student 테이블에 insert
	/*
	public int insert(StudentVO vo) {
		
		int r = 0;
		// insert 쿼리(query)
		String sql = "insert into student (studno, id, name, grade, jumin, birthday, tel,"
				+ "height, weight, major1, major2, profno) values ("
				+ vo.getStudno()+",'"+vo.getId()+"','"+vo.getName()+"',"+vo.getGrade()+","+vo.getJumin()+","
				+ "null, '"+vo.getTel()+"', null,null,null,null,null)";
		//sql = sql.replaceAll("'", "");
		 System.out.println(sql);
		try {
			stmt = conn.createStatement();
			r = stmt.executeUpdate(sql); // insert, update, delete -> executeUpdate() 사용
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return r;
	}
	*/
	public int insert(StudentVO vo) {
		
		int r = 0;
		// insert 쿼리(query)
		String sql = "insert into student (studno, id, name, grade, jumin, birthday, tel,"
				+ "height, weight, major1, major2, profno) values (?,?,?,?,?,"
				+ "null, ?, null,null,null,null,null)";
		//sql = sql.replaceAll("'", "");
		 System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getStudno());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getName());
			pstmt.setInt(4, vo.getGrade());
			pstmt.setString(5, vo.getJumin());
			pstmt.setString(6, vo.getTel());
			r = pstmt.executeUpdate(); // insert, update, delete -> executeUpdate() 사용
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return r;
	}
	
	// 수정
	// 학생정보를 입력받아 student 테이블에 update
	public int update(StudentVO vo) {
		int r = 0;
		// update 쿼리(query)
		String sql = "update student set name=?, grade=?, jumin=?, tel=? where studno=?";
		// 학생번호가 10번인 학생의 이름을 홍길동으로 변경
		// update student set name='홍길동' where studno=10
		try {
			pstmt = conn.prepareStatement(sql);
			int pstmtInt = 1;
			pstmt.setString(pstmtInt++, vo.getName());
			pstmt.setInt(pstmtInt++, vo.getGrade());
			pstmt.setString(pstmtInt++, vo.getJumin());
			pstmt.setString(pstmtInt++, vo.getTel());
			pstmt.setInt(pstmtInt++, vo.getStudno());
			r = pstmt.executeUpdate(); // insert, update, delete -> executeUpdate() 사용
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return r;
	}
	
	// 삭제
	// studno(PK)를 입력받아 student 테이블에서 삭제
	public int delete(int studno) {
		int r = 0;
		// update 쿼리(query)
		String sql = "delete from student where studno="+studno;
		// 학생번호가 10번인 학생삭제
		// delete from student where studno=10
		try {
			stmt = conn.createStatement();
			r = stmt.executeUpdate(sql); // insert, update, delete -> executeUpdate() 사용
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return r;
	}
	
	// 조회(상세페이지)
	// 학생 한명의 정보 조회
	public StudentVO selectOne(int studno) {
		StudentVO vo = null;
		//System.out.println("select * from student where studno="+studno);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select *, (select name from professor where no=student.profno) as profName from student where studno="+studno);
			if (rs.next()) {
				vo = new StudentVO();
				vo.setStudno(rs.getInt("studno"));
				vo.setName(rs.getString("name"));
				vo.setId(rs.getString("id"));
				vo.setGrade(rs.getInt("grade"));
				vo.setJumin(rs.getString("jumin"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setHeight(rs.getInt("height"));
				vo.setWeight(rs.getInt("weight"));
				vo.setMajor1(rs.getInt("major1"));
				vo.setMajor2(rs.getInt("major2"));
				vo.setProfno(rs.getInt("profno"));
				vo.setProfName(rs.getString("profName"));
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return vo;
	}
	
	// 목록
	// 학생전체목록 조회
	public List<StudentVO> selectList(String searchWord, String searchGrade) {
		List<StudentVO> list = new ArrayList<StudentVO>();
		String sql = "select * from student where 0=0";
		if (searchWord != null && !"".equals(searchWord)) {
			sql += " and name like '%"+searchWord+"%'";
		}
		if (searchGrade != null && !"".equals(searchGrade)) {
			sql += " and grade = "+searchGrade;
		}
		System.out.println(sql);
		try {
			stmt= conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				StudentVO vo = new StudentVO();
				vo.setStudno(rs.getInt("studno"));
				vo.setName(rs.getString("name"));
				vo.setId(rs.getString("id"));
				vo.setGrade(rs.getInt("grade"));
				vo.setTel(rs.getString("tel"));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	// 자원해제
	public void close() {
		try {
			conn.close();
			stmt.close();
			rs.close();
		} catch(Exception e) {
			System.out.println(e.toString());
		}
	}
	
	/*
boolean 리턴
매개변수 : studno
sql 실행
이미 등록되어있으면 true
그렇지 않으면       false
	 */
	public boolean isDuplicateStudno(int studno) {
		boolean r = true;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from student where studno="+studno);
			if (rs.next()) {
				if (rs.getInt(1) == 0) {
					// 중복 아님
					r = false;
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return r;
	}
	
	public boolean isDuplicateId(String id) {
		boolean r = true;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from student where id='"+id+"'");
			if (rs.next()) {
				if (rs.getInt(1) == 0) {
					// 중복 아님
					r = false;
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return r;
	}
	
	public static void main(String[] args) {
		StudentDAO dao = new StudentDAO();
		System.out.println(dao.isDuplicateId("hong4"));
		boolean b = dao.isDuplicateStudno(950115);
		if (b) {
			System.out.println("중복");
		} else {
			System.out.println("등록가능");
		}
		
		
		
		
		
	}
	
	
}
