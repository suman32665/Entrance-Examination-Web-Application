<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: suman maharjan
  Date: 18/09/2016
  Time: 07:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Admin</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
<div id="templatemo_content_wrapper">

    <%@include file="../includes/navbar.jsp" %>
    <h1>Edit Admin Info</h1>
    <h3><c:out value="${message}"></c:out></h3>
    <form method="post" action="update_admin">
        <input type="hidden" name="page" value="update_admin">
        <input type="hidden" name="id" value="${admin.id}">
        <table>
            <tr>
                <td><input type="text" name="old_password" placeholder="Old Password" required=""></td>
            </tr>
            <tr>
                <td><input type="text" name="new_username" placeholder="New UserName" required=""></td>
            </tr>
            <tr>
                <td><input type="password" name="new_password" placeholder="New Password" required=""></td>
            </tr>
            <tr>
                <td><input type="password" name="confirm_password" placeholder="Confirm Password" required=""></td>
            </tr>
            <tr>
                <td><input type="submit" value="Change" id="questionbutton"></td>
            </tr>
        </table>

    </form>

</div>

</body>
</html>
