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

        String cd = req.getParameter("cd");
        String name = req.getParameter("name");

        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");
        School school = teacher.getSchool();

        SubjectDao sDao = new SubjectDao();
        
        if (cd != null && cd.length() != 3) {
            req.setAttribute("error", "科目コードは3文字で入力してください");
            req.setAttribute("cd", cd);
            req.setAttribute("name", name);
            req.getRequestDispatcher("subject_create.jsp").forward(req, res);
            return;
        }

        Subject existing = sDao.get(cd, school);
        if (existing != null) {
            req.setAttribute("error", "科目コードが重複しています");
            req.setAttribute("cd", cd);
            req.setAttribute("name", name);
            req.getRequestDispatcher("subject_create.jsp").forward(req, res);
            return;
        }

        Subject subject = new Subject();
        subject.setCd(cd);
        subject.setName(name);
        subject.setSchool(school);

        if (sDao.save(subject)) {

            res.sendRedirect("subject_create_done.jsp");
        } else {
            req.setAttribute("error", "登録に失敗しました。系统エラー。");
            req.getRequestDispatcher("subject_create.jsp").forward(req, res);
        }
    }
}