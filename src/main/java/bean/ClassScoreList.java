package bean;

import java.io.Serializable;

/**
 * クラス別成績一覧 Bean
 */
public class ClassScoreList implements Serializable {

	/**
	 * クラス番号:String
	 */
	private String classNum;

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
	 * 平均得点:double
	 */
	private double avgPoint;

	/**
	 * 最高得点:int
	 */
	private int maxPoint;

	/**
	 * 最低得点:int
	 */
	private int minPoint;

	/**
	 * 受験者数:int
	 */
	private int count;

	/**
	 * ゲッター・セッター
	 */
	public String getClassNum() {
		return classNum;
	}

	public void setClassNum(String classNum) {
		this.classNum = classNum;
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

	public double getAvgPoint() {
		return avgPoint;
	}

	public void setAvgPoint(double avgPoint) {
		this.avgPoint = avgPoint;
	}

	public int getMaxPoint() {
		return maxPoint;
	}

	public void setMaxPoint(int maxPoint) {
		this.maxPoint = maxPoint;
	}

	public int getMinPoint() {
		return minPoint;
	}

	public void setMinPoint(int minPoint) {
		this.minPoint = minPoint;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
