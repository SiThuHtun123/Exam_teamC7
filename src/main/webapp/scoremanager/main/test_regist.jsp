<%-- 成績登録JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">
    <c:param name="title">得点管理システム</c:param>
    <c:param name="scripts"></c:param>

    <c:param name="content">
        <section>
            <h2 class="page-title">成績管理</h2>

            <%-- 絞込みフォーム --%>
            <form method="get" action="TestRegist.action">
                <div style="background:rgba(255,255,255,0.02); border:1px solid rgba(255,255,255,0.07); border-radius:12px; padding:16px 20px; margin-bottom:20px; display:flex; align-items:flex-end; gap:16px;">

                    <%-- 入学年度セレクトボックス --%>
                    <div style="flex:1;">
                        <label for="f1-select">入学年度</label>
                        <select id="f1-select" name="f1">
                            <option value="0">--------</option>
                            <c:forEach var="year" items="${ent_year_set}">
                                <option value="${year}" <c:if test="${year == f1}">selected</c:if>>${year}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <%-- クラスセレクトボックス --%>
                    <div style="flex:1;">
                        <label for="f2-select">クラス</label>
                        <select id="f2-select" name="f2">
                            <option value="0">--------</option>
                            <c:forEach var="num" items="${class_num_set}">
                                <option value="${num}" <c:if test="${num == f2}">selected</c:if>>${num}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <%-- 科目セレクトボックス --%>
                    <div style="flex:1;">
                        <label for="f3-select">科目</label>
                        <select id="f3-select" name="f3">
                            <option value="0">--------</option>
                            <c:forEach var="subject" items="${subject_set}">
                                <option value="${subject.cd}" <c:if test="${subject.cd == f3}">selected</c:if>>${subject.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <%-- 回目セレクトボックス --%>
                    <div style="flex:1;">
                        <label for="f4-select">回数</label>
                        <select id="f4-select" name="f4">
                            <option value="0">--------</option>
                            <c:forEach var="no" items="${no_set}">
                                <option value="${no}" <c:if test="${no == f4}">selected</c:if>>${no}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <%-- 検索ボタン --%>
                    <div>
                        <button type="submit" class="btn-secondary">
                            <i class="fa-solid fa-magnifying-glass" style="margin-right:6px;"></i>検索
                        </button>
                    </div>

                </div>
            </form>

            <%-- 成績入力フォーム（検索後に表示） --%>
            <c:if test="${not empty testList}">
                <form method="post" action="TestRegistExecute.action">

                    <%-- 科目・クラス・回数をhiddenで送信 --%>
                    <input type="hidden" name="subject"   value="${f3}" />
                    <input type="hidden" name="class_num" value="${f2}" />
                    <input type="hidden" name="count"     value="${f4}" />

                    <%-- 科目名と回数を表示する --%>
                    <div style="font-size:14px; margin-bottom:12px; color:rgba(255,255,255,0.7);">
                        科目：<c:forEach var="subject" items="${subject_set}">
                            <c:if test="${subject.cd == f3}">${subject.name}</c:if>
                        </c:forEach>（${f4}回）
                    </div>

                    <%-- 成績一覧テーブル --%>
                    <div style="background:rgba(255,255,255,0.02); border:1px solid rgba(255,255,255,0.07); border-radius:12px; overflow:hidden; margin-bottom:20px;">
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
                                    <%-- クラス番号 --%>
                                    <td>${test.classNum}</td>
                                    <%-- 学生番号をhiddenで送信し、画面にも表示する --%>
                                    <td>
                                        <input type="hidden" name="regist" value="${test.studentNo}" />
                                        ${test.studentNo}
                                    </td>
                                    <%-- 氏名 --%>
                                    <td>${test.studentName}</td>
                                    <%-- 点数入力フィールド --%>
                                    <%-- 得点が-1の場合は未入力（空欄）として表示する --%>
                                    <td>
                                        <input
                                            type="text"
                                            name="point_${test.studentNo}"
                                            value="${test.point == -1 ? '' : test.point}"
                                            style="width:80px; text-align:center;"
                                            placeholder="0〜100"
                                        />
                                        <%-- 該当学生のエラーメッセージをインラインで表示する --%>
                                        <c:if test="${not empty errors[test.studentNo]}">
                                            <div style="color:#f95984; font-size:12px; margin-top:4px;">
                                                ${errors[test.studentNo]}
                                            </div>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <%-- 登録して終了ボタン --%>
                    <div>
                        <button type="submit" class="btn-primary">
                            <i class="fa-solid fa-floppy-disk" style="margin-right:6px;"></i>登録して終了
                        </button>
                    </div>

                </form>
            </c:if>

            <%-- 検索結果なし --%>
            <c:if test="${empty testList and f1 != 0}">
                <div style="color:rgba(255,255,255,0.45); font-size:14px; padding:20px 0;">
                    <i class="fa-solid fa-inbox" style="margin-right:8px;"></i>
                    該当する成績情報が存在しませんでした。
                </div>
            </c:if>

        </section>
    </c:param>
</c:import>
