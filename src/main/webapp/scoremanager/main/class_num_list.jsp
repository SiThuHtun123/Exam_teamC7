<!-- 追加部分「クラス管理」 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">
    <c:param name="title">得点管理システム</c:param>
    <c:param name="scripts"></c:param>

    <c:param name="content">
        <section>
            <h2 class="page-title">クラス管理</h2>

            <div style="text-align:right; margin-bottom:16px;">
                <a href="ClassNumCreate.action" class="btn-primary" style="display:inline-block;">
                    <i class="fa-solid fa-plus" style="margin-right:6px;"></i>新規登録
                </a>
            </div>

            <!-- 一覧 -->
            <c:choose>
                <c:when test="${class_num_set.size() > 0}">
                    <div style="font-size:13px; margin-bottom:12px;">
                        <span style="color:rgba(255,255,255,0.45);">クラス数：</span>
                        <span style="color:#34d399; font-weight:600;">${class_num_set.size()}件</span>
                    </div>
                    <div style="background:rgba(255,255,255,0.02); border:1px solid rgba(255,255,255,0.07); border-radius:12px; overflow:hidden; max-width:400px;">
                        <table>
                            <tr>
                                <th>クラス番号</th>
                                <th></th>
                            </tr>
                            <c:forEach var="num" items="${class_num_set}">
                                <tr>
                                    <td style="color:#a78bfa; font-weight:500;">${num}</td>
                                    <td style="text-align:right;">
                                        <a href="ClassNumDelete.action?class_num=${num}"
                                           style="font-size:13px; color:rgba(255,255,255,0.45); border:1px solid rgba(255,255,255,0.1); padding:4px 12px; border-radius:8px; transition:color 0.2s ease, border-color 0.2s ease;"
                                           onmouseover="this.style.color='#f95984'; this.style.borderColor='rgba(249,89,132,0.25)';"
                                           onmouseout="this.style.color='rgba(255,255,255,0.45)'; this.style.borderColor='rgba(255,255,255,0.1)';">
                                            <i class="fa-solid fa-trash" style="margin-right:4px;"></i>削除
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <div style="color:rgba(255,255,255,0.45); font-size:14px; padding:20px 0;">
                        クラス情報が存在しませんでした。
                    </div>
                </c:otherwise>
            </c:choose>

        </section>
    </c:param>
</c:import>
