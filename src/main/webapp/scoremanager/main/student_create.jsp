<%-- 学生登録JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:import url="/common/base.jsp" >
	<c:param name="title">
		得点管理システム
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
		<section>
			<h2 class="page-title">学生情報登録</h2>
			<div style="max-width:480px;">
				<form action="StudentCreateExecute.action" method="get">

					<div class="form-group">
						<label for="ent_year">入学年度</label>
						<select id="ent_year" name="ent_year">
							<option value="0">--------</option>
							<c:forEach var="year" items="${ent_year_set }">
								<option value="${year }" <c:if test="${year==ent_year }">selected</c:if>>${year }</option>
							</c:forEach>
						</select>
						<div style="color:#fbbf24; font-size:13px; margin-top:4px;">${errors.get("1")}</div>
					</div>

					<div class="form-group">
						<label for="no">学生番号</label>
						<input type="text" id="no" name="no" value="${no }" required maxlength="10" placeholder="学生番号を入力してください" />
						<div style="color:#fbbf24; font-size:13px; margin-top:4px;">${errors.get("2")}</div>
					</div>

					<div class="form-group">
						<label for="name">氏名</label>
						<input type="text" id="name" name="name" value="${name }" required maxlength="30" placeholder="氏名を入力してください" />
					</div>

					<div class="form-group">
						<label for="class_num">クラス</label>
						<select id="class_num" name="class_num">
							<c:forEach var="num" items="${class_num_set }">
								<option value="${num }" <c:if test="${num==class_num }">selected</c:if>>${num }</option>
							</c:forEach>
						</select>
					</div>

					<div style="display:flex; align-items:center; gap:12px; margin-top:24px;">
						<button class="btn-primary" id="create-button" name="end">
							<i class="fa-solid fa-check" style="margin-right:6px;"></i>登録して終了
						</button>
						<a href="StudentList.action" class="btn-secondary" style="display:inline-block;">
							<i class="fa-solid fa-arrow-left" style="margin-right:6px;"></i>戻る
						</a>
					</div>

				</form>
			</div>
		</section>
	</c:param>
</c:import>
