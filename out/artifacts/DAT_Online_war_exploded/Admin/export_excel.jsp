<%@ page import="domains.Student" %>
<%@ page import="java.util.List" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: suman maharjan
  Date: 07/10/2016
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<link rel="stylesheet" type="text/css" href="CSS/style.css">--%>
    <%--<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <title>Export to Excel</title>
</head>
<body>
    <table cellpadding="1" cellspacing="1" border="1" bordercolor="gray">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Roll No.</th>
            <th>Marks</th>
            <th>Attempts Left</th>
        </tr>
        <%
        List<Student> students=(List<Student>)request.getAttribute("studentList");
        if (students!=null){
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "inline; filename="+"Student_Result.xls");
        }
            for (Student std: students){
        %>
            <tr>
                <td><%=std.getId()%></td>
                <td><%=std.getName()%></td>
                <td><%=std.getRoll()%></td>
                <td><%=std.getScore()%></td>
                <td><%=std.getAttempt()%></td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>
