<%-- 科目一覧JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">
	<c:param name="title">
		得点管理システム
	</c:param>

	<c:param name="content">
		<section>
			<h2 class="page-title">科目管理</h2>

			<div style="text-align:right; margin-bottom:16px;">
				<a href="SubjectCreate.action" class="btn-primary" style="display:inline-block;">
					<i class="fa-solid fa-plus" style="margin-right:6px;"></i>新規登録
				</a>
			</div>

			<c:choose>
				<c:when test="${subjects.size() > 0}">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>科目コード</th>
								<th>科目名</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="subject" items="${subjects}">
								<tr>
									<td>${subject.cd}</td>
									<td>${subject.name}</td>
									<td>
										<%-- 変更リンク --%>
										<a href="SubjectUpdate.action?cd=${subject.cd}">変更</a>
									</td>
									<td>
										<%-- 削除リンク --%>
										<a href="SubjectDelete.action?cd=${subject.cd}">削除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<div class="alert alert-info mt-3">
						科目情報が存在しません。
					</div>
				</c:otherwise>
			</c:choose>
		</section>
	</c:param>
</c:import>