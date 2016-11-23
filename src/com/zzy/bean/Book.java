package com.zzy.bean;

public class Book {
	public final static String AUTHORID_STR = "AuthorID";
	public final static String PUBLISHDATE_STR = "PublishDate";
	public final static String ISBN_STR = "ISBN";
	public final static String PRICE_STR = "Price";
	public final static String PUBLISHER_STR = "Publisher";
	public final static String TITLE_STR = "Title";
	
	public Book() {}
	
	public Book(String title, String author, String iSBN,
			String authorID, String publisher, String price,String publishDate) {
		this.title = title;
		this.author = author;
		this.ISBN = iSBN;
		this.publishDate = publishDate;
		this.authorID = authorID;
		this.publisher = publisher;
		this.price = price;
	}


	private String title;
	private String author;
	private String ISBN;
	private String authorID;
	private String publisher;
	private String publishDate;

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getAuthorID() {
		return authorID;
	}
	public void setAuthorID(String authorID) {
		this.authorID = authorID;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}


	private String price;
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}

}
 