//追加修正20260515

package scoremanager.main;

import bean.ClassNum;
import bean.School;
import bean.Teacher;
import dao.ClassNumDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class ClassDeleteAction extends Action {

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

        ClassNumDao dao =
            new ClassNumDao();

        ClassNum c =
            dao.get(classNum, school);

        req.setAttribute(
            "class_num",
            c
        );

        req.getRequestDispatcher(
            "class_delete.jsp"
        ).forward(req, res);
    }
}
