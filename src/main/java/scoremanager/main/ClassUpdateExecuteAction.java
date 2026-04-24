// 追加「クラス管理」

package scoremanager.main;

import java.util.HashMap;
import java.util.Map;

import bean.ClassNum;
import bean.Teacher;
import dao.ClassNumDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class ClassUpdateExecuteAction extends Action {

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");

        // ログインチェック
        if (teacher == null || !teacher.isAuthenticated()) {
            req.getRequestDispatcher("login.jsp").forward(req, res);
            return;
        }

        // パラメータ取得
        String class_num = req.getParameter("class_num");

        // エラー格納用
        Map<String, String> errors = new HashMap<>();

        // 入力チェック
        if (class_num == null || class_num.isEmpty()) {
            errors.put("1", "このフィールドを入力してください");
        }

        // エラーがある場合 → 変更画面へ戻す
        if (errors.size() > 0) {
            req.setAttribute("errors", errors);
            req.setAttribute("class_num", class_num);
            req.getRequestDispatcher("class_update.jsp").forward(req, res);
            return;
        }

        // DAO
        ClassNumDao cDao = new ClassNumDao();

        // 更新処理
        ClassNum cn = new ClassNum();
        cn.setClass_num(class_num);
        cn.setSchool(teacher.getSchool());

//        cDao.update(cn);

        // 完了画面へ
        req.getRequestDispatcher("class_update_done.jsp").forward(req, res);
    }
}
