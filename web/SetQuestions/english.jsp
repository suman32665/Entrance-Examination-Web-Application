<%--
  Created by IntelliJ IDEA.
  User: suman maharjan
  Date: 10/09/2016
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Set Question Paper</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="../JS/setquestions.js"></script>
</head>
<body onload="create_table(1);">

<div id="templatemo_content_wrapper">

    <%@include file="../includes/navbar.jsp" %>
    <form method="post" action="set_paper">
        <input type="hidden" name="page" value="view_english">
        <h1>Section A: English</h1>
        <table id="tables"></table>
        <tr><td><input type="submit" value=" SET QUESTIONS " id="questionbutton"></td></tr>
    </form>
</div>
</body>
</html>
