<%@ page import="java.util.ArrayList" %>
<%@ page import="com.claim.bookstore.model.Book" %>
<%--
  Created by IntelliJ IDEA.
  User: Abram
  Date: 7/31/2015
  Time: 7:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Books</title>
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

<h2>Search Results</h2>
<br>

<%
    ArrayList<Book> bookList = new ArrayList<>((ArrayList<Book>) request.getAttribute("bookList"));
    if (bookList.size() == 0) {
        %><h2 class="content">This database has literally never heard of that book. You should do better next time.</h2>
<%
    } else {
%>

<div class="content">
    <table>
        <tr>
            <td>ID</td>
            <td>Title</td>
            <td>Author</td>
        </tr>
        <tr></tr>
        <%
            String url = "book.jsp?id=";
            for (int i = 0; i < bookList.size(); i++) { %>
        <tr>
            <td>
                <%= bookList.get(i).getId()%>
            </td>
            <td><a class="listLink" href=<%= url + bookList.get(i).getId()%>>
                <%= bookList.get(i).getTitle()%></a></td>
            <td><%= bookList.get(i).getAuthors()%></td>
        </tr>
        <%}
        %>
    </table>
</div>
<%
    }
%>

</body>
</html>
