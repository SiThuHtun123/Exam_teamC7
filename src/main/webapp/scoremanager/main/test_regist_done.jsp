<%-- 成績登録完了JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">
    <c:param name="title">得点管理システム</c:param>
    <c:param name="scripts"></c:param>

    <c:param name="content">
        <section>
            <h2 class="page-title">成績登録</h2>

            <%-- 完了メッセージ --%>
            <div style="background:rgba(52,211,153,0.08); border:1px solid rgba(52,211,153,0.25); border-radius:12px; padding:24px; margin-bottom:24px; display:flex; align-items:center; gap:16px;">
                <div style="width:44px; height:44px; background:rgba(52,211,153,0.1); border:1px solid rgba(52,211,153,0.25); border-radius:10px; display:flex; align-items:center; justify-content:center; flex-shrink:0;">
                    <i class="fa-solid fa-check" style="color:#34d399; font-size:20px;"></i>
                </div>
                <div>
                    <div style="color:#34d399; font-weight:600; font-size:16px; margin-bottom:4px;">登録が完了しました</div>
                    <div style="color:rgba(255,255,255,0.45); font-size:14px;">成績情報が正常に保存されました。</div>
                </div>
            </div>

            <%-- ボタン --%>
            <div style="display:flex; gap:12px;">
                <a href="TestRegist.action" class="btn-primary" style="display:inline-block;">
                    <i class="fa-solid fa-plus" style="margin-right:6px;"></i>続けて登録
                </a>
                <a href="Menu.action" style="display:inline-block; background:rgba(255,255,255,0.02); border:1px solid rgba(255,255,255,0.07); border-radius:10px; padding:10px 20px; font-size:14px; color:rgba(255,255,255,0.55); transition:color 0.2s ease, border-color 0.2s ease; text-decoration:none;"
                   onmouseover="this.style.color='#ffffff'; this.style.borderColor='rgba(255,255,255,0.2)';"
                   onmouseout="this.style.color='rgba(255,255,255,0.55)'; this.style.borderColor='rgba(255,255,255,0.07)';">
                    <i class="fa-solid fa-house" style="margin-right:6px;"></i>メニューへ戻る
                </a>
            </div>

        </section>
    </c:param>
</c:import>
