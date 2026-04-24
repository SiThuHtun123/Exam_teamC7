<%-- 学生情報変更JSP --%>
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
			<h2 class="page-title">学生情報変更</h2>
			<div style="max-width:480px;">
				<form action="StudentUpdateExecute.action" method="get">

					<div class="form-group">
						<label for="ent_year">入学年度</label>
						<input type="text" id="ent_year" name="ent_year" value="${ent_year }" readonly
							style="color:rgba(255,255,255,0.3); cursor:not-allowed;" />
					</div>

					<div class="form-group">
						<label for="no">学生番号</label>
						<input type="text" id="no" name="no" value="${no }" readonly
							style="color:rgba(255,255,255,0.3); cursor:not-allowed;" />
					</div>

					<div class="form-group">
						<label for="name">氏名</label>
						<input type="text" id="name" name="name" value="${name }" required maxlength="30" />
					</div>

					<div class="form-group">
						<label for="class_num">クラス</label>
						<select id="class_num" name="class_num">
							<c:forEach var="num" items="${class_num_set }">
								<option value="${num }" <c:if test="${num==class_num }">selected</c:if>>${num }</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label style="display:flex; align-items:center; gap:8px; cursor:pointer; font-weight:400; color:rgba(255,255,255,0.55);" for="is_attend">
							<input type="checkbox" id="is_attend" name="is_attend" <c:if test="${is_attend }">checked</c:if>
								style="width:auto; accent-color:#f95984;" />
							在学中
						</label>
					</div>

					<div style="display:flex; align-items:center; gap:12px; margin-top:24px;">
						<input class="btn-primary" type="submit" name="login" value="変更" />
						<a href="StudentList.action" class="btn-secondary" style="display:inline-block;">
							<i class="fa-solid fa-arrow-left" style="margin-right:6px;"></i>戻る
						</a>
					</div>

				</form>
			</div>
		</section>
	</c:param>
</c:import>
