//追加修正20260518

//追加部分「クラス管理」

package scoremanager.main;

import java.util.HashMap;
import java.util.Map;

import bean.Teacher;
import dao.ClassNumDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class ClassNumDeleteAction extends Action {

	@Override
	public void execute(
			HttpServletRequest request,
			HttpServletResponse response
	) throws Exception {

		// セッション取得
		HttpSession session =
				request.getSession();

		// ログインユーザー取得
		Teacher teacher =
				(Teacher) session.getAttribute("user");

		// 未ログイン対策
		if (teacher == null) {

			response.sendRedirect("../login.jsp");
			return;
		}

		// エラー格納
		Map<String, String> errors =
				new HashMap<>();

		// パラメータ取得
		String classNum =
				request.getParameter("class_num");

		// null対策
		if (classNum != null) {

			classNum =
					classNum.trim();
		}

		// 未入力対策
		if (classNum == null
				|| classNum.isEmpty()) {

			errors.put(
					"class_num",
					"クラス番号が取得できません"
			);
		}

		// DAO生成
		ClassNumDao dao =
				new ClassNumDao();

		// 使用中チェック
		boolean used =
				dao.isUsed(
						classNum,
						teacher.getSchool()
				);

		// 使用中なら削除禁止
		if (used) {

			errors.put(
					"used",
					"このクラスは学生情報で使用中のため削除できません"
			);
		}

		// エラー時
		if (!errors.isEmpty()) {

			request.setAttribute(
					"errors",
					errors
			);

			request.getRequestDispatcher(
					"class_num_list.jsp"
			).forward(
					request,
					response
			);

			return;
		}

		// 削除実行
		dao.delete(
				classNum,
				teacher.getSchool()
		);

		// 一覧へリダイレクト
		response.sendRedirect(
				"ClassNumList.action");
	}
}