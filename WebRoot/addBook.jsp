
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    
    <div class="modal fade" id="addBookModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="addBookModalLabel"  >新增图书</h4>
      </div>
      <div class="modal-body">
		  
	  	<form class="form-horizontal" role="form" action="addBook" method="get">
	  	  
	  	  <div class="addBook">
	  	  <div class="form-group">
		    <label for="inputTitle" class="col-sm-2 control-label">标题</label>
		    <div class="col-sm-10">
		      <input type="text" id="inputTitle" class="form-control" name="book.title" placeholder="Title">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="inputAuthorName" class="col-sm-2 control-label">作者</label>
		    <div class="col-sm-10">
		      <input type="text" id="inputAuthorName" class="form-control" name="book.author" placeholder="Author">
		    </div>
		  </div>
		  <div class="addAuthor" style="display: none" id="addAuthorDiv">
    	  	<div class="form-group">
		    	<label for="inputAuthorAge" class="col-sm-2 control-label">作者年龄</label>
		    	<div class="col-sm-10">
		      		<input type="text" id="inputAuthorAge" class="form-control" name="author.age" placeholder="Author age">
		    	</div>
		  	</div>
		  	<div class="form-group">
		    	<label for="inputAuthorCountry" class="col-sm-2 control-label">作者国籍</label>
		    	<div class="col-sm-10">
		      		<input type="text" id="inputAuthorCountry" class="form-control" name="author.country" placeholder="Author country">
		    	</div>
		  	</div>

    	  </div>
		  
		  <div class="form-group">
		    <label for="inputISBN" class="col-sm-2 control-label">ISBN</label>
		    <div class="col-sm-10">
		      <input type="text" id="inputISBN" class="form-control" name="book.ISBN" placeholder="ISBN">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="inputPublisher" class="col-sm-2 control-label">出版商</label>
		    <div class="col-sm-10">
		      <input type="text" id="inputPublisher" class="form-control" name="book.publisher" placeholder="Publisher">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="inputDate" class="col-sm-2 control-label">出版日期</label>
		    <div class="col-sm-10">
		    	<input type="text" id="inputDate" class="form-control" name="book.publishDate" readonly="readonly">
			</div>
		  </div>
		  
		  <div class="form-group">
		    <label for="inputPrice" class="col-sm-2 control-label">价格</label>
		    <div class="col-sm-10">
		      <input type="text" id="inputPrice" class="form-control" name="book.price" placeholder="Price">
		    </div>
		  </div>
		  </div>
		  		  
	  	</form>
	  		<div class="alert alert-success alert-dismissible" role="alert" id="new-author-alert"  style="display: none">
			  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			  <strong>Warning!</strong> 作者不存在，需新增作者信息！
			</div>
	  	</div>
      
      <div class="modal-footer">
        <button id="btn-reset" type="button" class="btn btn-default" >重置</button>
        <button id="btn-submit" type="button" class="btn btn-primary">提交</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
    $(function () {
        $("#inputDate").datepicker({
            language: "zh-CN",
            autoclose: true,//选中之后自动隐藏日期选择框
            todayBtn: "linked",//今日按钮
            format: "yyyy-mm-dd"//日期格式，详见 http://bootstrap-datepicker.readthedocs.org/en/release/options.html#format
        });
    });
</script>

<script type="text/javascript">

	var validateAuthor = function(name) {
		var flag = "";
		$.ajax({
			url : "validateAuthor",
			type : "post",
			async : false,
			data:{
				"book.author" : name,
			}, 
			success : function(data){
				flag = data;
			}
		});
		return flag;
	};

	$(document).ready(function(){

		$("#inputAuthorName").blur(function(){
			var name = $("#inputAuthorName").val();	
			var author_id = validateAuthor(name);
			if(author_id == "") {
				$("#addAuthorDiv").show();
				$("#new-author-alert").show();
				$("#inputAuthorAge").focus();
			}
		});
		$("#btn-submit").click(function(){
			var name = $("#inputAuthorName").val();
			var author_id = validateAuthor(name);
			if(author_id != ""){
				$.post("addBook",
				{
					"book.ISBN" 	: $("#inputISBN").val(),
					"book.authorID"	: author_id,
					"book.title"	: $("#inputTitle").val(),
					"book.publisher"	: $("#inputPublisher").val(),
					"book.publishDate"	: $("#inputDate").val(),
					"book.price"	: $("#inputPrice").val(),
				},function(data, status){
					window.location.href = "index";
				});
			} else {
				$.post("addAuthorAndBook",
				{
					"book.ISBN" 	: $("#inputISBN").val(),
					"book.authorID"	: author_id,
					"book.title"	: $("#inputTitle").val(),
					"book.publisher"	: $("#inputPublisher").val(),
					"book.publishDate"	: $("#inputDate").val(),
					"book.price"	: $("#inputPrice").val(),
					"author.name" 	: name,
					"author.age" 	: $("#inputAuthorAge").val(),
					"author.country": $("#inputAuthorCountry").val(),
				},function(data, status){
					window.location.href = "index";
				});
			}
		});
		$("#btn-reset").click(function(){
			$("#inputISBN").val("");
			$("#inputTitle").val("");
			$("#inputPublisher").val("");
			$("#inputDate").val("");
			$("#inputPrice").val("");
			$("#inputAuthorAge").val("");
			$("#inputAuthorCountry").val("");
			$("#inputAuthorName").val("");
		});
	});

	var validateInput = function(input) {
		if($("#inputISBN").val() == "") return false;
		if($("#inputTitle").val() == "") return false;
	};
</script>
