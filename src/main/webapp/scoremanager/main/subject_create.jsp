<%-- 科目登録JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">
    <c:param name="title">
        得点管理システム
    </c:param>

    <c:param name="content">
        <section>
            <h2 class="page-title">科目情報登録</h2>
            
            <div style="max-width:480px;">                
                <form action="SubjectCreateExecute.action" method="post">

                    <div class="form-group">
                        <label for="cd">科目コード</label>
                      
                        <input type="text" id="cd" name="cd" value="${cd}" 
                               required maxlength="3" placeholder="科目コードを入力してください" />
                        
                       
                        <c:if test="${not empty error}">
                            <div style="color:#fbbf24; font-size:13px; margin-top:4px;">${error}</div>
                        </c:if>
                    </div>


                    <div class="form-group">
                        <label for="name">科目名</label>
                        
                        <input type="text" id="name" name="name" value="${name}" 
                               required maxlength="20" placeholder="科目名を入力してください" />
                    </div>

                    
                    <div style="display:flex; align-items:center; gap:12px; margin-top:24px;">
                        <button class="btn-primary" id="create-button" name="end">
                            <i class="fa-solid fa-check" style="margin-right:6px;"></i>登録して終了
                        </button>
                        
                        <a href="SubjectList.action" class="btn-secondary" style="display:inline-block;">
                            <i class="fa-solid fa-arrow-left" style="margin-right:6px;"></i>戻る
                        </a>
                    </div>
                </form>
            </div>
        </section>
    </c:param>
</c:import>