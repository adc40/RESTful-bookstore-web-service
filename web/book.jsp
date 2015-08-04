<%@ page import="com.claim.bookstore.dao.BookDataAccess" %>
<%@ page import="com.claim.bookstore.model.Book" %>
<%--
  Created by IntelliJ IDEA.
  User: Abram
  Date: 7/31/2015
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book</title>
    <link rel="stylesheet" type="text/css" href="./bookstore.css">
</head>
<body>

<div class="nav">
  <ul>
    <li class="left"><a class="navlink" href="index.jsp">Home</a></li>
    <li class="right"><form method="get" action="getBook"><input type="search" name="title"
                placeholder="Search Book Title..."/><input type="submit" value="Search"></form></li>
    <li class="right"><a class="navlink" href="addBook.jsp">Add Book</a></li>
    <li class="right"><a class="navlink" href="allBooks.jsp">All Books</a></li>
  </ul>
</div>

<%
  BookDataAccess bookDao = new BookDataAccess();
  Book book = bookDao.getBook(Integer.valueOf(request.getParameter("id")));
%>

<div class="content">
    <table>
        <tr>
            <td>ID</td>
            <td>Title</td>
            <td>Author</td>
            <td>Category</td>
            <td>Year</td>
        </tr>
        <tr></tr>
        <tr>
            <td>
                <%= book.getId()%>
            </td>
            <td>
                <%= book.getTitle()%>
            </td>
            <td>
                <%= book.getAuthors()%>
            </td>
            <td>
                <%= book.getCategory()%>
            </td>
            <td>
                <%= book.getYear()%>
            </td>
        </tr>
    </table>
    <br>
    <form method="post" action="book" >
        <input type="text" name="id" disabled="disabled" value="<%= book.getId()%>">
    <input type="submit" value="Delete from Database">
    </form>
</div>

</body>
</html>
