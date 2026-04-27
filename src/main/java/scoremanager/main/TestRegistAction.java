package scoremanager.main;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import bean.Teacher;
import dao.ClassNumDao;
import dao.SubjectDao;
import dao.TestDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TestRegistAction extends Action {

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

        // セッションからログイン中の教師情報を取得
        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");

        // リクエストパラメータを取得
        String entYearStr = req.getParameter("f1");
        String classNum = req.getParameter("f2");
        String subject = req.getParameter("f3");

        // 入学年度を数値に変換（未選択の場合は0）
        int entYear = 0;
        if (entYearStr != null && !entYearStr.isEmpty()) {
            entYear = Integer.parseInt(entYearStr);
        }

        // 入学年度リストを生成（現在の年度から過去10年分）
        LocalDate now = LocalDate.now();
        int year = now.getYear();
        List<Integer> entYearSet = new ArrayList<>();
        for (int i = year - 10; i < year + 1; i++) {
            entYearSet.add(i);
        }

        // クラス一覧を取得
        ClassNumDao cDao = new ClassNumDao();
        List<String> classList = cDao.filter(teacher.getSchool());

        // 科目一覧を取得
        SubjectDao sDao = new SubjectDao();
        req.setAttribute("subject_set", sDao.filter(teacher.getSchool()));

        // 全条件が選択されている場合のみ成績を検索
        if (entYear != 0
                && classNum != null && !classNum.isEmpty() && !classNum.equals("0")
                && subject != null && !subject.isEmpty() && !subject.equals("0")) {

            TestDao dao = new TestDao();
            req.setAttribute("testList",
                dao.filter(teacher.getSchool(), entYear, classNum, subject));
        }

        // 選択値を画面に保持するためリクエストにセット
        req.setAttribute("f1", entYear);
        req.setAttribute("f2", classNum);
        req.setAttribute("f3", subject);
        req.setAttribute("class_num_set", classList);
        req.setAttribute("ent_year_set", entYearSet);

        // 成績登録画面にフォワード
        req.getRequestDispatcher("test_regist.jsp").forward(req, res);
    }
}