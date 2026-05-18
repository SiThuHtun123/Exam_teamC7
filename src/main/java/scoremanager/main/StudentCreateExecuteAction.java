//追加修正20260518

package scoremanager.main;

import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Student;
import dao.StudentDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class StudentCreateExecuteAction extends Action {

	@Override
	public void execute(
			HttpServletRequest request,
			HttpServletResponse response
	) throws Exception {

		// セッションから学校情報取得
		School school =
				(School) request.getSession()
				.getAttribute("school");

		// パラメータ取得
		String no =
				request.getParameter("no");

		String name =
				request.getParameter("name");

		String classNum =
				request.getParameter("class_num");

		int entYear =
				Integer.parseInt(
						request.getParameter("ent_year"));

		// エラーメッセージ
		List<String> errors =
				new ArrayList<>();

		// DAO
		StudentDao dao =
				new StudentDao();

		// 学生番号重複確認
		boolean exists =
				dao.exists(
						no,
						school.getCd());

		if (exists) {

			errors.add("学生番号が重複しています");
		}

		// エラーあり
		if (!errors.isEmpty()) {

			request.setAttribute(
					"errors",
					errors);

			request.getRequestDispatcher(
					"student_create.jsp")
					.forward(request, response);

			return;
		}

		// 学生生成
		Student student =
				new Student();

		student.setNo(no);
		student.setName(name);
		student.setClassNum(classNum);
		student.setEntYear(entYear);
		student.setAttend(true);
		student.setSchool(school);

		// 保存
		dao.save(student);

		// 完了画面
		request.getRequestDispatcher(
				"student_create_done.jsp")
				.forward(request, response);
	}
}