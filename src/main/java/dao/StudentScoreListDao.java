//追加コード「学生別成績一覧」

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.StudentScoreList;

public class StudentScoreListDao extends Dao {

    public List<StudentScoreList> filter(School school, Integer entYear, String classNum, String subjectCd) throws Exception {

        List<StudentScoreList> list = new ArrayList<>();

        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet rSet = null;

        try {

            String sql =
                "select s.no as student_no, s.name as student_name, s.class_num, s.ent_year, " +
                "sub.cd as subject_cd, sub.name as subject_name, t.no, t.point " +
                "from test t " +
                "inner join student s on t.student_no = s.no " +
                "inner join subject sub on t.subject_cd = sub.cd and t.school_cd = sub.school_cd " +
                "where t.school_cd = ? ";

            if (entYear != null) {
                sql += "and s.ent_year = ? ";
            }
            if (classNum != null && !classNum.isEmpty()) {
                sql += "and s.class_num = ? ";
            }
            if (subjectCd != null && !subjectCd.isEmpty()) {
                sql += "and t.subject_cd = ? ";
            }

            sql += "order by s.no asc, sub.cd asc, t.no asc";

            statement = connection.prepareStatement(sql);

            int idx = 1;
            statement.setString(idx++, school.getCd());

            if (entYear != null) {
                statement.setInt(idx++, entYear);
            }
            if (classNum != null && !classNum.isEmpty()) {
                statement.setString(idx++, classNum);
            }
            if (subjectCd != null && !subjectCd.isEmpty()) {
                statement.setString(idx++, subjectCd);
            }

            rSet = statement.executeQuery();

            while (rSet.next()) {

                StudentScoreList bean = new StudentScoreList();

                bean.setStudentNo(rSet.getString("student_no"));
                bean.setStudentName(rSet.getString("student_name"));
                bean.setClassNum(rSet.getString("class_num"));
                bean.setEntYear(rSet.getInt("ent_year"));
                bean.setSubjectCd(rSet.getString("subject_cd"));
                bean.setSubjectName(rSet.getString("subject_name"));
                bean.setNo(rSet.getInt("no"));
                bean.setPoint(rSet.getInt("point"));

                list.add(bean);
            }

        } finally {
            if (rSet != null) rSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }

        return list;
    }
}