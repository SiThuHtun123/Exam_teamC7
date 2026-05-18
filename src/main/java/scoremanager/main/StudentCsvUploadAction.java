package scoremanager.main;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import bean.School;
import bean.Student;
import bean.Teacher;
import dao.StudentDao;
import dao.TeacherDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import tool.Action;

public class StudentCsvUploadAction extends Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");

        if (teacher == null) {
            request.getRequestDispatcher("/scoremanager/login.jsp").forward(request, response);
            return;
        }

        if (teacher.getSchool() == null || teacher.getSchool().getCd() == null) {
            TeacherDao teacherDao = new TeacherDao();
            teacher = teacherDao.get(teacher.getId());
            session.setAttribute("user", teacher);
        }

        School school = teacher.getSchool();

        Part filePart = request.getPart("csvFile");

        if (filePart == null || filePart.getSize() == 0) {
            request.setAttribute("csvMessage", "CSVファイルを選択してください");
            request.setAttribute("csvSuccess", false);
            request.getRequestDispatcher("/scoremanager/main/StudentCreate.action").forward(request, response);
            return;
        }

        StudentDao studentDao = new StudentDao();
        int successCount = 0;
        int errorCount = 0;

        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(filePart.getInputStream(), "UTF-8"))) {

            String line;
            boolean firstLine = true;

            while ((line = reader.readLine()) != null) {
                // BOMを除去
                if (firstLine) {
                    line = line.replace("﻿", "");
                    firstLine = false;
                    // ヘッダー行をスキップ
                    continue;
                }

                if (line.trim().isEmpty()) continue;

                String[] cols = line.split(",");
                if (cols.length < 5) {
                    errorCount++;
                    continue;
                }

                try {
                    Student student = new Student();
                    student.setNo(cols[0].trim());
                    student.setName(cols[1].trim());
                    student.setEntYear(Integer.parseInt(cols[2].trim()));
                    student.setClassNum(cols[3].trim());
                    student.setAttend(Boolean.parseBoolean(cols[4].trim()));
                    student.setSchool(school);

                    studentDao.save(student);
                    successCount++;
                } catch (Exception e) {
                    errorCount++;
                }
            }
        }

        if (errorCount == 0) {
            request.setAttribute("csvMessage", successCount + "件の学生情報を登録しました");
            request.setAttribute("csvSuccess", true);
        } else {
            request.setAttribute("csvMessage", successCount + "件登録完了、" + errorCount + "件エラー");
            request.setAttribute("csvSuccess", false);
        }

        request.getRequestDispatcher("/scoremanager/main/StudentCreate.action").forward(request, response);
    }
}
