//追加修正20260518

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.ClassNum;
import bean.School;

public class ClassNumDao extends Dao {

	/**
	 * クラス番号取得
	 */
	public ClassNum get(
			String class_num,
			School school
	) throws Exception {

		ClassNum classNumBean =
				null;

		Connection connection =
				getConnection();

		PreparedStatement statement =
				null;

		ResultSet rSet =
				null;

		try {

			statement =
					connection.prepareStatement(

						"select * "
					  + "from class_num "
					  + "where class_num=? "
					  + "and school_cd=?"

					);

			statement.setString(
					1,
					class_num);

			statement.setString(
					2,
					school.getCd());

			rSet =
					statement.executeQuery();

			if (rSet.next()) {

				classNumBean =
						new ClassNum();

				classNumBean.setClass_num(
						rSet.getString("class_num"));

				classNumBean.setSchool(
						school);
			}

		} catch (Exception e) {

			throw e;

		} finally {

			if (rSet != null) {
				try {
					rSet.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}

			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}

			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}

		return classNumBean;
	}

	/**
	 * クラス一覧取得
	 */
	public List<String> filter(
			School school
	) throws Exception {

		List<String> list =
				new ArrayList<>();

		Connection connection =
				getConnection();

		PreparedStatement statement =
				null;

		ResultSet rSet =
				null;

		try {

			statement =
					connection.prepareStatement(

						"select class_num "
					  + "from class_num "
					  + "where school_cd=? "
					  + "order by class_num"

					);

			statement.setString(
					1,
					school.getCd());

			rSet =
					statement.executeQuery();

			while (rSet.next()) {

				list.add(
						rSet.getString("class_num"));
			}

		} catch (Exception e) {

			throw e;

		} finally {

			if (rSet != null) {
				try {
					rSet.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}

			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}

			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}

		return list;
	}

	/**
	 * クラス登録
	 */
	public boolean insert(
			ClassNum classNum
	) throws Exception {

		Connection connection =
				getConnection();

		PreparedStatement statement =
				null;

		int count =
				0;

		try {

			statement =
					connection.prepareStatement(

						"insert into class_num "
					  + "(class_num, school_cd) "
					  + "values (?, ?)"

					);

			statement.setString(
					1,
					classNum.getClass_num());

			statement.setString(
					2,
					classNum.getSchool().getCd());

			count =
					statement.executeUpdate();

		} catch (Exception e) {

			throw e;

		} finally {

			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}

			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}

		return count > 0;
	}

	/**
	 * クラス削除
	 */
	public boolean delete(
			String class_num,
			School school
	) throws Exception {

		Connection connection =
				getConnection();

		PreparedStatement statement =
				null;

		int count =
				0;

		try {

			statement =
					connection.prepareStatement(

						"delete from class_num "
					  + "where class_num=? "
					  + "and school_cd=?"

					);

			statement.setString(
					1,
					class_num);

			statement.setString(
					2,
					school.getCd());

			count =
					statement.executeUpdate();

		} catch (Exception e) {

			throw e;

		} finally {

			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}

			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}

		return count > 0;
	}

	/**
	 * クラス使用確認
	 */
	public boolean isUsed(
			String class_num,
			School school
	) throws Exception {

		Connection connection =
				getConnection();

		PreparedStatement statement =
				null;

		ResultSet rSet =
				null;

		boolean result =
				false;

		try {

			statement =
					connection.prepareStatement(

						"select count(*) "
					  + "from student "
					  + "where class_num=? "
					  + "and school_cd=?"

					);

			statement.setString(
					1,
					class_num);

			statement.setString(
					2,
					school.getCd());

			rSet =
					statement.executeQuery();

			if (rSet.next()) {

				int count =
						rSet.getInt(1);

				result =
						count > 0;
			}

		} catch (Exception e) {

			throw e;

		} finally {

			if (rSet != null) {
				try {
					rSet.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}

			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}

			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}

		return result;
	}
}