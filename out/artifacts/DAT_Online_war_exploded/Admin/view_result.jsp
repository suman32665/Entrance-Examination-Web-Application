<%--
  Created by IntelliJ IDEA.
  User: suman maharjan
  Date: 07/10/2016
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <title>Result</title>
</head>
<body>
<div id="templatemo_content_wrapper">

    <%@include file="../includes/navbar.jsp" %>
    <h1>Result</h1>
    <table class="table">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Roll No.</th>
            <th>Marks</th>
            <th>Attempt Left</th>
        </tr>
        <c:forEach items="${studentList}" var="students">
            <tr>
                <td>${students.id}</td>
                <td>${students.name}</td>
                <td>${students.roll}</td>
                <td>${students.score}</td>
                <td>${students.attempt}</td>
            </tr>
        </c:forEach>
    </table>
    <%--<ul class="list-group">--%>
        <%--<li class="list-group-item">--%>
            <a href="delete_result?page=delete_result"><input type="button" class="btn btn-danger" value="Delete"/></a>
    <%--</li>--%>
        <%--<li class="list-group-item">--%>
            <a href="export_result?page=export_result"><input type="button" class="btn btn-primary" value="Export In Excel"/></a>
    <%--</li>--%>
    <%--</ul>--%>

</div>
</body>
</html>
