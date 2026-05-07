package scoremanager.main;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

public class TestRegistExecuteAction extends Action {

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

        // セッションからログイン中の教師情報を取得
        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");

        // エラーマップを初期化（キー：学生番号、バリュー：エラーメッセージ）
        Map<String, String> errors = new HashMap<>();

        // リクエストパラメータを取得
        String[] studentIds = req.getParameterValues("regist");
        String subject      = req.getParameter("subject");
        String classNum     = req.getParameter("class_num");
        String noStr        = req.getParameter("count");
        String entYearStr   = req.getParameter("ent_year");

        // 科目のnull・空チェック
        if (subject == null || subject.isEmpty()) {
            errors.put("subject", "科目を選択してください");
        }

        // 回数のnull・空チェック
        int no = 0;
        if (noStr == null || noStr.isEmpty()) {
            errors.put("no", "回数を選択してください");
        } else {
            no = Integer.parseInt(noStr);
        }

        // 入学年度を数値に変換する
        int entYear = 0;
        if (entYearStr != null && !entYearStr.isEmpty()) {
            entYear = Integer.parseInt(entYearStr);
        }

        // 学生IDが取得できなかった場合はエラーを返す
        if (studentIds == null) {
            errors.put("data", "データが取得できませんでした");
            req.setAttribute("errors", errors);
            req.getRequestDispatcher("TestRegist.action").forward(req, res);
            return;
        }

        // ステップ1：全学生の得点をバリデーションする（まだ保存しない）
        int[] points = new int[studentIds.length];
        boolean[] shouldSave = new boolean[studentIds.length];

        for (int i = 0; i < studentIds.length; i++) {
            // point_${studentNo} で得点を取得する
            String studentNo = studentIds[i];
            String scoreStr = req.getParameter("point_" + studentNo);

            // 得点が空の場合はスキップ（空欄入力は許可）
            if (scoreStr == null || scoreStr.isEmpty()) {
                shouldSave[i] = false;
                continue;
            }

            try {
                int point = Integer.parseInt(scoreStr);

                // 0〜100の範囲チェック
                if (point < 0 || point > 100) {
                    // エラーキーを学生番号にすることでインライン表示に対応する
                    errors.put(studentNo, "0〜100の範囲で入力してください");
                    points[i] = point;
                    shouldSave[i] = false;
                    continue;
                }

                points[i] = point;
                shouldSave[i] = true;

            } catch (NumberFormatException e) {
                // 数値以外が入力された場合
                errors.put(studentNo, "点数は数字で入力してください");
                shouldSave[i] = false;
            }
        }

        // ステップ2：エラーがない場合のみ保存処理を実行する
        if (errors.isEmpty()) {
            TestDao dao = new TestDao();

            for (int i = 0; i < studentIds.length; i++) {

                // スキップ対象はスルー
                if (!shouldSave[i]) continue;

                // Testインスタンスを生成して各フィールドをセットする
                Test test = new Test();
                test.setStudentNo(studentIds[i]);
                test.setSubjectCd(subject);
                test.setSchoolCd(teacher.getSchool().getCd());
                test.setNo(no);
                test.setPoint(points[i]);
                test.setClassNum(classNum); // ✅ class_numをセット

                // 保存（既存データがあればUPDATE、なければINSERT）
                dao.save(test);
            }

            // 登録完了画面にフォワード
            req.setAttribute("message", "登録が完了しました");
            req.getRequestDispatcher("test_regist_done.jsp").forward(req, res);

        } else {
            // エラーがある場合はtestListを再構築して画面に戻る
            // （TestRegist.actionに戻すとtestListが消えるため直接JSPにフォワード）

            // 学生一覧を再取得する
            StudentDao stuDao = new StudentDao();
            List<Student> studentList = stuDao.filter(
                teacher.getSchool(), entYear, classNum, true
            );

            // 各学生のTestインスタンスを再構築し入力値を保持する
            List<Test> testList = new ArrayList<>();

            for (int i = 0; i < studentIds.length; i++) {
                String studentNo = studentIds[i];

                // 学生情報を検索する
                Student student = null;
                for (Student s : studentList) {
                    if (s.getNo().equals(studentNo)) {
                        student = s;
                        break;
                    }
                }

                // Testインスタンスを生成する
                Test test = new Test();
                test.setStudentNo(studentNo);
                test.setSubjectCd(subject);
                test.setSchoolCd(teacher.getSchool().getCd());
                test.setNo(no);
                test.setClassNum(classNum);

                // 入力値を保持する
                String scoreStr = req.getParameter("point_" + studentNo);
                if (scoreStr != null && !scoreStr.isEmpty()) {
                    try {
                        test.setPoint(Integer.parseInt(scoreStr));
                    } catch (NumberFormatException e) {
                        test.setPoint(-1);
                    }
                } else {
                    test.setPoint(-1);
                }

                // 学生情報をセットする
                if (student != null) {
                    test.setStudentName(student.getName());
                    test.setEntYear(student.getEntYear());
                    test.setClassNum(student.getClassNum());
                }

                testList.add(test);
            }

            // ドロップダウン用データを再セットする
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            List<Integer> entYearSet = new ArrayList<>();
            for (int i = year - 10; i < year + 1; i++) {
                entYearSet.add(i);
            }
            List<Integer> noSet = new ArrayList<>();
            for (int i = 1; i <= 5; i++) {
                noSet.add(i);
            }

            ClassNumDao cDao = new ClassNumDao();
            SubjectDao sDao = new SubjectDao();

            req.setAttribute("ent_year_set", entYearSet);
            req.setAttribute("no_set", noSet);
            req.setAttribute("class_num_set", cDao.filter(teacher.getSchool()));
            req.setAttribute("subject_set", sDao.filter(teacher.getSchool()));

            // 絞込み条件・エラー・testListをリクエストにセットする
            req.setAttribute("errors", errors);
            req.setAttribute("testList", testList);
            req.setAttribute("f1", entYear);
            req.setAttribute("f2", classNum);
            req.setAttribute("f3", subject);
            req.setAttribute("f4", no);

            // 直接JSPにフォワードする（testListを保持するため）
            req.getRequestDispatcher("test_regist.jsp").forward(req, res);
        }
    }
}
