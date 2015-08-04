package com.claim.bookstore.controller;

import com.claim.bookstore.dao.BookDataAccess;
import com.claim.bookstore.model.Book;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by Abram on 7/30/2015.
 */
public class BookController extends HttpServlet {

    BookDataAccess bookDao = new BookDataAccess();

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        if (title == null) title = "";

        ArrayList<Book> bookList = bookDao.search(title);
        request.setAttribute("bookList", bookList);

        RequestDispatcher rd = request.getRequestDispatcher("listBooks.jsp");
        rd.forward(request, response);

    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        Book book = new Book();
        book.setTitle(request.getParameter("title"));
        book.setAuthors(request.getParameter("author"));
        book.setCategory(request.getParameter("category"));
        book.setYear(Integer.valueOf(request.getParameter("year")));

        bookDao.addBook(book);

        response.sendRedirect("allBooks.jsp");

    }

}
