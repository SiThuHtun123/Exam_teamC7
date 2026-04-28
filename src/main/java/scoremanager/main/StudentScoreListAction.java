package scoremanager.main;

import java.util.List;

import bean.StudentScoreList;
import bean.Teacher;
import dao.StudentScoreListDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class StudentScoreListAction extends Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");

        // 🔥 ログインチェック（重要）
        if (teacher == null || !teacher.isAuthenticated()) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        String entYearStr = request.getParameter("f1");
        String classNum = request.getParameter("f2");
        String subjectCd = request.getParameter("f3");

        Integer entYear = null;

        if (entYearStr != null && !entYearStr.isEmpty()) {
            entYear = Integer.parseInt(entYearStr);
        }

        StudentScoreListDao dao = new StudentScoreListDao();

        List<StudentScoreList> list =
            dao.filter(teacher.getSchool(), entYear, classNum, subjectCd);

        request.setAttribute("list", list);

        request.getRequestDispatcher("scoremanager/main/student_score_list.jsp")
               .forward(request, response);
    }
}