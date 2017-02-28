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
    <title>Add Student</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="../JS/setquestions.js"></script>
</head>
<body>

<div id="templatemo_content_wrapper">
    <%@include file="../includes/navbar.jsp" %>
    <h1>Add Student</h1>

    <form method="post" action="add_student">

        <input type="hidden" name="page" value="add_student">
        <table>
            <tr>
                <td><input type="text" name="numberOfStudent" id="numberOfStudent" placeholder="Number Of Student" required=""></td>
                <td> <input type="button" value="Submit" onclick="create_studentForm(document.getElementById('numberOfStudent').value)" id="questionbutton"></td>
            </tr>
        </table>
        <table id="tables" ></table>
        <%--<tr><td><input type="submit" value=" Add " id="questionbutton"></td></tr>--%>
    </form>
</div>

</body>
</html>
