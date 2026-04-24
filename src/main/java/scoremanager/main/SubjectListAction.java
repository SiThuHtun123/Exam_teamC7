package scoremanager.main;

import java.util.List;

import bean.School;
import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class SubjectListAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// セッションからログイン情報を取得
		HttpSession session = req.getSession();
		Teacher teacher = (Teacher) session.getAttribute("user");

		// 学校情報を取得
		School school = teacher.getSchool();

		// 科目一覧を取得するためのDAOを初期化
		SubjectDao sDao = new SubjectDao();
		
		// 1. 該当校の科目一覧を取得
		List<Subject> subjects = sDao.filter(school);

		// --- 6. レスポンス値をセット ---
		// リクエスト属性に科目リストをセット
		req.setAttribute("subjects", subjects);

		// --- 7. フォワード ---
		// 科目一覧JSPへフォワード
		req.getRequestDispatcher("subject_list.jsp").forward(req, res);
	}
}