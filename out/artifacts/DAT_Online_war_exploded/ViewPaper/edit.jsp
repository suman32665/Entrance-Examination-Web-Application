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
    <title>Edit Paper</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
<div id="templatemo_content_wrapper">
    <%@include file="../includes/navbar.jsp" %>
    <h1>Edit Question</h1>
    <form method="post" action="updateQuestion">
        <input type="hidden" name="page" value="updateQuestion">
        <input type="hidden" name="id" value="${questions.id}">
        <table>
            <tr>
            <td>${questions.id}. <input type="text" name="question" value="${questions.question}" id="question" required=""></td>
            </tr>
            <tr>
                <td>A. <input type="text" name="A" value="${questions.optionA}" id="answer" required=""></td>
            </tr>
            <tr>
                <td>B. <input type="text" name="B" value="${questions.optionB}" id="answer" required=""></td>
            </tr>
            <tr>
                <td>C. <input type="text" name="C" value="${questions.optionC}" id="answer" required=""></td>
            </tr>
            <tr>
                <td>D. <input type="text" name="D" value="${questions.optionD}" id="answer" required=""></td>
            </tr>
            <tr>
               <td>Answer: <input type="text" name="answer" value="${questions.answer}" id="answer" required=""></td>
            </tr>
            <tr>
                <td><input type="submit" value="Update Question" id="questionbutton"></td>
            </tr>
        </table>

    </form>

</div>

</body>
</html>
