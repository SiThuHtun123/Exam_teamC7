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
			<div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:8px;">
				<h2 class="page-title" style="margin:0;">学生情報登録</h2>
				<form id="csvForm" action="StudentCsvUpload.action" method="post" enctype="multipart/form-data">
					<input type="file" id="csvFile" name="csvFile" accept=".csv" style="display:none;" />
					<button class="btn-secondary" type="button" onclick="document.getElementById('csvFile').click();">
						<i class="fa-solid fa-file-csv" style="margin-right:6px;"></i>CSVで登録
					</button>
				</form>
				<script>
					document.getElementById('csvFile').addEventListener('change', function() {
						if (this.files.length > 0) document.getElementById('csvForm').submit();
					});
				</script>
			</div>
			<c:if test="${not empty csvMessage}">
				<div style="margin-bottom:16px; padding:10px 14px; border-radius:8px; font-size:13px;
					background:${csvSuccess ? 'rgba(52,211,153,0.1)' : 'rgba(249,89,132,0.1)'};
					border:1px solid ${csvSuccess ? '#34d399' : '#f95984'};
					color:${csvSuccess ? '#34d399' : '#f95984'};">
					<i class="fa-solid ${csvSuccess ? 'fa-circle-check' : 'fa-circle-exclamation'}" style="margin-right:6px;"></i>${csvMessage}
				</div>
			</c:if>
			<div style="max-width:480px;">
				<form action="StudentCreateExecute.action" method="get">

					<div class="form-group">
						<label for="ent_year">入学年度</label>
						<select id="ent_year" name="ent_year">
							<option value="0">--------</option>
							<c:forEach var="year" items="${ent_year_set }">
								<option value="${year }">${year }</option>
							</c:forEach>
						</select>
						<div style="color:#fbbf24; font-size:13px; margin-top:4px;">${errors.get("1")}</div>
					</div>

					<div class="form-group">
						<label for="no">学生番号</label>
						<input type="text" id="no" name="no" required maxlength="10" placeholder="学生番号を入力してください" />
						<div style="color:#fbbf24; font-size:13px; margin-top:4px;">${errors.get("2")}</div>
					</div>

					<div class="form-group">
						<label for="name">氏名</label>
						<input type="text" id="name" name="name" required maxlength="30" placeholder="氏名を入力してください" />
					</div>

					<div class="form-group">
						<label for="class_num">クラス</label>
						<select id="class_num" name="class_num">
							<option value="0">--------</option>
							<c:forEach var="num" items="${class_num_set }">
								<option value="${num }">${num }</option>
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
