<%-- 追加コード「学生別成績一覧」 --%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">
    <c:param name="title" value="成績一覧（学生）" />

    <c:param name="content">

        <h2>成績一覧（学生）</h2>

        <!-- 🔽 検索フォーム -->
        <form action="TestList.action" method="get">

            <div>
                <h3>科目情報</h3>

                入学年度：
                <input type="text" name="f1">

                クラス：
                <input type="text" name="f2">

                科目：
                <input type="text" name="f3">
            </div>

            <br>

            <div>
                <h3>学生情報</h3>

                学生番号：
                <input type="text" name="studentNo">
            </div>

            <br>

            <input type="submit" value="検索">

        </form>

        <hr>

        <!-- 🔽 検索結果 -->
        <c:if test="${not empty list}">

            <table border="1">
                <tr>
                    <th>学生番号</th>
                    <th>氏名</th>
                    <th>クラス</th>
                    <th>入学年度</th>
                    <th>科目コード</th>
                    <th>回数</th>
                    <th>得点</th>
                </tr>

                <c:forEach var="item" items="${list}">
                    <tr>
                        <td>${item.studentNo}</td>
                        <td>${item.studentName}</td>
                        <td>${item.classNum}</td>
                        <td>${item.entYear}</td>
                        <td>${item.subjectCd}</td>
                        <td>${item.no}</td>
                        <td>${item.point}</td>
                    </tr>
                </c:forEach>

            </table>

        </c:if>

        <c:if test="${empty list}">
            <p>※検索条件を入力してください</p>
        </c:if>

    </c:param>
</c:import>