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

        // セッションからログイン中の教師情報を取得
        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");

        // エラーマップを初期化（キー：学生番号、バリュー：エラーメッセージ）
        Map<String, String> errors = new HashMap<>();

        // リクエストパラメータを取得
        // JSPのname属性に合わせて修正: student_id → regist、no → count
        String[] studentIds = req.getParameterValues("regist");
        String subject      = req.getParameter("subject");
        String classNum     = req.getParameter("class_num");
        String noStr        = req.getParameter("count");

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
            // JSPのname属性に合わせて point_${studentNo} で得点を取得する
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
                // class_numはtestテーブルに存在しないためセットしない

                // 保存（既存データがあればUPDATE、なければINSERT）
                dao.save(test);
            }

            // 登録完了画面にフォワード
            req.setAttribute("message", "登録が完了しました");
            req.getRequestDispatcher("test_regist_done.jsp").forward(req, res);

        } else {
            // エラーがある場合は登録画面に戻る
            req.setAttribute("errors", errors);
            req.getRequestDispatcher("TestRegist.action").forward(req, res);
        }
    }
}