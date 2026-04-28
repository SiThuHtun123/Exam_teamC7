package scoremanager.main;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import bean.Student;
import bean.Teacher;
import bean.Test;
import dao.ClassNumDao;
import dao.StudentDao;
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
        String classNum   = req.getParameter("f2");
        String subject    = req.getParameter("f3");
        String noStr      = req.getParameter("f4");

        // 入学年度を数値に変換（未選択の場合は0）
        int entYear = 0;
        if (entYearStr != null && !entYearStr.isEmpty()) {
            entYear = Integer.parseInt(entYearStr);
        }

        // 回数を数値に変換（未選択の場合は0）
        int no = 0;
        if (noStr != null && !noStr.isEmpty()) {
            no = Integer.parseInt(noStr);
        }

        // 入学年度リストを生成（現在の年度から過去10年分）
        LocalDate now = LocalDate.now();
        int year = now.getYear();
        List<Integer> entYearSet = new ArrayList<>();
        for (int i = year - 10; i < year + 1; i++) {
            entYearSet.add(i);
        }

        // 回数リストを生成（1〜5回）
        List<Integer> noSet = new ArrayList<>();
        for (int i = 1; i <= 5; i++) {
            noSet.add(i);
        }

        // クラス一覧を取得
        ClassNumDao cDao = new ClassNumDao();
        List<String> classList = cDao.filter(teacher.getSchool());

        // 科目一覧を取得
        SubjectDao sDao = new SubjectDao();
        req.setAttribute("subject_set", sDao.filter(teacher.getSchool()));

        // 全条件が選択されている場合のみ処理を実行
        if (entYear != 0
                && classNum != null && !classNum.isEmpty() && !classNum.equals("0")
                && subject != null && !subject.isEmpty() && !subject.equals("0")
                && no != 0) {

            // ステップ1: StudentDaoで条件に合う学生一覧を取得する
            StudentDao stuDao = new StudentDao();
            List<Student> studentList = stuDao.filter(
                teacher.getSchool(), entYear, classNum, true
            );

            // ステップ2: 各学生の既存の得点をTestDaoから取得してTestインスタンスを生成する
            TestDao tDao = new TestDao();
            List<Test> testList = new ArrayList<>();

            for (Student student : studentList) {

                // 既存の得点を検索する（存在しない場合はnull）
                Test test = tDao.get(
                    student.getNo(),
                    subject,
                    teacher.getSchool().getCd(),
                    no
                );

                if (test == null) {
                    // 既存の得点がない場合は空のTestインスタンスを生成する
                    test = new Test();
                    test.setStudentNo(student.getNo());
                    test.setSubjectCd(subject);
                    test.setSchoolCd(teacher.getSchool().getCd());
                    test.setNo(no);
                    test.setPoint(-1); // 未入力を表すフラグ（JSPで空欄表示に使用）
                }

                // 表示用に学生情報をTestインスタンスにセットする
                test.setStudentName(student.getName());
                test.setEntYear(student.getEntYear());
                test.setClassNum(student.getClassNum());

                testList.add(test);
            }

            req.setAttribute("testList", testList);
        }

        // 選択値を画面に保持するためリクエストにセット
        req.setAttribute("f1", entYear);
        req.setAttribute("f2", classNum);
        req.setAttribute("f3", subject);
        req.setAttribute("f4", no);
        req.setAttribute("class_num_set", classList);
        req.setAttribute("ent_year_set", entYearSet);
        req.setAttribute("no_set", noSet);

        // 成績登録画面にフォワード
        req.getRequestDispatcher("/scoremanager/main/test_regist.jsp").forward(req, res);
    }
}
