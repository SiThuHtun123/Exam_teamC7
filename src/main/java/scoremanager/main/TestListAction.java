package scoremanager.main;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import bean.School;
import bean.Student;
import bean.Subject;
import bean.Teacher;
import bean.Test;
import dao.ClassNumDao;
import dao.StudentDao;
import dao.SubjectDao;
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

        School school = teacher.getSchool();

        // 入学年度リスト生成
        int year = LocalDate.now().getYear();
        List<Integer> entYearSet = new ArrayList<>();
        for (int i = year - 10; i <= year; i++) {
            entYearSet.add(i);
        }

        // クラス一覧取得
        ClassNumDao cDao = new ClassNumDao();
        List<String> classNumSet = cDao.filter(school);

        // 科目一覧取得
        SubjectDao sDao = new SubjectDao();
        List<Subject> subjectSet = sDao.filter(school);

        // ドロップダウンデータをセット
        request.setAttribute("ent_year_set", entYearSet);
        request.setAttribute("class_num_set", classNumSet);
        request.setAttribute("subject_set", subjectSet);

        // パラメータ取得
        String entYearStr = request.getParameter("f1");
        String classNum   = request.getParameter("f2");
        String subjectCd  = request.getParameter("f3");
        String studentNo  = request.getParameter("studentNo");
        String searchType = request.getParameter("searchType");

        // 選択値を画面に保持
        request.setAttribute("f1", entYearStr);
        request.setAttribute("f2", classNum);
        request.setAttribute("f3", subjectCd);
        request.setAttribute("studentNo", studentNo);
        request.setAttribute("searchType", searchType);

        TestDao testDao = new TestDao();
        StudentDao studentDao = new StudentDao();

        // 科目情報検索
        if ("subject".equals(searchType)) {

            // 未入力チェック
            if (entYearStr == null || entYearStr.isEmpty()
                    || classNum == null || classNum.isEmpty()
                    || subjectCd == null || subjectCd.isEmpty()) {

                request.setAttribute("message", "入学年度とクラスと科目を選択してください");

            } else {

                int entYear = Integer.parseInt(entYearStr);

                List<Test> tests = testDao.filter(school, entYear, classNum, subjectCd);

                // 科目名を取得
                Subject subject = sDao.get(subjectCd, school);
                request.setAttribute("selectedSubject", subject);

<<<<<<< HEAD
                // 学生名・入学年度を補完
                for (Test test : tests) {
                    Student student = studentDao.get(test.getStudentNo());

                    if (student != null) {
                        test.setStudentName(student.getName());
                        test.setEntYear(student.getEntYear());
                    }
                }
=======
            // 回数の一覧を収集（ソート済み）
            TreeSet<Integer> noSet = new TreeSet<>();
            for (Test test : tests) {
                noSet.add(test.getNo());
            }
>>>>>>> branch 'master' of https://github.com/SiThuHtun123/Exam_teamC7.git

<<<<<<< HEAD
                // データなし
                if (tests.isEmpty()) {
                    request.setAttribute("message", "学生情報が存在しませんでした");
                }

                request.setAttribute("subjectTests", tests);
            }
=======
            // 学生ごとにグループ化: studentNo -> (no -> point)
            // 表示順を保つためLinkedHashMapを使用
            Map<String, Map<Integer, Integer>> scoreMap = new LinkedHashMap<>();
            Map<String, Test> studentInfoMap = new LinkedHashMap<>();

            for (Test test : tests) {
                String sNo = test.getStudentNo();
                if (!scoreMap.containsKey(sNo)) {
                    scoreMap.put(sNo, new LinkedHashMap<>());
                    Student student = studentDao.get(sNo);
                    if (student != null) {
                        test.setStudentName(student.getName());
                        test.setEntYear(student.getEntYear());
                    }
                    studentInfoMap.put(sNo, test);
                }
                scoreMap.get(sNo).put(test.getNo(), test.getPoint());
            }

            request.setAttribute("scoreMap", scoreMap);
            request.setAttribute("studentInfoMap", studentInfoMap);
            request.setAttribute("noSet", noSet);
>>>>>>> branch 'master' of https://github.com/SiThuHtun123/Exam_teamC7.git

        // 学生情報検索
        } else if ("student".equals(searchType)) {
            if (studentNo != null && !studentNo.isEmpty()) {
                Student student = studentDao.get(studentNo);
                request.setAttribute("selectedStudent", student);

                List<Test> tests = testDao.filter(school, 0, null, null);
                tests.removeIf(t -> !studentNo.trim().equals(t.getStudentNo().trim()));

                // 科目名を補完
                for (Test test : tests) {
                    Subject subject = sDao.get(test.getSubjectCd(), school);
                    if (subject != null) {
                        test.setSubjectName(subject.getName());
                    }
                }

                request.setAttribute("studentTests", tests);
            }
        }

        request.getRequestDispatcher("/scoremanager/main/test_list.jsp").forward(request, response);
    }
}
