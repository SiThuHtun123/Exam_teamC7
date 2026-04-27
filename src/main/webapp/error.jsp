<%-- エラーページ --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:import url="/common/base.jsp">
	<c:param name="title">エラーページ</c:param>

	<c:param name="content">
		<div style="max-width:480px; margin:0 auto; text-align:center; padding-top:40px;">
			<div style="width:64px; height:64px; background:rgba(249,89,132,0.1); border:1px solid rgba(249,89,132,0.25); border-radius:16px; display:flex; align-items:center; justify-content:center; margin:0 auto 20px;">
				<i class="fa-solid fa-triangle-exclamation" style="color:#f95984; font-size:28px;"></i>
			</div>
			<h2 style="font-size:20px; font-weight:700; color:#f95984; margin-bottom:12px;">エラーが発生しました</h2>
			<p style="color:rgba(255,255,255,0.45); font-size:14px; margin-bottom:28px;">予期せぬエラーが発生しました。もう一度お試しください。</p>
			<a href="javascript:history.back()" class="btn-secondary" style="display:inline-block; margin-right:12px;">
				<i class="fa-solid fa-arrow-left" style="margin-right:6px;"></i>戻る
			</a>
			<a href="/Exam_teamC7/scoremanager/index.jsp" class="btn-primary" style="display:inline-block;">
				<i class="fa-solid fa-house" style="margin-right:6px;"></i>トップへ
			</a>
		</div>
	</c:param>
</c:import>
