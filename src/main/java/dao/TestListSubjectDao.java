//追加部分

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Test;

public class TestListSubjectDao extends Dao {

	public List<Test> filter(School school, String subjectCd) throws Exception {

	    List<Test> list = new ArrayList<>();

	    Connection connection = getConnection();
	    PreparedStatement statement = null;
	    ResultSet rSet = null;

	    try {

	        statement = connection.prepareStatement(
	            "select t.*, s.name as student_name " +
	            "from test t " +
	            "inner join student s on t.student_no = s.no " +
	            "where t.school_cd = ? and t.subject_cd = ? " +
	            "order by t.student_no, t.no"
	        );

	        statement.setString(1, school.getCd());
	        statement.setString(2, subjectCd);

	        rSet = statement.executeQuery();

	        while (rSet.next()) {

	            Test test = new Test();

	            test.setStudentNo(rSet.getString("student_no"));
	            test.setSubjectCd(rSet.getString("subject_cd"));
	            test.setSchoolCd(rSet.getString("school_cd"));
	            test.setNo(rSet.getInt("no"));
	            test.setPoint(rSet.getInt("point"));
	            test.setClassNum(rSet.getString("class_num"));

	            // ★追加
	            test.setStudentName(rSet.getString("student_name"));

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