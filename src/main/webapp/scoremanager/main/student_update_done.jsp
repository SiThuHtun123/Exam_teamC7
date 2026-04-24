<%-- 学生変更完了JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:import url="/common/base.jsp">
	<c:param name="title">
		得点管理システム
	</c:param>

	<c:param name="content">
		<div id="wrap_box">
			<h2 class="page-title">学生情報変更</h2>
			<div style="max-width:480px;">
				<div class="msg-success" style="display:flex; align-items:center; gap:10px; font-size:15px;">
					<i class="fa-solid fa-circle-check" style="font-size:18px;"></i>
					変更が完了しました
				</div>
				<div style="margin-top:24px;">
					<a href="StudentList.action" class="btn-primary" style="display:inline-block;">
						<i class="fa-solid fa-users" style="margin-right:6px;"></i>学生一覧
					</a>
				</div>
			</div>
		</div>
	</c:param>
</c:import>
