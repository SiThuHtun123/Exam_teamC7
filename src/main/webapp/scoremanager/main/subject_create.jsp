<%-- 科目登録JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">
    <c:param name="title">
        得点管理システム
    </c:param>

    <c:param name="content">
        <section class="me-4">
            <h2 class="h3 mb-3 fw-norma bg-secondary bg-opacity-10 py-2 px-4">科目登録</h2>

            <c:if test="${not empty error}">
                <div class="alert alert-danger mx-4">${error}</div>
            </c:if>

            <div class="container-fluid px-4">
                <form action="SubjectCreateExecute.action" method="post" class="mt-4">

                    <%-- 科目コード入力 --%>
                    <div class="mb-3 w-50">
                        <label class="form-label">科目コード</label>
                        <input class="form-control" type="text" id="cd" name="cd" value="${no }" required maxlength="10" placeholder="科目コードを入力してください" />
                    </div>

                    <%-- 科目名入力 --%>
                    <div class="mb-3 w-50">
                        <label class="form-label">科目名</label>
                        <input class="form-control" type="text" id="name" name="name" value="${no }" required maxlength="10" placeholder="科目名を入力してください" />
                    </div>

                    <%-- 登録、戻る --%>
                    <div class="mt-4">
                        <button type="submit" class="btn btn-primary">登録して終了</button>
                        <a href="StudentList.action" class="ms-3">戻る</a>
                    </div>
                </form>
            </div>
        </section>
    </c:param>
</c:import>