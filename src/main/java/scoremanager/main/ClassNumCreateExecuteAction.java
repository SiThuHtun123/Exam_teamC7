//追加修正20260518

//追加部分「クラス管理」


package scoremanager.main;

import java.util.HashMap;
import java.util.Map;

import bean.ClassNum;
import bean.Teacher;
import dao.ClassNumDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class ClassNumCreateExecuteAction extends Action {

	@Override
	public void execute(
			HttpServletRequest request,
			HttpServletResponse response
	) throws Exception {

		// セッション取得
		HttpSession session =
				request.getSession();

		// ログイン教師取得
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

		// 入力値取得
		String classNumStr =
				request.getParameter("class_num");

		// null対策
		if (classNumStr != null) {

			classNumStr =
					classNumStr.trim();
		}

		// 未入力チェック
		if (classNumStr == null
				|| classNumStr.isEmpty()) {

			errors.put(
					"class_num",
					"クラス番号を入力してください"
			);
		}

		// DAO
		ClassNumDao dao =
				new ClassNumDao();

		// 重複チェック
		ClassNum old =
				dao.get(
						classNumStr,
						teacher.getSchool()
				);

		if (old != null) {

			errors.put(
					"duplicate",
					"既に登録済みのクラスです"
			);
		}

		// エラー時
		if (!errors.isEmpty()) {

			request.setAttribute(
					"errors",
					errors
			);

			request.setAttribute(
					"class_num",
					classNumStr
			);

			request.getRequestDispatcher(
					"/scoremanager/main/class_num_create.jsp"
			).forward(
					request,
					response
			);

			return;
		}

		// Bean生成
		ClassNum classNum =
				new ClassNum();

		classNum.setClass_num(classNumStr);

		classNum.setSchool(
				teacher.getSchool());

		// 登録
		dao.insert(classNum);

		// 一覧へリダイレクト
		response.sendRedirect(
				"ClassNumList.action");
	}
}