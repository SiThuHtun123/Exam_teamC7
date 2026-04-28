<%-- 成績登録完了JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">
    <c:param name="title">得点管理システム</c:param>
    <c:param name="scripts"></c:param>

    <c:param name="content">
        <section>
            <%-- 画面タイトル --%>
            <h2 class="page-title">成績管理</h2>

            <%-- 登録完了メッセージ --%>
            <p style="background:rgba(52,211,153,0.08); border:1px solid rgba(52,211,153,0.25); border-radius:12px; padding:16px 20px; margin-bottom:24px; color:#34d399; font-size:15px;">
                <i class="fa-solid fa-check" style="margin-right:8px;"></i>
                登録が完了しました
            </p>

            <%-- ナビゲーションリンク --%>
            <div style="display:flex; gap:20px;">

                <%-- 戻るリンク：成績管理一覧画面に遷移する --%>
                <a href="TestRegist.action"
                   style="font-size:14px; color:rgba(255,255,255,0.55); text-decoration:none; transition:color 0.2s ease;"
                   onmouseover="this.style.color='#ffffff';"
                   onmouseout="this.style.color='rgba(255,255,255,0.55)';">
                    <i class="fa-solid fa-arrow-left" style="margin-right:6px;"></i>戻る
                </a>

                <%-- 成績参照リンク：成績参照検索画面に遷移する --%>
                <a href="TestList.action"
                   style="font-size:14px; color:rgba(255,255,255,0.55); text-decoration:none; transition:color 0.2s ease;"
                   onmouseover="this.style.color='#60a5fa';"
                   onmouseout="this.style.color='rgba(255,255,255,0.55)';">
                    <i class="fa-solid fa-list" style="margin-right:6px;"></i>成績参照
                </a>

            </div>
        </section>
    </c:param>
</c:import>
