package bean;

import java.io.Serializable;

/**
 * 科目情報 Bean
 */
public class Subject implements Serializable {

	private String cd;

	private String name;

	private School school;

	public Subject() {
	}

	/**
	 * 科目コードを取得する
	 * @return cd 科目コード
	 */
	public String getCd() {
		return cd;
	}

	/* 
	 * 科目コードを設定する
	 * @param cd 科目コード
	 */
	public void setCd(String cd) {
		this.cd = cd;
	}

	/**
	 * 科目名を取得する
	 * @return name 科目名
	 */
	public String getName() {
		return name;
	}

	/**
	 * 科目名を設定する
	 * @param name 科目名
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 学校情報を取得する
	 * @return school 学校インスタンス
	 */
	public School getSchool() {
		return school;
	}

	/**
	 * 学校情報を設定する
	 * @param school 学校インスタンス
	 */
	public void setSchool(School school) {
		this.school = school;
	}
}