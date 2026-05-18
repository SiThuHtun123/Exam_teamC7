//追加修正20260518

package bean;

import java.io.Serializable;

public class ClassNum implements Serializable {

	/**
	 * クラス番号
	 */
	private String class_num;

	/**
	 * 学校
	 */
	private School school;

	/**
	 * クラス番号取得
	 */
	public String getClass_num() {

		return class_num;
	}

	/**
	 * クラス番号設定
	 */
	public void setClass_num(
			String class_num
	) {

		this.class_num = class_num;
	}

	/**
	 * 学校取得
	 */
	public School getSchool() {

		return school;
	}

	/**
	 * 学校設定
	 */
	public void setSchool(
			School school
	) {

		this.school = school;
	}
}