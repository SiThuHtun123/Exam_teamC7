//追加修正20260515

package scoremanager.main;

import java.util.List;

import bean.School;
import bean.Teacher;
import dao.ClassNumDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class ClassListAction extends Action {

    @Override
    public void execute(HttpServletRequest req,
                        HttpServletResponse res)
            throws Exception {

        // ログインユーザー取得
        Teacher teacher =
            (Teacher) req.getSession()
                         .getAttribute("user");

        // ログイン確認
        if (teacher == null) {

            res.sendRedirect("../login.jsp");

            return;
        }

        // 学校取得
        School school =
            teacher.getSchool();

        // DAO生成
        ClassNumDao dao =
            new ClassNumDao();

        // クラス一覧取得
        List<String> classList =
            dao.filter(school);

        // JSPへ渡す
        req.setAttribute(
            "class_list",
            classList
        );

        // JSP表示
        req.getRequestDispatcher(
            "class_list.jsp"
        ).forward(req, res);
    }
}