<%-- 追加修正20260515 --%>

<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

<c:param name="title">

クラス削除

</c:param>

<c:param name="content">

<section>

<h2 class="page-title">

クラス削除

</h2>

<div style="max-width:480px;">

<c:if test="${not empty error}">

	<div style="
		margin-bottom:20px;
		padding:15px;
		background:rgba(249,89,132,0.12);
		border:1px solid rgba(249,89,132,0.25);
		border-radius:8px;
		color:#f95984;
	">

		<i class="fa-solid fa-circle-exclamation"
		   style="margin-right:6px;"></i>

		${error}

	</div>

</c:if>

<div class="msg-danger"
     style="margin-bottom:20px;
            padding:15px;
            background:rgba(249,89,132,0.1);
            border-radius:4px;
            color:#f95984;">

<i class="fa-solid fa-triangle-exclamation"></i>

以下のクラスを削除します。よろしいですか？

</div>

<form action="ClassDeleteExecute.action"
      method="post">

<input type="hidden"
       name="class_num"
       value="${class_num.class_num}" />

<div class="form-group">

<label>

クラス番号

</label>

<p style="padding:10px;
          background:rgba(255,255,255,0.05);
          border-radius:4px;">

${class_num.class_num}

</p>

</div>

<div style="display:flex;
            align-items:center;
            gap:12px;
            margin-top:24px;">

<button type="submit"
        class="btn-primary"
        style="background-color:#f95984;
               border-color:#f95984;
               color:#ffffff;">

<i class="fa-solid fa-trash-can"
   style="margin-right:6px;"></i>

削除

</button>

<a href="ClassList.action"
   class="btn-secondary">

戻る

</a>

</div>

</form>

</div>

</section>

</c:param>

</c:import>