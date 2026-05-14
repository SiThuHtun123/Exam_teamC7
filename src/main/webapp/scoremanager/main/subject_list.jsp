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
								<th style="width: 80px;"></th> <%-- 固定操作列宽度更整齐 --%>
								<th style="width: 80px;"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="subject" items="${subjects}">
								<tr>
									<td>${subject.cd}</td>
									<td>${subject.name}</td>
									<td>
										<%-- 修正：变更链接也使用 c:url 处理特殊字符 --%>
										<c:url var="updateUrl" value="SubjectUpdate.action">
											<c:param name="cd" value="${subject.cd}" />
										</c:url>
										<a href="${updateUrl}">変更</a>
									</td>
									<td>
										<%-- 削除链接：已正确处理编码 --%>
										<c:url var="deleteUrl" value="SubjectDelete.action">
										    <c:param name="cd" value="${subject.cd}" />
										</c:url>
										<a href="${deleteUrl}">削除</a>
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