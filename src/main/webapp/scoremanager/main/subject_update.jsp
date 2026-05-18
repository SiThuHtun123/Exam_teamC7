<%-- 追加修正20260515 --%>

<%-- 科目情報変更JSP --%>
<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<%@ taglib prefix="c"
	uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp" >

	<c:param name="title">

		得点管理システム

	</c:param>

	<c:param name="content">

		<section>

			<h2 class="page-title">

				科目情報変更

			</h2>

			<div style="max-width:480px;">

				<%-- 科目更新実行 --%>
				<form action="SubjectUpdateExecute.action"
					  method="post">

					<%-- 
						科目コード(hidden)
						readonlyだけでは改ざん可能なため、
						サーバへ送信用hiddenを別で持つ
					--%>
					<input type="hidden"
						   name="cd"
						   value="${subject.cd}" />

					<%-- 科目コード表示用 --%>
					<div class="form-group">

						<label for="cd_display">

							科目コード

						</label>

						<input type="text"
							   id="cd_display"
							   value="${subject.cd}"
							   readonly
							   style="
							   		color:var(--color-text-5);
							   		cursor:not-allowed;
							   " />

					</div>

					<%-- 科目名 --%>
					<div class="form-group">

						<label for="name">

							科目名

						</label>

						<input type="text"
							   id="name"
							   name="name"
							   value="${subject.name}"
							   required
							   maxlength="30" />

					</div>

					<%-- ボタン群 --%>
					<div style="
						display:flex;
						align-items:center;
						gap:12px;
						margin-top:24px;
					">

						<button class="btn-primary"
								type="submit">

							変更

						</button>

						<a href="SubjectList.action"
						   class="btn-secondary"
						   style="display:inline-block;">

							<i class="fa-solid fa-arrow-left"
							   style="margin-right:6px;"></i>

							戻る

						</a>

					</div>

				</form>

			</div>

		</section>

	</c:param>

</c:import>
