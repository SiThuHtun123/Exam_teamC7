package bean;

import java.io.Serializable;

public class Test implements Serializable {

	/**
	 * 学生番号:String
	 */
	private String studentNo;

	/**
	 * 科目コード:String
	 */
	private String subjectCd;

	/**
	 * 学校コード:String
	 */
	private String schoolCd;

	/**
	 * テスト番号:int
	 */
	private int no;

	/**
	 * 得点:int
	 */
	private int point;

	/**
	 * クラス番号:String
	 */
	private String classNum;
	
	
	/**
	 * 学生名と入学年度を追加する
	 */
	/**
	 * 学生氏名:String（表示用・studentテーブルからJOINで取得）
	 */
	private String studentName;
 
	/**
	 * 入学年度:int（表示用・studentテーブルからJOINで取得）
	 */
	private int entYear;

	/**
	 * ゲッター・セッター
	 */
	public String getStudentNo() {
		return studentNo;
	}

	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}

	public String getSubjectCd() {
		return subjectCd;
	}

	public void setSubjectCd(String subjectCd) {
		this.subjectCd = subjectCd;
	}

	public String getSchoolCd() {
		return schoolCd;
	}

	public void setSchoolCd(String schoolCd) {
		this.schoolCd = schoolCd;
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

	public String getClassNum() {
		return classNum;
	}

	public void setClassNum(String classNum) {
		this.classNum = classNum;
	}
	
	/**
	 * 学生名と入学年度を追加する
	 */
	public String getStudentName() {
		return studentName;
	}
 
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
 
	public int getEntYear() {
		return entYear;
	}
 
	public void setEntYear(int entYear) {
		this.entYear = entYear;
	}
}
