package com.zzy.bean;

public class Author {
	public Author() {}
	
	private String AuthorId;
	private String name,country;
	private String age;
	
	public static final String AUTHORID_STR = "AuthorID";
	public static final String NAME_STR = "Name";
	public static final String AGE_STR = "Age";
	public static final String COUNTRY_STR = "Country";
	
	public String getAuthorId() {
		return AuthorId;
	}
	public void setAuthorId(String authorId) {
		AuthorId = authorId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
}
