package scoremanager.main;

import bean.School;
import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class SubjectDeleteExecuteAction extends Action {
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
        // 1. 获取参数（此时 cd 应该是已经通过 POST 或 URL 编码传过来的完整字符串，如 "A#1"）
        String cd = req.getParameter("cd");

        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");
        School school = teacher.getSchool();

        SubjectDao sDao = new SubjectDao();
        
        // 2. 先尝试获取对象，确认该科目确实存在于当前学校中
        Subject subject = sDao.get(cd, school);

        if (subject != null) {
            // 3. 执行删除
            boolean isDeleted = sDao.delete(subject);
            
            if (isDeleted) {
                // 删除成功，跳转到成功页面
                res.sendRedirect("subject_delete_done.jsp");
            } else {
                // 逻辑异常处理：如果由于外键约束等原因删除失败，返回列表并提示
                req.setAttribute("error", "他のデータで使用されているため、削除できません。");
                req.getRequestDispatcher("SubjectList.action").forward(req, res);
            }
        } else {
            // 如果没找到该科目（可能已被他人删除），直接重定向回列表
            res.sendRedirect("SubjectList.action");
        }
    }
}