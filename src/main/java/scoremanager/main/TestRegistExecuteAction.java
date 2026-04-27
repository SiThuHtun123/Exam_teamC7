package scoremanager.main;

import java.util.HashMap;
import java.util.Map;

import bean.Teacher;
import bean.Test;
import dao.TestDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TestRegistExecuteAction extends Action {
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");

        Map<String, String> errors = new HashMap<>();

        String[] studentIds = req.getParameterValues("student_id");
        String[] scores = req.getParameterValues("score");
        String[] nos = req.getParameterValues("no"); // ✅ 修正: noをフォームから取得
        String subject = req.getParameter("subject");
        String classNum = req.getParameter("class_num"); // ✅ 修正: classNumを取得

        // ✅ 修正: subjectのnull/emptyチェック
        if (subject == null || subject.isEmpty()) {
            errors.put("subject", "科目を選択してください");
        }

        if (studentIds == null || scores == null || nos == null) {
            errors.put("data", "データが取得できませんでした");
            req.setAttribute("errors", errors);
            req.getRequestDispatcher("TestRegist.action").forward(req, res);
            return;
        }

        // ✅ 修正: Bước 1 — Validate toàn bộ trước, chưa save
        int[] points = new int[studentIds.length];
        boolean[] shouldSave = new boolean[studentIds.length];

        for (int i = 0; i < studentIds.length; i++) {
            String scoreStr = scores[i];

            if (scoreStr == null || scoreStr.isEmpty()) {
                shouldSave[i] = false;
                continue;
            }

            try {
                int point = Integer.parseInt(scoreStr);
                if (point < 0 || point > 100) {
                    errors.put("range", "点数は0〜100で入力してください");
                    break;
                }
                points[i] = point;
                shouldSave[i] = true;

            } catch (NumberFormatException e) {
                errors.put("format", "点数は数字で入力してください");
                break;
            }
        }

        // ✅ 修正: Bước 2 — Chỉ save khi không có lỗi nào
        if (errors.isEmpty()) {
            TestDao dao = new TestDao();

            for (int i = 0; i < studentIds.length; i++) {
                if (!shouldSave[i]) continue;

                Test test = new Test();
                test.setStudentNo(studentIds[i]);
                test.setSubjectCd(subject);
                test.setPoint(points[i]);
                test.setSchoolCd(teacher.getSchool().getCd());
                test.setClassNum(classNum); // ✅ 修正: classNumをセット
                test.setNo(Integer.parseInt(nos[i])); // ✅ 修正: noをフォームから取得

                dao.save(test);
            }

            req.getRequestDispatcher("test_regist_done.jsp").forward(req, res);

        } else {
            req.setAttribute("errors", errors);
            req.getRequestDispatcher("TestRegist.action").forward(req, res);
        }
    }
}