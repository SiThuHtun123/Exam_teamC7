package bean;

import java.io.Serializable;

/**
 * 科目Bean
 */
public class Subject implements Serializable {

	private String cd;

	private String name;

	private School school;

	public Subject() {
	}

	/**
	 * 获取科目编号
	 * @return cd 科目编号
	 */
	public String getCd() {
		return cd;
	}

	/**
	 * 设置科目编号
	 * @param cd 科目编号
	 */
	public void setCd(String cd) {
		this.cd = cd;
	}

	/**
	 * 获取科目名称
	 * @return name 科目名称
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置科目名称
	 * @param name 科目名称
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 获取学校信息
	 * @return school 学校实例
	 */
	public School getSchool() {
		return school;
	}

	/**
	 * 设置学校信息
	 * @param school 学校实例
	 */
	public void setSchool(School school) {
		this.school = school;
	}
}