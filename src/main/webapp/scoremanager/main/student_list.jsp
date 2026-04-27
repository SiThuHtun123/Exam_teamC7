<%-- 学生一覧JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">
	<c:param name="title">得点管理システム</c:param>
	<c:param name="scripts"></c:param>

	<c:param name="content">
		<section>
			<h2 class="page-title">学生管理</h2>

			<div style="text-align:right; margin-bottom:16px;">
				<a href="StudentCreate.action" class="btn-primary" style="display:inline-block;">
					<i class="fa-solid fa-plus" style="margin-right:6px;"></i>新規登録
				</a>
			</div>

			<!-- 検索フォーム -->
			<form method="get">
				<div style="background:rgba(255,255,255,0.02); border:1px solid rgba(255,255,255,0.07); border-radius:12px; padding:16px 20px; margin-bottom:20px; display:flex; align-items:flex-end; gap:16px;" id="filter">

					<!-- 入学年度 -->
					<div style="flex:1;">
						<label for="student-f1-select">入学年度</label>
						<select id="student-f1-select" name="f1">
							<option value="0">--------</option>
							<c:forEach var="year" items="${ent_year_set}">
								<option value="${year}" <c:if test="${year == f1}">selected</c:if>>${year}</option>
							</c:forEach>
						</select>
					</div>

					<!-- クラス -->
					<div style="flex:1;">
						<label for="student-f2-select">クラス</label>
						<select id="student-f2-select" name="f2">
							<option value="0">--------</option>
							<c:forEach var="num" items="${class_num_set}">
								<option value="${num}" <c:if test="${num == f2}">selected</c:if>>${num}</option>
							</c:forEach>
						</select>
					</div>

					<!-- 在学中チェック -->
					<div style="display:flex; align-items:center; gap:8px; padding-bottom:2px;">
						<label style="display:flex; align-items:center; gap:8px; cursor:pointer; font-weight:400; color:rgba(255,255,255,0.55); margin:0;" for="student-f3-check">
							<input type="checkbox" id="student-f3-check" name="f3" value="t" <c:if test="${!empty f3}">checked</c:if> style="width:auto; accent-color:#f95984;" />
							在学中
						</label>
					</div>

					<!-- 絞込みボタン -->
					<div>
						<button class="btn-secondary" id="filter-button">
							<i class="fa-solid fa-filter" style="margin-right:6px;"></i>絞込み
						</button>
					</div>

					<div style="color:#fbbf24; font-size:13px;">${errors.get("f1")}</div>
				</div>
			</form>

			<!-- 検索結果 -->
			<c:choose>
				<c:when test="${students.size()>0}">
					<div style="font-size:13px; margin-bottom:12px;">
						<span style="color:rgba(255,255,255,0.45);">検索結果：</span><span style="color:#34d399; font-weight:600;">${students.size()}件</span>
					</div>
					<div style="background:rgba(255,255,255,0.02); border:1px solid rgba(255,255,255,0.07); border-radius:12px; overflow:hidden;">
						<table>
							<tr>
								<th>入学年度</th>
								<th>学生番号</th>
								<th>氏名</th>
								<th>クラス</th>
								<th style="text-align:center;">在学中</th>
								<th></th>
							</tr>
							<c:forEach var="student" items="${students}">
								<tr>
									<td>${student.entYear}</td>
									<td>${student.no}</td>
									<td>${student.name}</td>
									<td>${student.classNum}</td>
									<td style="text-align:center;">
										<c:choose>
											<c:when test='${student.isAttend()}'>
												<span style="color:#34d399;">○</span>
											</c:when>
											<c:otherwise>
												<span style="color:rgba(255,255,255,0.3);">×</span>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<a href="StudentUpdate.action?no=${student.no}" style="font-size:13px; color:rgba(255,255,255,0.45); border:1px solid rgba(255,255,255,0.1); padding:4px 12px; border-radius:8px; transition:color 0.2s ease, border-color 0.2s ease;"
										   onmouseover="this.style.color='#f95984'; this.style.borderColor='rgba(249,89,132,0.25)';"
										   onmouseout="this.style.color='rgba(255,255,255,0.45)'; this.style.borderColor='rgba(255,255,255,0.1)';">
											変更
										</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</c:when>
				<c:otherwise>
					<div style="color:rgba(255,255,255,0.45); font-size:14px; padding:20px 0;">
						学生情報が存在しませんでした。
					</div>
				</c:otherwise>
			</c:choose>
		</section>
	</c:param>
</c:import>
