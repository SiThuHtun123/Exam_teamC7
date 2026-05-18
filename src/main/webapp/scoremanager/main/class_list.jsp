<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

<c:param name="title">

クラス管理

</c:param>

<c:param name="content">

<section>

<h2 class="page-title">

クラス管理

</h2>

<div style="text-align:right;
            margin-bottom:16px;">

<a href="ClassCreate.action"
   class="btn-primary">

<i class="fa-solid fa-plus"
   style="margin-right:6px;"></i>

新規登録

</a>

</div>

<div style="background:rgba(255,255,255,0.02);
            border:1px solid rgba(255,255,255,0.07);
            border-radius:12px;
            overflow:hidden;">

<table>

<tr>

<th>
クラス番号
</th>

<th>
操作
</th>

</tr>

<c:forEach var="classNum"
           items="${class_list}">

<tr>

<td>

${classNum}

</td>

<td>

<a href="ClassDelete.action?class_num=${classNum}"
   style="font-size:13px;
          color:var(--color-text-4);
          border:1px solid var(--color-border);
          padding:4px 12px;
          border-radius:8px;">

削除

</a>

</td>

</tr>

</c:forEach>

</table>

</div>

</section>

</c:param>

</c:import>