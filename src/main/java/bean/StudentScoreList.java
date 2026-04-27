package bean;

import java.io.Serializable;

/**
 * 学生別成績一覧 Bean
 */
public class StudentScoreList implements Serializable {

	/**
	 * 学生番号:String
	 */
	private String studentNo;

	/**
	 * 学生名:String
	 */
	private String studentName;

	/**
	 * クラス番号:String
	 */
	private String classNum;

	/**
	 * 入学年度:int
	 */
	private int entYear;

	/**
	 * 科目コード:String
	 */
	private String subjectCd;

	/**
	 * 科目名:String
	 */
	private String subjectName;

	/**
	 * テスト番号:int
	 */
	private int no;

	/**
	 * 得点:int
	 */
	private int point;

	/**
	 * ゲッター・セッター
	 */
	public String getStudentNo() {
		return studentNo;
	}

	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getClassNum() {
		return classNum;
	}

	public void setClassNum(String classNum) {
		this.classNum = classNum;
	}

	public int getEntYear() {
		return entYear;
	}

	public void setEntYear(int entYear) {
		this.entYear = entYear;
	}

	public String getSubjectCd() {
		return subjectCd;
	}

	public void setSubjectCd(String subjectCd) {
		this.subjectCd = subjectCd;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
}
