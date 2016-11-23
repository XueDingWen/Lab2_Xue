  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
		<div align="right" style="margin-right: 10%;">
     		<span id="ico-add" class="glyphicon glyphicon-plus" data-toggle="tooltip" data-placement="left" title="新增图书"></span>
 			&nbsp;&nbsp;&nbsp;&nbsp;<span id="ico-search" class="glyphicon glyphicon-search" data-toggle="tooltip" data-placement="left" title="按作者查找"></span>
		</div>
     <script type="text/javascript">
		$(document).ready(function(){
			$("#ico-search").click(function(){
				$("#searchBookModal").modal("show");
			});
			$("#ico-add").click(function(){
				$("#addBookModal").modal("show");
			});
		});
     </script>