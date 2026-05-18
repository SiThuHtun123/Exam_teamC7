<!-- 追加修正20260515 -->

<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

    <c:param name="title">
        学生CSV登録
    </c:param>

    <c:param name="content">

        <section>

            <h2 class="page-title">
                学生CSV一括登録
            </h2>

            <div style="max-width:600px;">

                <%-- 完了メッセージ --%>
                <c:if test="${not empty message}">

                    <div style="background:rgba(52,211,153,0.12);
                                border:1px solid rgba(52,211,153,0.25);
                                color:#34d399;
                                padding:12px 16px;
                                border-radius:10px;
                                margin-bottom:20px;">

                        ${message}

                    </div>

                </c:if>

                <%-- エラー表示 --%>
                <c:if test="${not empty error}">

                    <div style="background:rgba(249,89,132,0.12);
                                border:1px solid rgba(249,89,132,0.25);
                                color:#f95984;
                                padding:12px 16px;
                                border-radius:10px;
                                margin-bottom:20px;">

                        ${error}

                    </div>

                </c:if>

                <form action="StudentCsvUpload.action"
                      method="post"
                      enctype="multipart/form-data">

                    <div class="form-group">

                        <label>
                            CSVファイル
                        </label>

                        <input type="file"
                               name="csv_file"
                               accept=".csv"
                               required />

                    </div>

                    <div style="margin-top:24px;">

                        <button type="submit"
                                class="btn-primary">

                            <i class="fa-solid fa-file-csv"
                               style="margin-right:6px;"></i>

                            CSV登録

                        </button>

                    </div>

                </form>

                <%-- CSVサンプル --%>
                <div style="margin-top:32px;">

                    <h3 style="font-size:16px;">
                        CSV形式
                    </h3>

                    <pre style="background:rgba(255,255,255,0.04);
                                padding:16px;
                                border-radius:8px;
                                overflow:auto;">入学年度,学生番号,氏名,クラス番号
2024,S001,山田太郎,101
2024,S002,佐藤花子,101</pre>

                </div>

            </div>

        </section>

    </c:param>

</c:import>