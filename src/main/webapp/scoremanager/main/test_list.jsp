<%-- 成績参照JSP --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">
    <c:param name="title">得点管理システム</c:param>

    <c:param name="content">
        <section>
            <h2 class="page-title">成績参照</h2>

            <!-- 科目情報検索フォーム -->
            <form action="TestList.action" method="get">
                <input type="hidden" name="searchType" value="subject" />
                <div style="background:var(--color-bg-surface); border:1px solid var(--color-border); border-radius:12px; padding:16px 20px; margin-bottom:12px;">
                    <div style="font-size:13px; font-weight:600; color:#60a5fa; margin-bottom:12px;">科目情報</div>
                    <div style="display:flex; align-items:flex-end; gap:16px; flex-wrap:wrap;">

                        <div style="flex:1; min-width:120px;">
                            <label>入学年度</label>
                            <select name="f1">
                                <option value="">----</option>
                                <c:forEach var="year" items="${ent_year_set}">
                                    <option value="${year}" <c:if test="${year == f1 && 'subject' == searchType}">selected</c:if>>${year}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div style="flex:1; min-width:120px;">
                            <label>クラス</label>
                            <select name="f2">
                                <option value="">----</option>
                                <c:forEach var="num" items="${class_num_set}">
                                    <option value="${num}" <c:if test="${num == f2 && 'subject' == searchType}">selected</c:if>>${num}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div style="flex:2; min-width:160px;">
                            <label>科目</label>
                            <select name="f3">
                                <option value="">--------</option>
                                <c:forEach var="subject" items="${subject_set}">
                                    <option value="${subject.cd}" <c:if test="${subject.cd == f3 && 'subject' == searchType}">selected</c:if>>${subject.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div>
                            <button class="btn-secondary">
                                <i class="fa-solid fa-magnifying-glass" style="margin-right:6px;"></i>検索
                            </button>
                        </div>

                    </div>
                </div>
            </form>

            <!-- 学生情報検索フォーム -->
            <form action="TestList.action" method="get">
                <input type="hidden" name="searchType" value="student" />
                <div style="background:var(--color-bg-surface); border:1px solid var(--color-border); border-radius:12px; padding:16px 20px; margin-bottom:20px;">
                    <div style="font-size:13px; font-weight:600; color:#a78bfa; margin-bottom:12px;">学生情報</div>
                    <div style="display:flex; align-items:flex-end; gap:16px;">

                        <div style="flex:1; max-width:300px;">
                            <label>学生番号</label>
                            <input type="text" name="studentNo" value="${'student' == searchType ? studentNo : ''}" placeholder="学生番号を入力してください" />
                        </div>

                        <div>
                            <button class="btn-secondary">
                                <i class="fa-solid fa-magnifying-glass" style="margin-right:6px;"></i>検索
                            </button>
                        </div>

                    </div>
                </div>
            </form>

            <!-- 科目情報検索結果 -->
            <c:if test="${'subject' == searchType}">

                <c:if test="${not empty selectedSubject}">
                    <div style="font-size:13px; color:var(--color-text-4); margin-bottom:8px;">
                        科目：<span style="color:#60a5fa; font-weight:600;">${selectedSubject.name}</span>
                    </div>
                </c:if>

                <!-- メッセージ表示 -->
                <c:if test="${not empty message}">
                    <div style="color:var(--color-text-4); font-size:14px; padding:20px 0;">
                        ${message}
                    </div>
                </c:if>

                <c:if test="${empty message}">
                    <c:choose>

                        <c:when test="${not empty subjectTests}">
                            <div style="font-size:13px; margin-bottom:12px;">
                                <span style="color:var(--color-text-4);">検索結果：</span>
                                <span style="color:#34d399; font-weight:600;">${subjectTests.size()}件</span>
                            </div>

                            <div style="background:var(--color-bg-surface); border:1px solid var(--color-border); border-radius:12px; overflow:hidden;">
                                <table>
                                    <tr>
                                        <th>入学年度</th>
                                        <th>クラス</th>
                                        <th>学生番号</th>
                                        <th>氏名</th>
                                        <th>回数</th>
                                        <th>得点</th>
                                    </tr>

                                    <c:forEach var="item" items="${subjectTests}">
                                        <tr>
                                            <td>${item.entYear}</td>
                                            <td>${item.classNum}</td>
                                            <td>${item.studentNo}</td>
                                            <td>${item.studentName}</td>
                                            <td>${item.no}</td>
                                            <td style="color:#34d399; font-weight:600;">${item.point}</td>
                                        </tr>
                                    </c:forEach>

                                </table>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <div style="color:var(--color-text-4); font-size:14px; padding:20px 0;">
                                該当する成績情報が存在しませんでした。
                            </div>
                        </c:otherwise>

                    </c:choose>
                </c:if>

            </c:if>

            <!-- 学生情報検索結果 -->
            <c:if test="${'student' == searchType}">

                <c:if test="${not empty selectedStudent}">
                    <div style="font-size:13px; color:var(--color-text-4); margin-bottom:8px;">
                        氏名：<span style="color:#a78bfa; font-weight:600;">${selectedStudent.name} (${studentNo})</span>
                    </div>
                </c:if>

                <c:choose>

                    <c:when test="${not empty studentTests}">
                        <div style="font-size:13px; margin-bottom:12px;">
                            <span style="color:var(--color-text-4);">検索結果：</span>
                            <span style="color:#34d399; font-weight:600;">${studentTests.size()}件</span>
                        </div>

                        <div style="background:var(--color-bg-surface); border:1px solid var(--color-border); border-radius:12px; overflow:hidden;">
                            <table>
                                <tr>
                                    <th>科目名</th>
                                    <th>科目コード</th>
                                    <th>回数</th>
                                    <th>点数</th>
                                </tr>

                                <c:forEach var="item" items="${studentTests}">
                                    <tr>
                                        <td>${item.subjectName}</td>
                                        <td>${item.subjectCd}</td>
                                        <td>${item.no}</td>
                                        <td style="color:#34d399; font-weight:600;">${item.point}</td>
                                    </tr>
                                </c:forEach>

                            </table>
                        </div>
                    </c:when>

                    <c:otherwise>
                        <div style="color:var(--color-text-4); font-size:14px; padding:20px 0;">
                            該当する成績情報が存在しませんでした。
                        </div>
                    </c:otherwise>

                </c:choose>

            </c:if>

            <!-- 初期表示メッセージ -->
            <c:if test="${empty searchType}">
                <div style="color:var(--color-text-4); font-size:13px; padding:12px 0;">
                    <i class="fa-solid fa-circle-info" style="margin-right:6px; color:#60a5fa;"></i>
                    科目情報を選択または学生情報を入力して検索ボタンをクリックしてください
                </div>
            </c:if>

        </section>
    </c:param>
</c:import>