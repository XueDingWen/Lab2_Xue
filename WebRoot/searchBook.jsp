
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <div class="modal fade" id="searchBookModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
		  <div class="searchBook">
		  	<form class="form-horizontal" >
			    <div class="input-group">
			      <input id="input-search" type="text" class="form-control" name="book.author" placeholder="输入作者">
			   	  <span class="input-group-btn">
			 		<button id="btn-search" type="submit" class="btn btn-primary" data-dismiss="modal">搜索</button>
				  </span>
			    </div>
		  	</form>
		  	</div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$("#btn-search").click(function() {
			window.location.href = "searchByAuthor?author.Name="+$("#input-search").val();
		});
	});
</script>