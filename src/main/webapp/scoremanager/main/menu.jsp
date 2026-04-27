<%-- メニューJSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:import url="/common/base.jsp">
	<c:param name="title">
		得点管理システム
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
		<section>
			<h2 class="page-title">メニュー</h2>
			<div style="display:grid; grid-template-columns:repeat(2,1fr); gap:16px; max-width:700px;">

				<a href="StudentList.action" style="background:rgba(255,255,255,0.02); border:1px solid rgba(255,255,255,0.07); border-radius:14px; padding:28px 24px; display:flex; align-items:center; gap:16px; transition:border-color 0.2s ease, box-shadow 0.2s ease; text-decoration:none;"
				   onmouseover="this.style.borderColor='rgba(249,89,132,0.25)'; this.style.boxShadow='0 16px 40px rgba(0,0,0,0.4)';"
				   onmouseout="this.style.borderColor='rgba(255,255,255,0.07)'; this.style.boxShadow='none';">
					<div style="width:44px; height:44px; background:rgba(249,89,132,0.1); border:1px solid rgba(249,89,132,0.25); border-radius:10px; display:flex; align-items:center; justify-content:center; flex-shrink:0;">
						<i class="fa-solid fa-users" style="color:#f95984; font-size:18px;"></i>
					</div>
					<span style="font-size:16px; font-weight:600; color:#ffffff;">学生管理</span>
				</a>

				<div style="background:rgba(255,255,255,0.02); border:1px solid rgba(255,255,255,0.07); border-radius:14px; padding:28px 24px;">
					<div style="display:flex; align-items:center; gap:16px; margin-bottom:16px;">
						<div style="width:44px; height:44px; background:rgba(96,165,250,0.1); border:1px solid rgba(96,165,250,0.25); border-radius:10px; display:flex; align-items:center; justify-content:center; flex-shrink:0;">
							<i class="fa-solid fa-chart-bar" style="color:#60a5fa; font-size:18px;"></i>
						</div>
						<span style="font-size:16px; font-weight:600; color:#ffffff;">成績管理</span>
					</div>
					<div style="display:flex; flex-direction:column; gap:8px; padding-left:60px;">
						<a href="TestRegist.action" style="font-size:14px; color:rgba(255,255,255,0.55); transition:color 0.2s ease;"
						   onmouseover="this.style.color='#60a5fa';" onmouseout="this.style.color='rgba(255,255,255,0.55)';">
							<i class="fa-solid fa-plus" style="margin-right:6px;"></i>成績登録
						</a>
						<a href="TestList.action" style="font-size:14px; color:rgba(255,255,255,0.55); transition:color 0.2s ease;"
						   onmouseover="this.style.color='#60a5fa';" onmouseout="this.style.color='rgba(255,255,255,0.55)';">
							<i class="fa-solid fa-list" style="margin-right:6px;"></i>成績参照
						</a>
					</div>
				</div>

				<a href="SubjectList.action" style="background:rgba(255,255,255,0.02); border:1px solid rgba(255,255,255,0.07); border-radius:14px; padding:28px 24px; display:flex; align-items:center; gap:16px; transition:border-color 0.2s ease, box-shadow 0.2s ease; text-decoration:none;"
				   onmouseover="this.style.borderColor='rgba(52,211,153,0.25)'; this.style.boxShadow='0 16px 40px rgba(0,0,0,0.4)';"
				   onmouseout="this.style.borderColor='rgba(255,255,255,0.07)'; this.style.boxShadow='none';">
					<div style="width:44px; height:44px; background:rgba(52,211,153,0.08); border:1px solid rgba(52,211,153,0.25); border-radius:10px; display:flex; align-items:center; justify-content:center; flex-shrink:0;">
						<i class="fa-solid fa-book" style="color:#34d399; font-size:18px;"></i>
					</div>
					<span style="font-size:16px; font-weight:600; color:#ffffff;">科目管理</span>
				</a>

				<a href="ClassList.action" style="background:rgba(255,255,255,0.02); border:1px solid rgba(255,255,255,0.07); border-radius:14px; padding:28px 24px; display:flex; align-items:center; gap:16px; transition:border-color 0.2s ease, box-shadow 0.2s ease; text-decoration:none;"
				   onmouseover="this.style.borderColor='rgba(167,139,250,0.25)'; this.style.boxShadow='0 16px 40px rgba(0,0,0,0.4)';"
				   onmouseout="this.style.borderColor='rgba(255,255,255,0.07)'; this.style.boxShadow='none';">
					<div style="width:44px; height:44px; background:rgba(167,139,250,0.08); border:1px solid rgba(167,139,250,0.25); border-radius:10px; display:flex; align-items:center; justify-content:center; flex-shrink:0;">
						<i class="fa-solid fa-chalkboard" style="color:#a78bfa; font-size:18px;"></i>
					</div>
					<span style="font-size:16px; font-weight:600; color:#ffffff;">クラス管理</span>
				</a>

			</div>
		</section>
	</c:param>
</c:import>
