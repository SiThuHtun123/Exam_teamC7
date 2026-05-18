<%-- 追加修正20260515 --%>

<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

<c:param name="title">

クラス登録

</c:param>

<c:param name="content">

<section>

<h2 class="page-title">

クラス登録

</h2>

<div style="max-width:480px;">

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

<form action="ClassCreateExecute.action"
      method="post">

<div class="form-group">

<label>

クラス番号

</label>

<input type="text"
       name="class_num"
       maxlength="10"
       required />

</div>

<div style="margin-top:24px;">

<button type="submit"
        class="btn-primary">

<i class="fa-solid fa-floppy-disk"
   style="margin-right:6px;"></i>

登録

</button>

</div>

</form>

</div>

</section>

</c:param>

</c:import>