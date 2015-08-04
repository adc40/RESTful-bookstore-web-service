package com.claim.bookstore.dao;

import com.claim.bookstore.model.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Abram on 7/30/2015.
 */
public class BookDataAccess {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore",
                "root", "tonka1");
    }

    private void closeConnection(Connection connection) {
        if (connection == null)
            return;
        try {
            connection.close();
        } catch (SQLException ex) {
        }
    }

    public List<Book> allBooks () {
        ArrayList<Book> bookList = new ArrayList<>();
        String sql = "select * from book";
        Connection conn = null;
        try {
            conn = getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Book book = new Book();
                book.setId(resultSet.getInt("Id"));
                book.setTitle(resultSet.getString("Title"));
                book.setCategory(resultSet.getString("Category"));
                book.setAuthors(resultSet.getString("Author"));
                book.setYear(resultSet.getInt("year"));
                bookList.add(book);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(conn);
        }
        return bookList;
    }

    public void addBook(Book book) {
        Connection connection = null;
        try {
            connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(
                    "insert into Book (title, author, category, year) values (?, ?, ?, ?)");
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthors());
            statement.setString(3, book.getCategory());
            statement.setInt(4, book.getYear());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
    }

    public ArrayList<Book> search(String title) {
        ArrayList<Book> bookList = new ArrayList<>();
        Connection connection = null;
        try {
            connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(
                    "select *  from Book where title like '%" + title.trim() + "%'");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Book book = new Book();
                book.setId(resultSet.getInt("Id"));
                book.setTitle(resultSet.getString("Title"));
                book.setCategory(resultSet.getString("Category"));
                book.setAuthors(resultSet.getString("Author"));
                book.setYear(resultSet.getInt("year"));
                bookList.add(book);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return bookList;
    }

    public Book getBook(int id) {
        Connection connection = null;
        Book book = new Book();
        try{
            connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(
                    "select * from Book where id = ?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                book.setId(id);
                book.setTitle(resultSet.getString("Title"));
                book.setCategory(resultSet.getString("Category"));
                book.setAuthors(resultSet.getString("Author"));
                book.setYear(resultSet.getInt("year"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return book;
    }

    public void delete(int id) {
        Connection connection = null;
        try {
            connection = getConnection();
            PreparedStatement statement = connection.prepareStatement("delete from book where id=?");
            statement.setInt(1, id);
            statement.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
    }
}
