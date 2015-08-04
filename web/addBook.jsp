<%--
  Created by IntelliJ IDEA.
  User: Abram
  Date: 7/30/2015
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" type="text/css" href="./bookstore.css">
</head>
<body>
<div class="nav">
  <ul>
    <li class="left"><a class="navLink" href="index.jsp">Home</a></li>
      <li class="right"><form method="get" action="getBook"><input type="search" name="title"
                    placeholder="Search Book Title..."/><input type="submit" value="Search"></form></li>
    <li class="right"><a class="navLink" href="addBook.jsp">Add Book</a></li>
    <li class="right"><a class="navLink" href="allBooks.jsp">All Books</a></li>
  </ul>
</div>
<div class="content">
<form method="post" action="addBook">
  <table>
    <tr>
      <td>
        Book Title:
      </td>
      <td>
        <input type="text" name="title" />
      </td>
    </tr>
    <tr>
      <td>
        Author Name:
      </td>
      <td>
        <input type="text" name="author" />
      </td>
    </tr>
    <tr>
      <td>
        Category:
      </td>
      <td>
        <input type="text" name="category" />
      </td>
    </tr>
    <tr>
      <td>
        Year:
      </td>
      <td>
        <input type="text" name="year" />
      </td>
    </tr>
  </table>
    <input type="submit" value="Add Book">
    <input type="reset" value="Clear">
</form>
</div>

</body>
</html>
