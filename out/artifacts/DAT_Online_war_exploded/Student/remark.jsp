<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: suman maharjan
  Date: 07/10/2016
  Time: 09:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Remark</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
</head>
<body>

<div id="templatemo_content_wrapper">
    <h1><strong>Congratulations <c:out value="${student_name}"></c:out>!!!</strong><br>You have scored <c:out value="${score}"></c:out> out of <c:out value="${total}"></c:out>.</h1>
</div>
</body>
</html>
