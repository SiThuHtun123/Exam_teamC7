<%-- ヘッダー --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<div class="header-logo">
	<div class="header-logo-icon">
		<i class="fa-solid fa-graduation-cap"></i>
	</div>
	<span class="header-logo-text">得点管理システム</span>
</div>
<c:if test="${user.isAuthenticated()}">
	<div class="header-user">
		<span class="header-username">
			<i class="fa-solid fa-user"></i>${user.getName()}様
		</span>
		<a href="Logout.action" class="header-logout">
			<i class="fa-solid fa-right-from-bracket"></i>ログアウト
		</a>
	</div>
</c:if>
