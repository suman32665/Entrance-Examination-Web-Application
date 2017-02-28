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
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


<div id="templatemo_content_wrapper">


        <%@include file="../includes/navbar.jsp" %>
    <div class="subject">

        <ul class="list-group">
            <li><a href="SetQuestions?page=english" class="list-group-item list-group-item-success">Set English Paper</a></li>
            <li><a href="SetQuestions?page=mathematics" class="list-group-item list-group-item-info">Set Mathematics Paper</a></li>
            <li><a href="SetQuestions?page=physics" class="list-group-item list-group-item-warning">Set Physics Paper</a></li>
            <li><a href="SetQuestions?page=chemistry" class="list-group-item list-group-item-danger">Set Chemistry Paper</a></li>
            <li><a href="SetQuestions?page=iq" class="list-group-item list-group-item-success">Set IQ Paper</a></li>
            <li><a href="AddStudent?page=addStudent" class="list-group-item list-group-item-success">Add Student</a></li>
            <li><a href="edit_info?page=edit_info" class="list-group-item list-group-item-warning">Change Password</a></li>
        </ul>
    </div>
</div>
</body>
</html>