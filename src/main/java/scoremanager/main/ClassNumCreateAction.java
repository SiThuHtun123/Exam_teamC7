//追加修正20260518

//追加部分「クラス管理」

package scoremanager.main;

import bean.Teacher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class ClassNumCreateAction extends Action {

	@Override
	public void execute(
			HttpServletRequest request,
			HttpServletResponse response)
			throws Exception {

		// セッション取得
		HttpSession session =
			request.getSession();

		// ログインユーザー取得
		Teacher teacher =
			(Teacher) session.getAttribute(
				"user"
			);

		// 未ログイン対策
		if (teacher == null) {

			response.sendRedirect(
				"../login.jsp"
			);

			return;
		}

		// 入力画面へ遷移
		request.getRequestDispatcher(
			"/scoremanager/main/class_num_create.jsp"
		).forward(
			request,
			response
		);
	}
}