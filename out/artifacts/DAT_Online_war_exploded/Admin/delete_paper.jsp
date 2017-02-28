<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <title>Delete Paper</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


<div id="templatemo_content_wrapper">
    <%--<nav class="navbar navbar-inverse">--%>

        <%@include file="../includes/navbar.jsp" %>
    <div class="subject">

        <ul class="list-group">
            <li><a href="DelQuestions?page=delete_english" class="list-group-item list-group-item-success">Delete English Paper</a></li>
            <li><a href="DelQuestions?page=delete_mathematics" class="list-group-item list-group-item-info">Delete Mathematics Paper</a></li>
            <li><a href="DelQuestions?page=delete_physics" class="list-group-item list-group-item-warning">Delete Physics Paper</a></li>
            <li><a href="DelQuestions?page=delete_chemistry" class="list-group-item list-group-item-danger">Delete Chemistry Paper</a></li>
            <li><a href="DelQuestions?page=delete_iq" class="list-group-item list-group-item-success">Delete IQ Paper</a></li>
            <li><a href="delete_paper?page=delete_paper" class="list-group-item list-group-item-warning">Delete All Papers</a></li>
        </ul>
    </div>
</div>
</body>
</html>