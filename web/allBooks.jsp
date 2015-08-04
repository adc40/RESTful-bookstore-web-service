<%@ page import="com.claim.bookstore.dao.BookDataAccess" %>
<%@ page import="com.claim.bookstore.model.Book" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Abram
  Date: 7/30/2015
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Books</title>
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

<h2>All Books in Database</h2>
<br>

<div class="content">
    <table>
        <tr>
            <td>ID</td>
            <td>Title</td>
            <td>Author</td>
        </tr>
        <tr></tr>
    <% BookDataAccess bookDao = new BookDataAccess();
        List<Book> allBooks = bookDao.allBooks();
        String url = "book.jsp?id=";
        for (int i = 0; i < allBooks.size(); i++) { %>
        <tr>
            <td>
                <%= allBooks.get(i).getId()%>
            </td>
            <td><a class="listLink" href=<%= url + allBooks.get(i).getId()%>>
                <%= allBooks.get(i).getTitle()%></a></td>
            <td><%= allBooks.get(i).getAuthors()%></td>
        </tr>
        <%}
    %>
        </table>
    </div>
    </body>
</html>
