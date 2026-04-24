package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Test;

public class TestDao extends Dao {

    // ★ StudentDaoと同じ書き方
    private String baseSql =
        "SELECT t.* FROM TEST t " +
        "JOIN STUDENT s ON t.STUDENT_NO = s.NO AND t.SCHOOL_CD = s.SCHOOL_CD " +
        "WHERE t.SCHOOL_CD=? ";

    /**
     * 共通：ResultSet → List変換
     */
    private List<Test> postFilter(ResultSet rs) throws Exception {

        List<Test> list = new ArrayList<>();

        try {
            while (rs.next()) {
                Test test = new Test();

                test.setStudentNo(rs.getString("STUDENT_NO"));
                test.setSubjectCd(rs.getString("SUBJECT_CD"));
                test.setSchoolCd(rs.getString("SCHOOL_CD"));
                test.setNo(rs.getInt("NO"));
                test.setPoint(rs.getInt("POINT"));
                test.setClassNum(rs.getString("CLASS_NUM"));

                list.add(test);
            }
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }

        return list;
    }

    /**
     * 条件検索
     */
    public List<Test> filter(School school, int entYear, String classNum, String subjectId) throws Exception {

        List<Test> list = new ArrayList<>();

        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;

        // 条件（StudentDao風）
        String condition =
            "AND s.ENT_YEAR=? AND t.CLASS_NUM=? AND t.SUBJECT_CD=? ";

        String order = "ORDER BY t.STUDENT_NO ASC";

        try {
            statement = connection.prepareStatement(baseSql + condition + order);

            statement.setString(1, school.getCd());
            statement.setInt(2, entYear);
            statement.setString(3, classNum);
            statement.setString(4, subjectId);

            rs = statement.executeQuery();

            list = postFilter(rs);

        } catch (Exception e) {
            throw e;
        } finally {

            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw e;
                }
            }

            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    throw e;
                }
            }
        }

        return list;
    }

    /**
     * 保存（INSERT / UPDATE）
     */
    public boolean save(Test test) throws Exception {

        Connection connection = getConnection();
        PreparedStatement statement = null;

        int count = 0;

        try {
            // ★ StudentDaoと同じ思想（存在チェック）
            String checkSql =
                "SELECT * FROM TEST WHERE STUDENT_NO=? AND SUBJECT_CD=? AND SCHOOL_CD=? AND NO=?";
            statement = connection.prepareStatement(checkSql);

            statement.setString(1, test.getStudentNo());
            statement.setString(2, test.getSubjectCd());
            statement.setString(3, test.getSchoolCd());
            statement.setInt(4, test.getNo());

            ResultSet rs = statement.executeQuery();

            statement.close();

            if (rs.next()) {
                // UPDATE
                statement = connection.prepareStatement(
                    "UPDATE TEST SET POINT=?, CLASS_NUM=? WHERE STUDENT_NO=? AND SUBJECT_CD=? AND SCHOOL_CD=? AND NO=?"
                );

                statement.setInt(1, test.getPoint());
                statement.setString(2, test.getClassNum());
                statement.setString(3, test.getStudentNo());
                statement.setString(4, test.getSubjectCd());
                statement.setString(5, test.getSchoolCd());
                statement.setInt(6, test.getNo());

            } else {
                // INSERT
                statement = connection.prepareStatement(
                    "INSERT INTO TEST (STUDENT_NO, SUBJECT_CD, SCHOOL_CD, NO, POINT, CLASS_NUM) VALUES (?, ?, ?, ?, ?, ?)"
                );

                statement.setString(1, test.getStudentNo());
                statement.setString(2, test.getSubjectCd());
                statement.setString(3, test.getSchoolCd());
                statement.setInt(4, test.getNo());
                statement.setInt(5, test.getPoint());
                statement.setString(6, test.getClassNum());
            }

            count = statement.executeUpdate();

        } catch (Exception e) {
            throw e;
        } finally {

            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw e;
                }
            }

            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    throw e;
                }
            }
        }

        return count > 0;
    }
}