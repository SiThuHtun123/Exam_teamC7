package scoremanager.main;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class SubjectCreateAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 科目登録には特別なデータの事前取得は不要です
		// そのまま登録画面（JSP）へフォワードします
		req.getRequestDispatcher("subject_create.jsp").forward(req, res);
	}
}