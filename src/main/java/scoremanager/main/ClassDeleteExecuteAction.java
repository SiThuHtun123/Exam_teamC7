//追加修正20260515

package scoremanager.main;

import bean.School;
import bean.Teacher;
import dao.ClassNumDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class ClassDeleteExecuteAction extends Action {

	@Override
	public void execute(
			HttpServletRequest req,
			HttpServletResponse res)
			throws Exception {

		// ログインユーザー取得
		Teacher teacher =
			(Teacher) req.getSession()
						 .getAttribute("user");

		// ログイン確認
		if (teacher == null) {

			res.sendRedirect("../login.jsp");

			return;
		}

		// 学校取得
		School school =
			teacher.getSchool();

		// クラス番号取得
		String class_num =
			req.getParameter("class_num");

		// DAO生成
		ClassNumDao dao =
			new ClassNumDao();

		// =========================
		// 使用中チェック
		// =========================
		boolean used =
			dao.isUsed(
				class_num,
				school
			);

		// 使用中なら削除禁止
		if (used) {

			req.setAttribute(
				"error",
				"このクラスは学生情報で使用中のため削除できません。"
			);

			req.setAttribute(
				"class_num_value",
				class_num
			);

			req.getRequestDispatcher(
				"class_delete.jsp"
			).forward(req, res);

			return;
		}

		// =========================
		// 削除実行
		// =========================
		dao.delete(
			class_num,
			school
		);

		// 一覧へ戻る
		res.sendRedirect(
			"ClassList.action"
		);
	}
}