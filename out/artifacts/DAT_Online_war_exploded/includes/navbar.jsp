<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="nav">
    <ul>
        <li><a href="home?page=home">Home</a></li>
        <li><a href="view_paper?page=view_paper">View Paper</a></li>
        <li><a href="view_result?page=view_result">View Result</a></li>
        <li><a href="pdelete?page=pdelete">Delete Paper</a></li>
        <li><a href="logout?page=logout" >Logout [<c:out value="${admin.name}"></c:out>]</a></li>
    </ul>
</div>