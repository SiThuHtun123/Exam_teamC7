<%-- 成績登録JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">
    <c:param name="title">得点管理システム</c:param>
    <c:param name="scripts"></c:param>

    <c:param name="content">
        <section>
            <h2 class="page-title">成績登録</h2>

            <%-- エラーメッセージ --%>
            <c:if test="${not empty errors}">
                <div style="background:rgba(249,89,132,0.08); border:1px solid rgba(249,89,132,0.25); border-radius:10px; padding:12px 16px; margin-bottom:20px; color:#f95984; font-size:14px;">
                    <i class="fa-solid fa-circle-exclamation" style="margin-right:8px;"></i>
                    <c:forEach var="error" items="${errors}">
                        ${error.value}
                    </c:forEach>
                </div>
            </c:if>

            <%-- 絞込みフォーム --%>
            <form method="get" action="TestRegist.action">
                <div style="background:rgba(255,255,255,0.02); border:1px solid rgba(255,255,255,0.07); border-radius:12px; padding:16px 20px; margin-bottom:20px; display:flex; align-items:flex-end; gap:16px;">

                    <%-- 入学年度 --%>
                    <div style="flex:1;">
                        <label for="f1-select">入学年度</label>
                        <select id="f1-select" name="f1">
                            <option value="0">--------</option>
                            <c:forEach var="year" items="${ent_year_set}">
                                <option value="${year}" <c:if test="${year == f1}">selected</c:if>>${year}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <%-- クラス --%>
                    <div style="flex:1;">
                        <label for="f2-select">クラス</label>
                        <select id="f2-select" name="f2">
                            <option value="0">--------</option>
                            <c:forEach var="num" items="${class_num_set}">
                                <option value="${num}" <c:if test="${num == f2}">selected</c:if>>${num}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <%-- 科目 --%>
                    <div style="flex:1;">
                        <label for="f3-select">科目</label>
                        <select id="f3-select" name="f3">
                            <option value="0">--------</option>
                            <c:forEach var="subject" items="${subject_set}">
                                <option value="${subject.cd}" <c:if test="${subject.cd == f3}">selected</c:if>>${subject.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <%-- 絞込みボタン --%>
                    <div>
                        <button type="submit" class="btn-secondary">
                            <i class="fa-solid fa-filter" style="margin-right:6px;"></i>絞込み
                        </button>
                    </div>
                </div>
            </form>

            <%-- 成績入力フォーム --%>
            <c:if test="${not empty testList}">
                <form method="post" action="TestRegistExecute.action">

                    <%-- subject と class_num を hidden で送る --%>
                    <input type="hidden" name="subject" value="${f3}" />
                    <input type="hidden" name="class_num" value="${f2}" />

                    <div style="font-size:13px; margin-bottom:12px;">
                        <span style="color:rgba(255,255,255,0.45);">検索結果：</span>
                        <span style="color:#60a5fa; font-weight:600;">${testList.size()}件</span>
                    </div>

                    <div style="background:rgba(255,255,255,0.02); border:1px solid rgba(255,255,255,0.07); border-radius:12px; overflow:hidden; margin-bottom:20px;">
                        <table>
                            <tr>
                                <th>学生番号</th>
                                <th>クラス</th>
                                <th>テスト番号</th>
                                <th>得点</th>
                            </tr>
                            <c:forEach var="test" items="${testList}">
                                <tr>
                                    <td>${test.studentNo}</td>
                                    <td>${test.classNum}</td>
                                    <td>
                                        <%-- no を hidden で送る --%>
                                        <input type="hidden" name="student_id" value="${test.studentNo}" />
                                        <input type="hidden" name="no" value="${test.no}" />
                                        ${test.no}
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            name="score"
                                            value="${test.point}"
                                            style="width:80px; text-align:center;"
                                            placeholder="0〜100"
                                        />
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <%-- 登録ボタン --%>
                    <div style="text-align:right;">
                        <button type="submit" class="btn-primary">
                            <i class="fa-solid fa-floppy-disk" style="margin-right:6px;"></i>登録
                        </button>
                    </div>

                </form>
            </c:if>

            <%-- 検索結果なし --%>
            <c:if test="${empty testList and not empty f1 and f1 != 0}">
                <div style="color:rgba(255,255,255,0.45); font-size:14px; padding:20px 0;">
                    <i class="fa-solid fa-inbox" style="margin-right:8px;"></i>
                    該当する成績情報が存在しませんでした。
                </div>
            </c:if>

        </section>
    </c:param>
</c:import>
