<%-- 追加作成20260515 --%>

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生削除</title>
</head>

<body>

<h2>学生削除</h2>

<p>以下の学生を削除しますか？</p>

<table border="1">

<tr>
    <th>学生番号</th>
    <td>${student.no}</td>
</tr>

<tr>
    <th>氏名</th>
    <td>${student.name}</td>
</tr>

<tr>
    <th>入学年度</th>
    <td>${student.entYear}</td>
</tr>

<tr>
    <th>クラス</th>
    <td>${student.classNum}</td>
</tr>

</table>

<br>

<form action="StudentDeleteExecute.action" method="post">

<input type="hidden" name="no" value="${student.no}">

<input type="submit" value="削除">

</form>

<br>

<a href="StudentList.action">戻る</a>

</body>
</html>