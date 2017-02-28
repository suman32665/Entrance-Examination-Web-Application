<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: suman maharjan
  Date: 09/09/2016
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
  <head>
    <title>DAT Online</title>
      <link rel="stylesheet" type="text/css" href="CSS/style.css">
  </head>

  <body>

  <div class="container">
      <section id="content">
          <form method="post" action="login">
              <input type="hidden" name="page" value="login">
              <h1>DWIT Aptitude Test</h1>
              <h4><c:out value="${message}"></c:out></h4>
              <div>
                  <input type="text" placeholder="Username" required="" name="username" id="username"/>
              </div>
              <div>
                  <input type="password" placeholder="Password" required="" name="password" id="password"/>
              </div>
              <div>
                  <input type="submit" value="Let me in">
              </div>
          </form>
      </section>
  </div>

  </body>
</html>
