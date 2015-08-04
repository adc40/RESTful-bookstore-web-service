package com.claim.bookstore.controller;

import com.claim.bookstore.dao.BookDataAccess;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Abram on 8/1/2015.
 */
public class Delete extends HttpServlet{

    BookDataAccess bookDao = new BookDataAccess();

    protected void doPost(HttpServletRequest request,
                            HttpServletResponse response) throws ServletException, IOException {
        bookDao.delete(Integer.valueOf(request.getParameter("id")));
        response.sendRedirect("allBooks.jsp");
    }
}
