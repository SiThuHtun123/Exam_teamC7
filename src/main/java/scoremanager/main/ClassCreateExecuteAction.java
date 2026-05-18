//追加修正20260518

package scoremanager.main;

import bean.ClassNum;
import bean.School;
import bean.Teacher;
import dao.ClassNumDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class ClassCreateExecuteAction extends Action {

    @Override
    public void execute(HttpServletRequest req,
                        HttpServletResponse res)
            throws Exception {

        Teacher teacher =
            (Teacher) req.getSession()
                         .getAttribute("user");

        School school =
            teacher.getSchool();

        String classNum =
            req.getParameter("class_num");

        // 入力チェック
        if (classNum == null ||
            classNum.isEmpty()) {

            req.setAttribute(
                "error",
                "クラス番号を入力してください"
            );

            req.getRequestDispatcher(
                "class_create.jsp"
            ).forward(req, res);

            return;
        }

        ClassNumDao dao =
            new ClassNumDao();

        // 重複確認
        ClassNum check =
            dao.get(classNum, school);

        if (check != null) {

            req.setAttribute(
                "error",
                "既に存在するクラス番号です"
            );

            req.getRequestDispatcher(
                "class_create.jsp"
            ).forward(req, res);

            return;
        }

        // Bean生成
        ClassNum c =
            new ClassNum();

        c.setClass_num(classNum);

        c.setSchool(school);

        // 登録
        dao.insert(c);

        // 一覧へ戻る
        res.sendRedirect(
            "ClassList.action"
        );
    }
}