package com.zzy.action;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.zzy.bean.Author;
import com.zzy.bean.Book;
import com.zzy.bean.BookDetail;
import com.zzy.bean.Status;
import com.zzy.dao.BookDAO;

public class BookAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private Book book = new Book();
	private List<Book> list = null;
	private BookDetail bookDetail = null;
	private BookDAO bookDao = new BookDAO();
	private Author author = new Author();
	private String bookisbn = "";
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getBookisbn() {
		return bookisbn;
	}

	public void setBookisbn(String bookisbn) {
		this.bookisbn = bookisbn;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public BookDetail getBookDetail() {
		return bookDetail;
	}

	public void setBookDetail(BookDetail bookDetail) {
		this.bookDetail = bookDetail;
	}

	public List<Book> getList() {
		return list;
	}

	public void setList(List<Book> list) {
		this.list = list;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public String addBook(){
		Status ans = bookDao.addBook(book); 
		return SUCCESS;
	}
	
	public String addAuthorAndBook() {
		Status ans = bookDao.addAuthorAndBook(author, book);
		return SUCCESS;
	}
	
	public String validateAuthor() {
		String ans = bookDao.getAuthorID(book.getAuthor());
		if(ans == null){
			try {
				inputStream = new ByteArrayInputStream("".getBytes("utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		else {
			try {
				inputStream = new ByteArrayInputStream(ans.getBytes("utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return SUCCESS;
	}
	
	public String deleteBook() {
		boolean ans = bookDao.deleteBook(bookisbn);
		return ans ? SUCCESS : ERROR;
	}
	
	public String viewBookList() {
		System.out.println("BookAction.viewBookList()");
		list = bookDao.viewBookList();
		return list == null ? ERROR : SUCCESS;
	}
	
	public String searchByAuthor() {
		if(author == null) return NONE;
		list = bookDao.searchByAuthor(author.getName());
		return list == null ? NONE : SUCCESS;
	}
	
	public String viewBookDetail() {
		bookDetail = bookDao.viewBookDetail(bookisbn);
		return bookDetail==null ? ERROR : SUCCESS;
	}
}
