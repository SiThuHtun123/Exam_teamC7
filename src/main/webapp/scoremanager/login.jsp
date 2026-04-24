<%-- ログインJSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:import url="/common/base.jsp">
	<c:param name="title">
		得点管理システム
	</c:param>

	<c:param name="scripts">
		<script type="text/javascript">
			$(function() {
				// 「パスワードを表示」が変更された時の処理
				$('#password-display').change(function() {
					if ($(this).prop('checked')) {
						// チェックが入っている場合
						// パスワード入力欄をテキストにする
						$('#password-input').attr('type', 'text');
					} else {
						// チェックが外れている場合
						// パスワード入力欄をパスワードにする
						$('#password-input').attr('type', 'password');
					}
				});
			});
		</script>
	</c:param>

	<c:param name="content">
		<div style="width:100%; max-width:400px; margin:0 auto;">
			<div style="background:rgba(255,255,255,0.02); border:1px solid rgba(255,255,255,0.07); border-radius:16px; padding:24px;">
				<div style="text-align:center; margin-bottom:20px;">
					<div style="width:44px; height:44px; background:rgba(249,89,132,0.1); border:1px solid rgba(249,89,132,0.25); border-radius:12px; display:inline-flex; align-items:center; justify-content:center; margin-bottom:12px;">
						<i class="fa-solid fa-graduation-cap" style="color:#f95984; font-size:18px;"></i>
					</div>
					<h2 style="font-size:18px; font-weight:700; color:#ffffff; margin:0;">ログイン</h2>
				</div>

				<form action="LoginExecute.action" method="post">
					<div id="wrap_box">
						<c:if test="${errors.size()>0}">
							<div class="msg-error" style="margin-bottom:20px;">
								<ul style="list-style:none; padding:0; margin:0;">
									<c:forEach var="error" items="${errors}">
										<li><i class="fa-solid fa-circle-exclamation" style="margin-right:6px;"></i>${error}</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>

						<!-- ＩＤ -->
						<div class="form-group">
							<label for="id-input">ＩＤ</label>
							<input autocomplete="off"
								id="id-input" maxlength="20" name="id" placeholder="半角でご入力下さい"
								style="ime-mode: disabled" type="text" value="${id}" required />
						</div>

						<!-- パスワード -->
						<div class="form-group">
							<label for="password-input">パスワード</label>
							<input autocomplete="off"
								id="password-input" maxlength="20" name="password"
								placeholder="20文字以内の半角英数字でご入力下さい" style="ime-mode: disabled"
								type="password" required />
						</div>

						<div style="margin-bottom:16px;">
							<label style="display:flex; align-items:center; gap:8px; cursor:pointer; font-size:13px; color:rgba(255,255,255,0.45); font-weight:400;">
								<input id="password-display" name="chk_d_ps" type="checkbox" style="width:auto; accent-color:#f95984;" />
								パスワードを表示
							</label>
						</div>

						<input class="btn-primary" type="submit" name="login" value="ログイン" style="width:100%;"/>
					</div>
				</form>
			</div>
		</div>
	</c:param>
</c:import>
