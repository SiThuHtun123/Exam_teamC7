package scoremanager.main;

import bean.School;
import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class SubjectCreateExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 1. パラメータの取得
		String cd = req.getParameter("cd");     // 科目コード
		String name = req.getParameter("name"); // 科目名

		HttpSession session = req.getSession();
		Teacher teacher = (Teacher) session.getAttribute("user");
		School school = teacher.getSchool(); // ログインユーザーの学校を取得

		SubjectDao sDao = new SubjectDao();

		// 2. 既存科目の重複チェック
		Subject checkSubject = sDao.get(cd, school);
		if (checkSubject != null) {
			// 重複がある場合、エラーメッセージをセットして入力画面に戻る
			req.setAttribute("error", "科目コードが重複しています");
			req.setAttribute("cd", cd);
			req.setAttribute("name", name);
			req.getRequestDispatcher("subject_create.jsp").forward(req, res);
			return;
		}

		// 3. Subjectオブジェクトの作成と保存
		Subject subject = new Subject();
		subject.setCd(cd);
		subject.setName(name);
		subject.setSchool(school);

		// DAOを使って保存（以前作成した SubjectDao.save を使用）
		if (sDao.save(subject)) {
			// 成功したら完了画面へ
			res.sendRedirect("subject_create_done.jsp");
		} else {
			// 失敗した場合（念のため）
			req.setAttribute("error", "登録に失敗しました。");
			req.getRequestDispatcher("subject_create.jsp").forward(req, res);
		}
	}
}