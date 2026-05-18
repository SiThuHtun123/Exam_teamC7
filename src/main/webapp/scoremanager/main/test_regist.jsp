<%-- 追加修正20260515 --%>

<%-- 成績登録JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

    <c:param name="title">
        得点管理システム
    </c:param>

    <c:param name="scripts"></c:param>

    <c:param name="content">

        <section>

            <h2 class="page-title">成績管理</h2>

            <%-- 絞込みフォーム --%>
            <form method="get" action="TestRegist.action">

                <div style="
                    background:rgba(255,255,255,0.02);
                    border:1px solid rgba(255,255,255,0.07);
                    border-radius:12px;
                    padding:16px 20px;
                    margin-bottom:20px;
                    display:flex;
                    align-items:flex-end;
                    gap:16px;
                ">

                    <%-- 入学年度 --%>
                    <div style="flex:1;">

                        <label for="f1-select">入学年度</label>

                        <select id="f1-select" name="f1">

                            <option value="0">--------</option>

                            <c:forEach var="year" items="${ent_year_set}">

                                <option value="${year}"
                                    <c:if test="${year == f1}">
                                        selected
                                    </c:if>>

                                    ${year}

                                </option>

                            </c:forEach>

                        </select>

                    </div>

                    <%-- クラス --%>
                    <div style="flex:1;">

                        <label for="f2-select">クラス</label>

                        <select id="f2-select" name="f2">

                            <option value="0">--------</option>

                            <c:forEach var="num" items="${class_num_set}">

                                <option value="${num}"
                                    <c:if test="${num == f2}">
                                        selected
                                    </c:if>>

                                    ${num}

                                </option>

                            </c:forEach>

                        </select>

                    </div>

                    <%-- 科目 --%>
                    <div style="flex:1;">

                        <label for="f3-select">科目</label>

                        <select id="f3-select" name="f3">

                            <option value="0">--------</option>

                            <c:forEach var="subject" items="${subject_set}">

                                <option value="${subject.cd}"
                                    <c:if test="${subject.cd == f3}">
                                        selected
                                    </c:if>>

                                    ${subject.name}

                                </option>

                            </c:forEach>

                        </select>

                    </div>

                    <%-- 回数 --%>
                    <div style="flex:1;">

                        <label for="f4-select">回数</label>

                        <select id="f4-select" name="f4">

                            <option value="0">--------</option>

                            <c:forEach var="no" items="${no_set}">

                                <option value="${no}"
                                    <c:if test="${no == f4}">
                                        selected
                                    </c:if>>

                                    ${no}

                                </option>

                            </c:forEach>

                        </select>

                    </div>

                    <%-- 検索ボタン --%>
                    <div>

                        <button type="submit" class="btn-secondary">

                            <i class="fa-solid fa-magnifying-glass"
                               style="margin-right:6px;"></i>

                            検索

                        </button>

                    </div>

                </div>

            </form>

            <%-- 通常メッセージ表示 --%>
            <c:if test="${not empty message}">

                <div style="
                    color:#f95984;
                    font-size:14px;
                    padding:12px 0;
                ">

                    <i class="fa-solid fa-circle-exclamation"
                       style="margin-right:8px;"></i>

                    ${message}

                </div>

            </c:if>

            <%-- 成績入力フォーム --%>
            <c:if test="${not empty testList}">

                <form method="post" action="TestRegistExecute.action">

                    <%-- 重複登録エラー表示 --%>
                    <c:if test="${not empty errors['duplicate']}">

                        <div style="
                            background:rgba(249,89,132,0.12);
                            border:1px solid rgba(249,89,132,0.25);
                            color:#f95984;
                            padding:12px 16px;
                            border-radius:10px;
                            margin-bottom:16px;
                            font-size:14px;
                        ">

                            <i class="fa-solid fa-circle-exclamation"
                               style="margin-right:8px;"></i>

                            ${errors['duplicate']}

                        </div>

                    </c:if>

                    <%-- 入力エラー表示 --%>
                    <c:if test="${not empty errors['common']}">

                        <div style="
                            background:rgba(251,191,36,0.10);
                            border:1px solid rgba(251,191,36,0.25);
                            color:#fbbf24;
                            padding:12px 16px;
                            border-radius:10px;
                            margin-bottom:16px;
                            font-size:14px;
                        ">

                            <i class="fa-solid fa-triangle-exclamation"
                               style="margin-right:8px;"></i>

                            ${errors['common']}

                        </div>

                    </c:if>

                    <%-- hidden送信項目 --%>
                    <input type="hidden" name="subject" value="${f3}" />
                    <input type="hidden" name="class_num" value="${f2}" />
                    <input type="hidden" name="count" value="${f4}" />
                    <input type="hidden" name="ent_year" value="${f1}" />

                    <%-- 検索条件表示 --%>
                    <div style="
                        font-size:14px;
                        margin-bottom:12px;
                        color:rgba(255,255,255,0.7);
                    ">

                        科目：

                        <c:forEach var="subject" items="${subject_set}">

                            <c:if test="${subject.cd == f3}">

                                ${subject.name}

                            </c:if>

                        </c:forEach>

                        （${f4}回）

                    </div>

                    <%-- 在学中メッセージ --%>
                    <div style="
                        margin-bottom:14px;
                        font-size:13px;
                        color:#34d399;
                    ">

                        <i class="fa-solid fa-user-check"
                           style="margin-right:6px;"></i>

                        在学中の学生のみ表示しています

                    </div>

                    <%-- 成績一覧テーブル --%>
                    <div style="
                        background:rgba(255,255,255,0.02);
                        border:1px solid rgba(255,255,255,0.07);
                        border-radius:12px;
                        overflow:hidden;
                        margin-bottom:20px;
                    ">

                        <table>

                            <tr>

                                <th>入学年度</th>

                                <th>クラス</th>

                                <th>学生番号</th>

                                <th>氏名</th>

                                <th>点数</th>

                            </tr>

                            <c:forEach var="test" items="${testList}">

                                <tr>

                                    <%-- 入学年度 --%>
                                    <td>${test.entYear}</td>

                                    <%-- クラス --%>
                                    <td>${test.classNum}</td>

                                    <%-- 学生番号 --%>
                                    <td>

                                        <input
                                            type="hidden"
                                            name="regist"
                                            value="${test.studentNo}"
                                        />

                                        ${test.studentNo}

                                    </td>

                                    <%-- 氏名 --%>
                                    <td>${test.studentName}</td>

                                    <%-- 点数入力 --%>
                                    <td>

                                        <input
                                            type="text"
                                            name="point_${test.studentNo}"
                                            value="${test.point == -1 ? '' : test.point}"
                                            style="
                                                width:80px;
                                                text-align:center;
                                            "
                                            placeholder="0〜100"
                                            maxlength="3"
                                        />

                                        <%-- 学生別エラー表示 --%>
                                        <c:if test="${not empty errors[test.studentNo]}">

                                            <div style="
                                                color:#f95984;
                                                font-size:12px;
                                                margin-top:4px;
                                            ">

                                                ${errors[test.studentNo]}

                                            </div>

                                        </c:if>

                                    </td>

                                </tr>

                            </c:forEach>

                        </table>

                    </div>

                    <%-- 登録ボタン --%>
                    <div>

                        <button type="submit" class="btn-primary">

                            <i class="fa-solid fa-floppy-disk"
                               style="margin-right:6px;"></i>

                            登録して終了

                        </button>

                    </div>

                </form>

            </c:if>

            <%-- 検索結果なし --%>
            <c:if test="${empty testList and empty message and f1 != 0}">

                <div style="
                    color:rgba(255,255,255,0.45);
                    font-size:14px;
                    padding:20px 0;
                ">

                    <i class="fa-solid fa-inbox"
                       style="margin-right:8px;"></i>

                    条件に一致する在学中の学生が存在しませんでした。

                </div>

            </c:if>

        </section>

    </c:param>

</c:import>