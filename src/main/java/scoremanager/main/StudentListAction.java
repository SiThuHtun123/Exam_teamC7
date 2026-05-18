//修正2026/05/13

package scoremanager.main;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Student;
import bean.Teacher;
import dao.ClassNumDao;
import dao.StudentDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class StudentListAction extends Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // セッション
        HttpSession session = request.getSession();

        // ログインユーザー取得
        Teacher teacher = (Teacher) session.getAttribute("user");

        // パラメータ取得
        String entYearStr = request.getParameter("f1"); // 入学年度
        String classNum = request.getParameter("f2");   // クラス番号
        String isAttendStr = request.getParameter("f3"); // 在学中チェック

        // 初期値
        int entYear = 0;
        boolean isAttend = false;

        // 学生リスト
        List<Student> students = null;

        // 現在年取得
        LocalDate todaysDate = LocalDate.now();
        int year = todaysDate.getYear();

        // DAO
        StudentDao sDao = new StudentDao();
        ClassNumDao cNumDao = new ClassNumDao();

        // エラー格納
        Map<String, String> errors = new HashMap<>();

        // null文字列を空として扱う
        if ("null".equals(classNum)) classNum = null;
        if ("null".equals(isAttendStr)) isAttendStr = null;

        // 入学年度変換
        if (entYearStr != null && !entYearStr.isEmpty()) {
            entYear = Integer.parseInt(entYearStr);
        }

        // ★ 在学中チェック判定（検索前に行う）
        if (isAttendStr != null) {
            isAttend = true;
        }

        // 入学年度リスト作成
        List<Integer> entYearSet = new ArrayList<>();

        for (int i = year - 10; i < year + 1; i++) {
            entYearSet.add(i);
        }

        // クラス一覧取得
        List<String> list = cNumDao.filter(teacher.getSchool());

        // 検索処理
        if (entYear != 0 && classNum != null && !classNum.equals("0")) {

            // 入学年度 + クラス番号
            students = sDao.filter(
                    teacher.getSchool(),
                    entYear,
                    classNum,
                    isAttend
            );

        } else if (entYear != 0 &&
                   (classNum == null || classNum.equals("0"))) {

            // 入学年度のみ
            students = sDao.filter(
                    teacher.getSchool(),
                    entYear,
                    isAttend
            );

        } else if (entYear == 0 &&
                  (classNum == null || classNum.equals("0"))) {

            // 全件
            students = sDao.filter(
                    teacher.getSchool(),
                    isAttend
            );

        } else {

            // クラスのみ指定エラー
            errors.put(
                    "f1",
                    "クラスを指定する場合は入学年度も指定してください"
            );

            request.setAttribute("errors", errors);

            // 全件表示
            students = sDao.filter(
                    teacher.getSchool(),
                    isAttend
            );
        }

        // ソート
        String sortBy  = request.getParameter("sortBy");
        String sortDir = request.getParameter("sortDir");
        if (sortBy == null || sortBy.isEmpty()) sortBy = "entYear";
        if (sortDir == null || sortDir.isEmpty()) sortDir = "desc";

        Comparator<Student> comparator;
        if ("studentNo".equals(sortBy)) {
            comparator = Comparator.comparing(Student::getNo);
        } else {
            comparator = Comparator.comparingInt(Student::getEntYear);
        }
        if ("desc".equals(sortDir)) comparator = comparator.reversed();
        students.sort(comparator);

        // ページネーション
        int pageSize = 10;
        int totalCount = students.size();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        if (totalPages == 0) totalPages = 1;

        String pageStr = request.getParameter("page");
        int currentPage = 1;
        if (pageStr != null && !pageStr.isEmpty()) {
            try { currentPage = Integer.parseInt(pageStr); } catch (NumberFormatException e) {}
        }
        if (currentPage < 1) currentPage = 1;
        if (currentPage > totalPages) currentPage = totalPages;

        int fromIndex = (currentPage - 1) * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, totalCount);
        List<Student> pagedStudents = students.subList(fromIndex, toIndex);

        // リクエストスコープへ格納
        request.setAttribute("f1", entYear);
        request.setAttribute("f2", classNum);
        request.setAttribute("f3", isAttendStr);

        request.setAttribute("students", pagedStudents);
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("sortBy", sortBy);
        request.setAttribute("sortDir", sortDir);
        request.setAttribute("class_num_set", list);
        request.setAttribute("ent_year_set", entYearSet);

        // JSPへフォワード
        request.getRequestDispatcher("student_list.jsp")
               .forward(request, response);
    }
}