<%-- 追加修正20260515 --%>

<%-- 科目削除JSP --%>
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

    <c:param name="title">得点管理システム</c:param>

    <c:param name="content">

        <section>

            <h2 class="page-title">科目情報削除</h2>

            <div style="max-width:480px;">

                <%-- 使用中エラー表示 --%>
                <c:if test="${not empty error}">

                    <div style="background:rgba(249,89,132,0.12);
                                border:1px solid rgba(249,89,132,0.25);
                                color:#f95984;
                                padding:12px 16px;
                                border-radius:10px;
                                margin-bottom:20px;
                                font-size:14px;">

                        <i class="fa-solid fa-circle-exclamation"
                           style="margin-right:8px;"></i>

                        ${error}

                    </div>

                </c:if>

                <%-- 削除確認メッセージ --%>
                <div class="msg-danger"
                     style="margin-bottom:20px;
                            padding:15px;
                            background:rgba(249,89,132,0.1);
                            border-radius:4px;
                            color:#f95984;">

                    <i class="fa-solid fa-triangle-exclamation"></i>

                    以下の科目を削除します。よろしいですか？

                </div>

                <%-- 削除フォーム --%>
                <form action="SubjectDeleteExecute.action"
                      method="post">

                    <%-- 科目コード(hidden) --%>
                    <input type="hidden"
                           name="cd"
                           value="${subject.cd}" />

                    <%-- 科目コード表示 --%>
                    <div class="form-group">

                        <label>科目コード</label>

                        <p style="padding:10px;
                                  background:rgba(255,255,255,0.05);
                                  border-radius:4px;">

                            ${subject.cd}

                        </p>

                    </div>

                    <%-- 科目名表示 --%>
                    <div class="form-group">

                        <label>科目名</label>

                        <p style="padding:10px;
                                  background:rgba(255,255,255,0.05);
                                  border-radius:4px;">

                            ${subject.name}

                        </p>

                    </div>

                    <%-- ボタンエリア --%>
                    <div style="display:flex;
                                align-items:center;
                                gap:12px;
                                margin-top:24px;">

                        <%-- 削除ボタン --%>
                        <button type="submit"
                                class="btn-primary"
                                style="background-color:#f95984;
                                       border-color:#f95984;
                                       color:#ffffff;
                                       min-width:100px;">

                            <i class="fa-solid fa-trash-can"
                               style="margin-right:6px;"></i>

                            削除

                        </button>

                        <%-- 戻るリンク --%>
                        <a href="SubjectList.action"
                           class="btn-secondary">

                            <i class="fa-solid fa-arrow-left"
                               style="margin-right:6px;"></i>

                            戻る

                        </a>

                    </div>

                </form>

            </div>

        </section>

    </c:param>

</c:import>