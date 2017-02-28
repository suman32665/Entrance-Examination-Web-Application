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
    <title>View Paper</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
<div id="templatemo_content_wrapper">

    <%@include file="../includes/navbar.jsp" %>
    <h1><c:out value="${section}"></c:out></h1>
    <table class="table">
        <tr>
            <th>Questions</th>
            <th align="right">Edit</th>
            <th align="right">Delete</th>
        </tr>
        <c:forEach items="${questionsList}" var="questions">
            <tr>
                <td>${questions.id}. ${questions.question}</td>
                <td align="right"><a href="qedit?page=edit&id=${questions.id}"><img src="../images/edit.jpg" height="30px" width="40px" alt="Edit"></a></td>
                <td align="right"><a href="qdelete?page=delete&id=${questions.id}"><img src="../images/delete.jpg" height="30px" width="40px" alt="Delete"></a></td>
            </tr>
            <tr>
                <td>A. ${questions.optionA}</td>
            </tr>
            <tr>
                <td>B. ${questions.optionB}</td>
            </tr>
            <tr>
                <td>C. ${questions.optionC}</td>
            </tr>
            <tr>
                <td>D. ${questions.optionD}</td>
            </tr>
            <tr>
                <td>Answer: ${questions.answer}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
