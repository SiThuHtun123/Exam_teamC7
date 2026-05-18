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
						<span style="color:rgba(255,255,255,0.45);">検索結果：</span><span style="color:#34d399; font-weight:600;">${totalCount}件</span>
					</div>
					<div style="background:rgba(255,255,255,0.02); border:1px solid rgba(255,255,255,0.07); border-radius:12px; overflow:hidden;">
						<table>
							<c:set var="sortBase" value="StudentList.action?f1=${f1}${not empty f2 and f2 != '0' and f2 != 'null' ? '&f2='.concat(f2) : ''}${not empty f3 and f3 != 'null' ? '&f3=t' : ''}&page=1" />
							<tr>
								<th>
									<a href="${sortBase}&sortBy=entYear&sortDir=${sortBy == 'entYear' && sortDir == 'asc' ? 'desc' : 'asc'}"
									   style="color:inherit; text-decoration:none; display:inline-flex; align-items:center; gap:4px;">
										入学年度
										<span style="font-size:10px; opacity:${sortBy == 'entYear' ? '1' : '0.3'};">
											<c:choose>
												<c:when test="${sortBy == 'entYear' && sortDir == 'asc'}">&#9650;</c:when>
												<c:otherwise>&#9660;</c:otherwise>
											</c:choose>
										</span>
									</a>
								</th>
								<th>
									<a href="${sortBase}&sortBy=studentNo&sortDir=${sortBy == 'studentNo' && sortDir == 'asc' ? 'desc' : 'asc'}"
									   style="color:inherit; text-decoration:none; display:inline-flex; align-items:center; gap:4px;">
										学生番号
										<span style="font-size:10px; opacity:${sortBy == 'studentNo' ? '1' : '0.3'};">
											<c:choose>
												<c:when test="${sortBy == 'studentNo' && sortDir == 'asc'}">&#9650;</c:when>
												<c:otherwise>&#9660;</c:otherwise>
											</c:choose>
										</span>
									</a>
								</th>
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
												<span style="color:#34d399; font-size:18px; font-weight:700;">○</span>
											</c:when>
											<c:otherwise>
												<span style="color:#f95984; font-size:18px; font-weight:700;">×</span>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<a href="StudentUpdate.action?no=${student.no}" style="font-size:13px; color:var(--color-text-4); border:1px solid var(--color-border); padding:4px 12px; border-radius:8px; transition:color 0.2s ease, border-color 0.2s ease;"
										   onmouseover="this.style.color='#f95984'; this.style.borderColor='rgba(249,89,132,0.25)';"
										   onmouseout="this.style.color='var(--color-text-4)'; this.style.borderColor='var(--color-border)';">
											変更
										</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>

					<!-- ページネーション -->
					<c:if test="${totalPages > 1}">
						<c:set var="pageBase" value="StudentList.action?f1=${f1}${not empty f2 and f2 != '0' and f2 != 'null' ? '&f2='.concat(f2) : ''}${not empty f3 and f3 != 'null' ? '&f3=t' : ''}&sortBy=${sortBy}&sortDir=${sortDir}" />
						<div style="display:flex; justify-content:center; align-items:center; gap:6px; margin-top:16px;">

							<!-- 前へ -->
							<c:choose>
								<c:when test="${currentPage > 1}">
									<a href="${pageBase}&page=${currentPage - 1}"
									   style="padding:6px 12px; border-radius:8px; border:1px solid var(--color-border); color:var(--color-text-4); font-size:13px; text-decoration:none;">
										&#8249;
									</a>
								</c:when>
								<c:otherwise>
									<span style="padding:6px 12px; border-radius:8px; border:1px solid var(--color-border); color:var(--color-text-5); font-size:13px; cursor:not-allowed;">&#8249;</span>
								</c:otherwise>
							</c:choose>

							<!-- ページ番号 -->
							<c:forEach begin="1" end="${totalPages}" var="p">
								<c:choose>
									<c:when test="${p == currentPage}">
										<span style="padding:6px 12px; border-radius:8px; border:1px solid #f95984; background:rgba(249,89,132,0.1); color:#f95984; font-size:13px; font-weight:600;">${p}</span>
									</c:when>
									<c:otherwise>
										<a href="${pageBase}&page=${p}"
										   style="padding:6px 12px; border-radius:8px; border:1px solid var(--color-border); color:var(--color-text-4); font-size:13px; text-decoration:none;">${p}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<!-- 次へ -->
							<c:choose>
								<c:when test="${currentPage < totalPages}">
									<a href="${pageBase}&page=${currentPage + 1}"
									   style="padding:6px 12px; border-radius:8px; border:1px solid var(--color-border); color:var(--color-text-4); font-size:13px; text-decoration:none;">
										&#8250;
									</a>
								</c:when>
								<c:otherwise>
									<span style="padding:6px 12px; border-radius:8px; border:1px solid var(--color-border); color:var(--color-text-5); font-size:13px; cursor:not-allowed;">&#8250;</span>
								</c:otherwise>
							</c:choose>

						</div>
					</c:if>

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
