<%--
  Created by IntelliJ IDEA.
  User: suman maharjan
  Date: 10/09/2016
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test Paper</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="../JS/setquestions.js"></script>
    <script>
        var time="";
    var hour=2;
    var minutes=30;
    var sec=0;

    function timedText()
    {

        setTimeout(myTimeout1, 1000)
    }

    function myTimeout1()
    {
        if (sec==0){
            sec=60;
            minutes--;

            if (minutes==-1){
                minutes=59;
                hour--;
            }
        }
        sec--;

        if (sec<10 && minutes<10){
            time="0"+hour+":0"+minutes+":0"+sec;
        }else{
            if (minutes<10){
                time="0"+hour+":0"+minutes+":"+sec;
            }else{
                if (sec<10){
                    time="0"+hour+":"+minutes+":0"+sec;
                }else{
                    if (hour<0){
                        time="00:00:00"
                    }else{
                        time="0"+hour+":"+minutes+":"+sec;
                    }
                }
            }
        }
        document.getElementById("time").innerHTML=time;
        if (hour<0){
        }else{
            timedText();
        }
    }
    </script>
</head>
<body onload="timedText()">
<div id="templatemo_content_wrapper">
    <%--<%@include file="../includes/navbar.jsp" %>--%>
    <form method="post" action="submit_paper">
        <input type="hidden" name="page" value="submit_paper">
        <input type="hidden" name="student_roll" value="${student_roll}">

        <h3 align="right">Student's Name:<c:out value="${student_name}"></c:out></h3>
        <h3 align="right">Time Left: <span id="time"></span></h3>
        <table class="table">
            <%--<c:set var="id" value="0"></c:set>--%>
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
            <c:set var="string1" value="question answer"/>
            <c:set var="string2" value="${fn:split(string1,' ')}"/>
            <c:set var="name" value="${fn:join(string2, questions.id)}"/>
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
            <c:set var="string1" value="question answer"/>
            <c:set var="string2" value="${fn:split(string1,' ')}"/>
            <c:set var="name" value="${fn:join(string2, questions.id)}"/>
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
            <c:set var="string1" value="question answer"/>
            <c:set var="string2" value="${fn:split(string1,' ')}"/>
            <c:set var="name" value="${fn:join(string2, questions.id)}"/>
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
            <c:set var="string1" value="question answer"/>
            <c:set var="string2" value="${fn:split(string1,' ')}"/>
            <c:set var="name" value="${fn:join(string2, questions.id)}"/>
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
        <input type="submit" value=" SUBMIT " id="questionbutton">
    </form>
</div>

</body>
</html>
