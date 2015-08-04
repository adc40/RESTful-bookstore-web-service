package com.claim.bookstore.model;

import java.util.ArrayList;

/**
 * Created by Abram on 7/30/2015.
 */
public class Book {
    private int id;
    private String title;
    private String authors;
    private String category;
    private int year;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthors() {
        return authors;
    }

    public void setAuthors(String authors) {
        this.authors = authors;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String toString () {
        return id + " " + title + " - written by " + authors;
    }
}
