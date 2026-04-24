<%-- サイドバー --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="uri" value="${pageContext.request.requestURI}" />

<div style="padding-top: 8px;">

  <a href="Menu.action" class="nav-link-item" style="color:${uri.contains('Menu') ? '#f95984' : ''}; background:${uri.contains('Menu') ? 'rgba(249,89,132,0.08)' : ''}; border-right:${uri.contains('Menu') ? '2px solid #f95984' : 'none'};">
    <i class="fa-solid fa-house" style="color:#f95984;"></i>メニュー
  </a>

  <div class="nav-section-label">管理</div>

  <a href="StudentList.action" class="nav-link-item" style="color:${uri.contains('Student') ? '#f95984' : ''}; background:${uri.contains('Student') ? 'rgba(249,89,132,0.08)' : ''}; border-right:${uri.contains('Student') ? '2px solid #f95984' : 'none'};">
    <i class="fa-solid fa-users" style="color:#f95984;"></i>学生管理
  </a>

  <div class="nav-link-item" style="cursor:default; pointer-events:none; color:#60a5fa;">
    <i class="fa-solid fa-chart-bar" style="color:#60a5fa;"></i>成績管理
  </div>
  <a href="TestRegist.action" class="nav-sub-item" style="color:${uri.contains('TestRegist') ? '#60a5fa' : ''};">
    <i class="fa-solid fa-plus" style="color:#60a5fa;"></i>成績登録
  </a>
  <a href="TestList.action" class="nav-sub-item" style="color:${uri.contains('TestList') ? '#60a5fa' : ''};">
    <i class="fa-solid fa-list" style="color:#60a5fa;"></i>成績参照
  </a>

  <a href="SubjectList.action" class="nav-link-item" style="color:${uri.contains('Subject') ? '#34d399' : ''}; background:${uri.contains('Subject') ? 'rgba(52,211,153,0.08)' : ''}; border-right:${uri.contains('Subject') ? '2px solid #34d399' : 'none'};">
    <i class="fa-solid fa-book" style="color:#34d399;"></i>科目管理
  </a>

  <a href="ClassList.action" class="nav-link-item" style="color:${uri.contains('Class') ? '#a78bfa' : ''}; background:${uri.contains('Class') ? 'rgba(167,139,250,0.08)' : ''}; border-right:${uri.contains('Class') ? '2px solid #a78bfa' : 'none'};">
    <i class="fa-solid fa-chalkboard" style="color:#a78bfa;"></i>クラス管理
  </a>

</div>
