//追加部分「クラス管理」

package scoremanager.main;

import bean.Teacher;
import dao.ClassNumDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class ClassNumDeleteAction extends Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // セッション取得
        HttpSession session = request.getSession();

        // ログインユーザー取得
        Teacher teacher = (Teacher) session.getAttribute("user");

        // パラメータ取得
        String classNum = request.getParameter("class_num");

        // DAO生成
        ClassNumDao dao = new ClassNumDao();

        // 削除実行（Schoolオブジェクトで渡す）
        dao.delete(classNum, teacher.getSchool());

        // 一覧へリダイレクト
        response.sendRedirect("ClassNumList.action");
    }
}