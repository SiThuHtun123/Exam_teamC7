//追加コード「学生別成績一覧」

package scoremanager.main;

import java.util.List;

import bean.Teacher;
import bean.Test;
import dao.TeacherDao;
import dao.TestDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TestListAction extends Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");

        if (teacher == null) {
            request.getRequestDispatcher("/scoremanager/login.jsp").forward(request, response);
            return;
        }

        // 🔥 ★ここが今回の核心修正
        if (teacher.getSchool() == null || teacher.getSchool().getCd() == null) {

            System.out.println("★ school情報が不完全のため再取得します");

            TeacherDao teacherDao = new TeacherDao();
            Teacher fullTeacher = teacherDao.get(teacher.getId());

            if (fullTeacher == null || fullTeacher.getSchool() == null) {
                request.getRequestDispatcher("/error.jsp").forward(request, response);
                return;
            }

            teacher = fullTeacher;
            session.setAttribute("user", teacher);
        }

        try {
            String entYearStr = request.getParameter("f1");
            String classNum = request.getParameter("f2");
            String subjectCd = request.getParameter("f3");

            int entYear = 0;

            if (entYearStr != null && !entYearStr.isEmpty()) {
                entYear = Integer.parseInt(entYearStr);
            }

            TestDao dao = new TestDao();

            List<Test> list =
                dao.filter(teacher.getSchool(), entYear, classNum, subjectCd);

            request.setAttribute("list", list);

            request.getRequestDispatcher("/scoremanager/main/test_list.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(); // ← ★これを必ず見る
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}