<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <script type="text/javascript" src="../JS/setquestions.js"></script>
</head>
<body>
<div id="templatemo_content_wrapper">
    <%@include file="../includes/navbar.jsp" %>
    <table class="table">
        <c:forEach items="${questionsList}" var="questions">
            <c:set var="string1" value="question answer"/>
            <c:set var="string2" value="${fn:split(string1,' ')}"/>
            <c:set var="name" value="${fn:join(string2, questions.id)}"/>
                <c:if test="${questions.id>=1 && questions.id<=20}">
                    <c:if test="${questions.id==1}">
                        <h1><c:out value="${sectionA}"></c:out></h1>
                    </c:if>
                    <tr>
                        <td>${questions.id}. ${questions.question}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="A">  A. ${questions.optionA}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="B">  B. ${questions.optionB}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="C">  C. ${questions.optionC}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="D">  D. ${questions.optionD}</td>
                    </tr>
                    <tr><td>        </td></tr>

                </c:if>
            </c:forEach>
    </table>
    <table class="table">
        <c:forEach items="${questionsList}" var="questions">
            <%--<c:choose>--%>
                <c:if test="${questions.id>=21 && questions.id<=40}">
                    <c:if test="${questions.id==21}">
                        <h1><c:out value="${sectionB}"></c:out></h1>
                    </c:if>
                    <tr>
                        <td>${questions.id}. ${questions.question}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="A">  A. ${questions.optionA}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="B">  B. ${questions.optionB}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="C">  C. ${questions.optionC}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="D">  D. ${questions.optionD}</td>
                    </tr>
                    <tr><td>        </td></tr>
                </c:if>
            <%--</c:choose>--%>
        </c:forEach>
    </table>
    <table class="table">
        <c:forEach items="${questionsList}" var="questions">
            <%--<c:choose>--%>
                <c:if test="${questions.id>=41 && questions.id<=60}">
                    <c:if test="${questions.id==41}">
                        <h1><c:out value="${sectionC}"></c:out></h1>
                    </c:if>
                    <tr>
                        <td>${questions.id}. ${questions.question}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="A">  A. ${questions.optionA}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="B">  B. ${questions.optionB}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="C">  C. ${questions.optionC}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="D">  D. ${questions.optionD}</td>
                    </tr>
                    <tr><td>        </td></tr>
                </c:if>
            <%--</c:choose>--%>
        </c:forEach>
    </table>
    <table class="table">
        <c:forEach items="${questionsList}" var="questions">
            <%--<c:choose>--%>
                <c:if test="${questions.id>=61 && questions.id<=80}">
                    <c:if test="${questions.id==61}">
                        <h1><c:out value="${sectionD}"></c:out></h1>
                    </c:if>
                    <tr>
                        <td>${questions.id}. ${questions.question}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="A">  A. ${questions.optionA}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="B">  B. ${questions.optionB}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="C">  C. ${questions.optionC}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="D">  D. ${questions.optionD}</td>
                    </tr>
                    <tr><td>        </td></tr>
                </c:if>
            <%--</c:choose>--%>
        </c:forEach>
    </table>
    <table class="table">
        <c:forEach items="${questionsList}" var="questions">
            <%--<c:choose>--%>
                <c:if test="${questions.id>=81 && questions.id<=90}">
                    <c:if test="${questions.id==81}">
                        <h1><c:out value="${sectionE}"></c:out></h1>
                    </c:if>
                    <tr>
                        <td>${questions.id}. ${questions.question}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="A">  A. ${questions.optionA}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="B">  B. ${questions.optionB}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="C">  C. ${questions.optionC}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name='${name}' value="D">  D. ${questions.optionD}</td>
                    </tr>
                    <tr><td>        </td></tr>
                </c:if>
            <%--</c:choose>--%>
        </c:forEach>
    </table>
</div>

</body>
</html>
