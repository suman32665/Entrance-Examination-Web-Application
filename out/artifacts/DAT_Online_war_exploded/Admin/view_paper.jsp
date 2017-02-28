
<%--
  Created by IntelliJ IDEA.
  User: suman maharjan
  Date: 09/09/2016
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>View Paper</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div id="templatemo_content_wrapper">

    <%@include file="../includes/navbar.jsp" %>
    <div class="subject">
        <ul class="list-group">
            <li><a href="SeeQuestions?page=view_english" class="list-group-item list-group-item-success">View English Paper</a></li>
            <li><a href="SeeQuestions?page=view_mathematics" class="list-group-item list-group-item-info">View Mathematics Paper</a></li>
            <li><a href="SeeQuestions?page=view_physics" class="list-group-item list-group-item-warning">View Physics Paper</a></li>
            <li><a href="SeeQuestions?page=view_chemistry" class="list-group-item list-group-item-danger">View Chemistry Paper</a></li>
            <li><a href="SeeQuestions?page=view_iq" class="list-group-item list-group-item-success">View IQ Paper</a></li>
            <li><a href="SeeQuestions?page=view_as_student" class="list-group-item list-group-item-info">View As Student</a></li>
        </ul>
    </div>
</div>
</body>
</html>
