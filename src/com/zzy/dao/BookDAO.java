package com.zzy.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.zzy.bean.Author;
import com.zzy.bean.Book;
import com.zzy.bean.BookDetail;
import com.zzy.bean.Status;

public class BookDAO {
	private DBConnection DBCon = new DBConnection();
	private List<Book> list = null;
	private ResultSet res = null;
	private final String TABLE_BOOK = "book";
	private final String TABLE_AUTHOR = "author";
	
	public Status addBook(Book book) {
		if(book == null)
			return Status.BOOK_IS_NULL;
		String sql = "insert into "+TABLE_BOOK+" values('"+
			book.getISBN()			+"','"+
			book.getTitle()			+"','"+
			book.getAuthorID()		+"','"+
			book.getPublisher()		+"','"+
			book.getPublishDate()	+"','"+
			book.getPrice()			+"'"+
		")";
		DBCon.execSql("SET NAMES UTF8");
		DBCon.execSql(sql); 
		return Status.ADD_BOOK_SUCCESS;
	}
	
	private Status addAuthor(Author author) {
		if(author == null) return Status.AUTHOR_IS_NULL;
		String sql = "insert into " + TABLE_AUTHOR + " values(NULL,'"+
				author.getName()		+"','"+
				author.getAge()			+"','"+
				author.getCountry()		+"'"+
			")";
		DBCon.execSql("SET NAMES UTF8");
		DBCon.execSql(sql);
		return Status.ADD_AUTHOR_SUCCESS;
	}
	
	public Status addAuthorAndBook(Author author, Book book) {
		if(book == null) 
			return Status.BOOK_IS_NULL;
		else {
			if(author == null) return Status.AUTHOR_IS_NULL; 
			addAuthor(author);
			String sql = "select AuthorID from author where name='"+author.getName()+"'";
			res = DBCon.select(sql);
			String AuthorID = "";
			try {
				if(res.next()){
					AuthorID = res.getString(Author.AUTHORID_STR);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			book.setAuthorID(AuthorID);
			addBook(book);
			return Status.ADD_AUTHOR_AND_BOOK_SUCESS;
		}
	}
	
	public boolean deleteBook(String isbn) {
		String sql = "delete from "+TABLE_BOOK+" where "+Book.ISBN_STR+"="+isbn;
		int st = DBCon.executeQuery(sql);
		return st == 1;
	}
	
	private Author getAuthorFromReset() {
		Author author = new Author();
		try {
			author.setAge(res.getString(Author.AGE_STR));
			author.setAuthorId(res.getString(Author.AUTHORID_STR));
			author.setCountry(res.getString(Author.COUNTRY_STR));
			author.setName(res.getString(Author.NAME_STR));
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return author;
	}

	private Book getBookFromResset() {
		Book book = new Book();
		try {
			book.setAuthorID(res.getString(Book.AUTHORID_STR));
			book.setPublishDate(res.getString(Book.PUBLISHDATE_STR));
			book.setISBN(res.getString(Book.ISBN_STR));
			book.setPrice(res.getString(Book.PRICE_STR));
			book.setPublisher(res.getString(Book.PUBLISHER_STR));
			book.setTitle(res.getString(Book.TITLE_STR));
		} catch (Exception e) {
			System.out.println("set book error");
			return null;
		}
		System.out.println(book.getAuthor());
		return book;
	}

	public List<Book> searchByAuthor(String AuthorName) {
		list = new ArrayList<Book>();
		String sql = "select * from " + TABLE_AUTHOR + " where name='"+AuthorName+"'";
		res = DBCon.select(sql);
		List<String> authorIds = new ArrayList<String>(); 
		try {
			while(res.next()){
				String id = res.getString("AuthorID");
				authorIds.add(id);
			}
			for(String id : authorIds) {
				sql = "select * from "+ TABLE_BOOK + " where AuthorID = " + id;
				res = DBCon.select(sql);
				while(res.next()) {
					Book book = getBookFromResset();
					list.add(book);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}

	public String getAuthorID(String author) {
		String sql = "select * from " + TABLE_AUTHOR + " where Name = '" + author +"';";
		res = DBCon.select(sql);
		try {
			if(res.next()){
				return res.getString(Author.AUTHORID_STR);
			} else return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public BookDetail viewBookDetail(String isbn) {
		BookDetail bookDetail = null;
		String sql = "select * from " + TABLE_BOOK + " where ISBN = "+isbn;
		res = DBCon.select(sql);
		try {
			if(res.next()) {
				Book book = getBookFromResset();
				String AuthorID = book.getAuthorID();
				sql = "select * from "+TABLE_AUTHOR+" where "+Author.AUTHORID_STR + "="+AuthorID;
				res = DBCon.select(sql);
				if(res.next()) {
					Author author = getAuthorFromReset();
					bookDetail = new BookDetail(book,author);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return bookDetail;
	}

	public List<Book> viewBookList() {
		System.out.println("BookDAO.viewBookList()");
		list = new ArrayList<Book>();
		String sql = "select * from " + TABLE_BOOK;
		res = DBCon.select(sql);
		try {
			while(res.next()) {
				System.out.println("has result");
				Book book = getBookFromResset();
				list.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
		}
		return list;
	}
}
