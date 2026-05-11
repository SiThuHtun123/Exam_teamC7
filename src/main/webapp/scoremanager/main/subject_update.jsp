<%-- 科目情報変更JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:import url="/common/base.jsp" >
	<c:param name="title">
		得点管理システム
	</c:param>

	<c:param name="content">
		<section>
			<h2 class="page-title">科目情報変更</h2>
			<div style="max-width:480px;">
				<%-- 提交到 SubjectUpdateExecute.action，建议用 post --%>
				<form action="SubjectUpdateExecute.action" method="post">

					<div class="form-group">
						<label for="cd">科目コード</label>
						<%-- 科目代码作为主键，不可修改，设为 readonly --%>
						<input type="text" id="cd" name="cd" value="${subject.cd}" readonly
							style="color:rgba(255,255,255,0.3); cursor:not-allowed;" />
					</div>

					<div class="form-group">
						<label for="name">科目名</label>
						<%-- 只允许修改科目名称 --%>
						<input type="text" id="name" name="name" value="${subject.name}" required maxlength="30" />
					</div>

					<div style="display:flex; align-items:center; gap:12px; margin-top:24px;">
						<button class="btn-primary" type="submit">変更</button>
						<a href="SubjectList.action" class="btn-secondary" style="display:inline-block;">
							<i class="fa-solid fa-arrow-left" style="margin-right:6px;"></i>戻る
						</a>
					</div>

				</form>
			</div>
		</section>
	</c:param>
</c:import>