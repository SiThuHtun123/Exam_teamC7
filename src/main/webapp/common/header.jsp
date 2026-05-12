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
<div class="header-user">
	<button id="theme-toggle" onclick="toggleTheme()" style="background:var(--color-bg-surface-2); border:1px solid var(--color-border); color:var(--color-text-4); width:34px; height:34px; border-radius:var(--radius-md); cursor:pointer; display:flex; align-items:center; justify-content:center; transition:color var(--transition-fast), border-color var(--transition-fast);"
		onmouseover="this.style.color='var(--color-pink)'; this.style.borderColor='var(--color-pink-border)';"
		onmouseout="this.style.color='var(--color-text-4)'; this.style.borderColor='var(--color-border)';">
		<i id="theme-icon" class="fa-solid fa-sun" style="font-size:14px;"></i>
	</button>
	<c:if test="${user.isAuthenticated()}">
		<span class="header-username">
			<i class="fa-solid fa-user"></i>${user.getName()}様
		</span>
		<a href="Logout.action" class="header-logout">
			<i class="fa-solid fa-right-from-bracket"></i>ログアウト
		</a>
	</c:if>
</div>
