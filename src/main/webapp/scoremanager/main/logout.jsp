<%-- ログアウトJSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:import url="/common/base.jsp">
	<c:param name="title">
		得点管理システム
	</c:param>

	<c:param name="content">
		<div id="wrap_box">
			<h2 class="page-title">ログアウト</h2>
			<div style="max-width:480px;">
				<div style="background:rgba(167,139,250,0.08); border:1px solid rgba(167,139,250,0.25); color:#a78bfa; border-radius:10px; padding:12px 16px; margin-bottom:24px; display:flex; align-items:center; gap:10px; font-size:15px;">
					<i class="fa-solid fa-right-from-bracket" style="font-size:18px;"></i>
					ログアウトしました
				</div>
				<a href="../Login.action" class="btn-primary" style="display:inline-block;">
					<i class="fa-solid fa-right-to-bracket" style="margin-right:6px;"></i>ログイン
				</a>
			</div>
		</div>
	</c:param>
</c:import>
