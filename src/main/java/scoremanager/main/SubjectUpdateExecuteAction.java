package scoremanager.main;

import bean.School;
import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class SubjectUpdateExecuteAction extends Action {
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
        String cd = req.getParameter("cd");
        String name = req.getParameter("name");

        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");
        School school = teacher.getSchool();

        SubjectDao sDao = new SubjectDao();
        
        Subject subject = new Subject();
        subject.setCd(cd);
        subject.setName(name);
        subject.setSchool(school);

        
        if (sDao.save(subject)) {
            res.sendRedirect("subject_update_done.jsp");
        } else {
            req.setAttribute("error", "更新に失敗しました。");
            req.setAttribute("subject", subject);
            req.getRequestDispatcher("subject_update.jsp").forward(req, res);
        }
    }
}