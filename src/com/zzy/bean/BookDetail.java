package com.zzy.bean;

public class BookDetail {
	public BookDetail() {}
	
	private Book book;
	private Author author;
	
	public BookDetail(Book book, Author author) {
		this.book = book;
		this.author = author;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}
}
