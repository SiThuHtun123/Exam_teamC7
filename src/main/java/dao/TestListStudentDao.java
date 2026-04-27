//追加部分

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Test;

public class TestListStudentDao extends Dao {

	public List<Test> filter(School school, String studentNo) throws Exception {

	    List<Test> list = new ArrayList<>();

	    Connection connection = getConnection();
	    PreparedStatement statement = null;
	    ResultSet rSet = null;

	    try {

	        statement = connection.prepareStatement(
	            "select t.*, s.name as student_name, sub.name as subject_name " +
	            "from test t " +
	            "inner join student s on t.student_no = s.no " +
	            "inner join subject sub on t.subject_cd = sub.cd and t.school_cd = sub.school_cd " +
	            "where t.school_cd = ? and t.student_no = ? " +
	            "order by t.subject_cd, t.no"
	        );

	        statement.setString(1, school.getCd());
	        statement.setString(2, studentNo);

	        rSet = statement.executeQuery();

	        while (rSet.next()) {

	            Test test = new Test();

	            test.setStudentNo(rSet.getString("student_no"));
	            test.setSubjectCd(rSet.getString("subject_cd"));
	            test.setSchoolCd(rSet.getString("school_cd"));
	            test.setNo(rSet.getInt("no"));
	            test.setPoint(rSet.getInt("point"));
	            test.setClassNum(rSet.getString("class_num"));

	            // ★追加（重要）
	            test.setStudentName(rSet.getString("student_name"));
	            test.setSubjectName(rSet.getString("subject_name"));

	            list.add(test);
	        }

	    } finally {
	        if (rSet != null) rSet.close();
	        if (statement != null) statement.close();
	        if (connection != null) connection.close();
	    }

	    return list;
	}
}