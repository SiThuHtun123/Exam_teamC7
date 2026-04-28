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

        // school補完
        if (teacher.getSchool() == null || teacher.getSchool().getCd() == null) {
            TeacherDao teacherDao = new TeacherDao();
            teacher = teacherDao.get(teacher.getId());
            session.setAttribute("user", teacher);
        }

        try {
            // パラメータ取得
            String entYearStr = request.getParameter("f1");
            String classNum = request.getParameter("f2");
            String subjectCd = request.getParameter("f3");
            String studentNo = request.getParameter("studentNo");

            // 🔥 検索されたか判定
            boolean isSearch =
                (entYearStr != null && !entYearStr.isEmpty()) ||
                (classNum != null && !classNum.isEmpty()) ||
                (subjectCd != null && !subjectCd.isEmpty()) ||
                (studentNo != null && !studentNo.isEmpty());

            if (isSearch) {

                int entYear = 0;
                if (entYearStr != null && !entYearStr.isEmpty()) {
                    entYear = Integer.parseInt(entYearStr);
                }

                TestDao dao = new TestDao();

                List<Test> list =
                    dao.filter(teacher.getSchool(), entYear, classNum, subjectCd);

                // 学生番号検索がある場合はさらに絞る
                if (studentNo != null && !studentNo.isEmpty()) {
                    list.removeIf(t -> !studentNo.equals(t.getStudentNo()));
                }

                request.setAttribute("list", list);
            }

            request.getRequestDispatcher("/scoremanager/main/test_list.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}