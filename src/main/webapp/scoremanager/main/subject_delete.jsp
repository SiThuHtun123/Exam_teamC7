<%-- 科目削除JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">
    <c:param name="title">得点管理システム</c:param>

    <c:param name="content">
        <section>
            <h2 class="page-title">科目情報削除</h2>
            <div style="max-width:480px;">
                <div class="msg-danger" style="margin-bottom:20px; padding:15px; background: rgba(249,89,132,0.1); border-radius:4px; color:#f95984;">
                    <i class="fa-solid fa-triangle-exclamation"></i> 以下の科目を削除します。よろしいですか？
                </div>

                <form action="SubjectDeleteExecute.action" method="post">

                    <input type="hidden" name="cd" value="${subject.cd}" />

                    <div class="form-group">
                        <label>科目コード</label>
                        <p style="padding: 10px; background: rgba(255,255,255,0.05); border-radius: 4px;">${subject.cd}</p>
                    </div>

                    <div class="form-group">
                        <label>科目名</label>
                        <p style="padding: 10px; background: rgba(255,255,255,0.05); border-radius: 4px;">${subject.name}</p>
                    </div>

                    <div style="display:flex; align-items:center; gap:12px; margin-top:24px;">
					    <button type="submit" class="btn-primary" 
					            style="background-color: #f95984; border-color: #f95984; color: #ffffff; min-width: 100px;">
					        <i class="fa-solid fa-trash-can" style="margin-right:6px;"></i>削除
					    </button>
                        <%-- 戻るリンク --%>
                        <a href="SubjectList.action" class="btn-secondary">
                            <i class="fa-solid fa-arrow-left" style="margin-right:6px;"></i>戻る
                        </a>
                    </div>
                </form>
            </div>
        </section>
    </c:param>
</c:import>