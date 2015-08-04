<%--
  Created by IntelliJ IDEA.
  User: Abram
  Date: 7/30/2015
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Bookstore</title>
    <link rel="stylesheet" type="text/css" href="./bookstore.css">
  </head>
  <body>
  <div class="nav">
      <ul>
          <li class="left"><a class="navlink" href="index.jsp">Home</a></li>
          <li class="right"><form method="get" action="getBook"><input type="search" name="title" placeholder="Search Book Title..."/>
              <input type="submit" value="Search"></form></li>
          <li class="right"><a class="navlink" href="addBook.jsp">Add Book</a></li>
          <li class="right"><a class="navlink" href="allBooks.jsp">All Books</a></li>
      </ul>
  </div>
  <br>
  <h1>Welcome to the Bookstore!</h1>
  <br>
  </body>
</html>
