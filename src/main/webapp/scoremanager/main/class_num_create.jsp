<!-- 追加部分「クラス管理」 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">
    <c:param name="title">得点管理システム</c:param>

    <c:param name="content">
        <section>
            <h2 class="page-title">クラス登録</h2>
            <div style="max-width:400px;">
                <form action="ClassNumCreateExecute.action" method="post">

                    <div class="form-group">
                        <label>クラス番号</label>
                        <input type="text" name="class_num" required placeholder="クラス番号を入力してください" />
                    </div>

                    <div style="display:flex; gap:12px; margin-top:24px;">
                        <button class="btn-primary">
                            <i class="fa-solid fa-check" style="margin-right:6px;"></i>登録
                        </button>
                        <a href="ClassList.action" class="btn-secondary" style="display:inline-block;">
                            <i class="fa-solid fa-arrow-left" style="margin-right:6px;"></i>戻る
                        </a>
                    </div>

                </form>
            </div>
        </section>
    </c:param>
</c:import>
