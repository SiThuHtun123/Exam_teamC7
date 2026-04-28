<%-- 追加コード「学生別成績一覧」 --%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:set var="pageContent">

    <h2 class="page-title">成績参照</h2>

    <c:if test="${not empty list}">
        <table>
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
        <div class="msg-error">
            データがありません。
        </div>
    </c:if>

</c:set>

<c:import url="/common/base.jsp">
    <c:param name="title" value="成績参照" />
    <c:param name="content" value="${pageContent}" />
</c:import>