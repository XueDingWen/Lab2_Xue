<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zzy.dao.*,com.zzy.bean.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    
    <title>查看详细信息</title>
  </head>  
    
  <body>
 <div class="container" style="width:60%;margin-top:20px">
<form class="form-horizontal" role="form" >
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3>图书信息</h3>
	</div>
	<div class="panel-body">
	<div class="form-group">
	  <label for="showTitle" class="col-sm-2 control-label">标题</label>
	  <div class="col-sm-10">
	    <input type="text" readonly="readonly" class="form-control" value="<s:property value='bookDetail.book.title' />" >
	  </div>
	</div>
	
	<div class="form-group">
	  <label for="showISBN"  class="col-sm-2 control-label">ISBN</label>
	  <div class="col-sm-10">
	    <input type="text" readonly="readonly" class="form-control" value="<s:property value='bookDetail.book.ISBN' />">
	  </div>
	</div>
	
	<div class="form-group">
	  <label for="showPublisher" class="col-sm-2 control-label">出版商</label>
	  <div class="col-sm-10">
	    <input type="text" readonly="readonly" class="form-control" value="<s:property value='bookDetail.book.publisher' />">
	  </div>
	</div>
	
	<div class="form-group">
	  <label for="showDate" class="col-sm-2 control-label">出版日期</label>
	  <div class="col-sm-10">
	    <input type="text" readonly="readonly" class="form-control" value="<s:property value='bookDetail.book.publishDate' />">
	  </div>
	</div>

	<div class="form-group">
	  <label for="showPrice" class="col-sm-2 control-label">价格</label>
	  <div class="col-sm-10">
	    <input type="text" readonly="readonly" class="form-control" value="<s:property value='bookDetail.book.price' />">
	  </div>
	</div>
	</div>
</div>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3>作者信息</h3>
	</div>
	
	<div class="panel-body">
	<div class="form-group">
	  <label for="showAuthor" class="col-sm-2 control-label">作者</label>
	  <div class="col-sm-10">
	    <input type="text" readonly="readonly" class="form-control" value="<s:property value='bookDetail.author.name' />">
	  </div>
	</div>
	<div class="form-group">
	  <label for="showAuthorAge" class="col-sm-2 control-label">作者年龄</label>
	  <div class="col-sm-10">
	    <input type="text" readonly="readonly" class="form-control" value="<s:property value='bookDetail.author.age' />">
	  </div>
	</div>	

	<div class="form-group">
	  <label for="showAuthorCountry" class="col-sm-2 control-label">作者国籍</label>
	  <div class="col-sm-10">
	    <input type="text" readonly="readonly" class="form-control" value="<s:property value='bookDetail.author.country' />">
	  </div>
	</div>	
	</div>
</div>		
</form>
</div>
  </body>	
</html>