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

    /**
     * 保存（INSERT or UPDATE）
     */
    public boolean save(Test test) throws Exception {

        // 既存データを確認する
        Test old = get(
            test.getStudentNo(),
            test.getSubjectCd(),
            test.getSchoolCd(),
            test.getNo()
        );

        int count = 0;

        if (old == null) {
            // 既存データがない場合は新規登録
            count = insert(test);
        } else {
            // 既存データがある場合は更新
            count = update(test);
        }

        return count > 0;
    }

    /**
     * 条件検索
     * studentテーブルとJOINして氏名・入学年度・クラス番号も取得する
     */
    public List<Test> filter(School school, int entYear, String classNum, String subjectId) throws Exception {

        List<Test> list = new ArrayList<>();

        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet rSet = null;

        try {
            // studentテーブルとJOINして氏名・入学年度・クラス番号を取得
            String sql =
                "select t.*, s.class_num, s.name, s.ent_year from test t " +
                "inner join student s on t.student_no = s.no " +
                "where t.school_cd = ? ";

            // 入学年度条件を追加
            if (entYear != 0) {
                sql += "and s.ent_year = ? ";
            }
            // クラス番号条件を追加
            if (classNum != null && !classNum.isEmpty()) {
                sql += "and s.class_num = ? ";
            }
            // 科目コード条件を追加
            if (subjectId != null && !subjectId.isEmpty()) {
                sql += "and t.subject_cd = ? ";
            }

            // 学生番号の昇順で並び替え
            sql += "order by s.no asc ";

            statement = connection.prepareStatement(sql);

            // パラメータをバインドする
            int idx = 1;
            statement.setString(idx++, school.getCd());

            if (entYear != 0) {
                statement.setInt(idx++, entYear);
            }
            if (classNum != null && !classNum.isEmpty()) {
                statement.setString(idx++, classNum);
            }
            if (subjectId != null && !subjectId.isEmpty()) {
                statement.setString(idx++, subjectId);
            }

            rSet = statement.executeQuery();

            // 結果セットをTestインスタンスに変換してリストに追加
            while (rSet.next()) {
                Test test = new Test();

                test.setStudentNo(rSet.getString("student_no"));
                test.setSubjectCd(rSet.getString("subject_cd"));
                test.setSchoolCd(rSet.getString("school_cd"));
                test.setNo(rSet.getInt("no"));
                test.setPoint(rSet.getInt("point"));
                test.setClassNum(rSet.getString("class_num"));
                // 表示用フィールドをセット
                test.setStudentName(rSet.getString("name"));
                test.setEntYear(rSet.getInt("ent_year"));

                list.add(test);
            }

        } catch (Exception e) {
            throw e;

        } finally {

            if (rSet != null) {
                try {
                    rSet.close();
                } catch (SQLException e) {
                    throw e;
                }
            }

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
     * 学校コードで成績一覧を取得する
     */
    public List<Test> getList(String schoolCd) throws Exception {

        List<Test> list = new ArrayList<>();

        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet rSet = null;

        try {
            statement = connection.prepareStatement(
                "select * from test where school_cd = ?"
            );

            statement.setString(1, schoolCd);

            rSet = statement.executeQuery();

            while (rSet.next()) {
                Test test = new Test();

                test.setStudentNo(rSet.getString("student_no"));
                test.setSubjectCd(rSet.getString("subject_cd"));
                test.setSchoolCd(rSet.getString("school_cd"));
                test.setNo(rSet.getInt("no"));
                test.setPoint(rSet.getInt("point"));
                // class_numはtestテーブルに存在しないためセットしない

                list.add(test);
            }

        } finally {
            if (rSet != null) rSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }

        return list;
    }

    /**
     * 主キーで成績を1件取得する
     */
    public Test get(String studentNo, String subjectCd, String schoolCd, int no) throws Exception {

        Test test = null;

        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet rSet = null;

        try {
            statement = connection.prepareStatement(
                "select * from test where student_no = ? and subject_cd = ? and school_cd = ? and no = ?"
            );

            statement.setString(1, studentNo);
            statement.setString(2, subjectCd);
            statement.setString(3, schoolCd);
            statement.setInt(4, no);

            rSet = statement.executeQuery();

            if (rSet.next()) {
                test = new Test();

                test.setStudentNo(rSet.getString("student_no"));
                test.setSubjectCd(rSet.getString("subject_cd"));
                test.setSchoolCd(rSet.getString("school_cd"));
                test.setNo(rSet.getInt("no"));
                test.setPoint(rSet.getInt("point"));
                // class_numはtestテーブルに存在しないためセットしない
            }

        } finally {
            if (rSet != null) rSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }

        return test;
    }

    /**
     * 成績を新規登録する
     */
    public int insert(Test test) throws Exception {

        Connection connection = getConnection();
        PreparedStatement statement = null;

        try {
            // testテーブルのカラムは5つ（student_no, subject_cd, school_cd, no, point）
            statement = connection.prepareStatement(
                "insert into test values (?, ?, ?, ?, ?)"
            );

            statement.setString(1, test.getStudentNo());
            statement.setString(2, test.getSubjectCd());
            statement.setString(3, test.getSchoolCd());
            statement.setInt(4, test.getNo());
            statement.setInt(5, test.getPoint());
            // class_numはtestテーブルに存在しないためセットしない

            return statement.executeUpdate();

        } finally {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
    }

    /**
     * 成績を更新する（点数のみ更新）
     */
    public int update(Test test) throws Exception {

        Connection connection = getConnection();
        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(
                "update test set point=? where student_no=? and subject_cd=? and school_cd=? and no=?"
            );

            statement.setInt(1, test.getPoint());
            statement.setString(2, test.getStudentNo());
            statement.setString(3, test.getSubjectCd());
            statement.setString(4, test.getSchoolCd());
            statement.setInt(5, test.getNo());

            return statement.executeUpdate();

        } finally {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
    }

    /**
     * 成績を削除する
     */
    public int delete(String studentNo, String subjectCd, String schoolCd, int no) throws Exception {

        Connection connection = getConnection();
        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(
                "delete from test where student_no=? and subject_cd=? and school_cd=? and no=?"
            );

            statement.setString(1, studentNo);
            statement.setString(2, subjectCd);
            statement.setString(3, schoolCd);
            statement.setInt(4, no);

            return statement.executeUpdate();

        } finally {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
    }
}