   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <div class="panel panel-primary" align="center">
  	<div class="panel panel-heading">
  		<h3 >图书信息列表</h3>
  	</div>
	<div class="panel panel-body" >
		<%@include file="menu.jsp" %>
     <table class="table table-striped table-hover " width="640">
     <thead >
     <tr class="success">
     	<td>ISBN号</td>
        <td>书名</td>
        <td>查看详情</td>
        <td>删除</td>
       
     </tr>
     </thead>
     <tbody>
   <s:iterator value="list" >
	<tr>
     	<td><span ><s:property value="ISBN"/></span></td>
        <td><span data-toggle="tooltip" data-placement="left" title="查看图书"><s:property value="title"/></span></td>
        <td><span name="ico-detail" class="glyphicon glyphicon-zoom-in" data-toggle="tooltip" data-placement="left" title="查看图书"></span></td>
        <td><span name="ico-del" class="glyphicon glyphicon-remove" data-toggle="tooltip" data-placement="left" title="删除图书"></span></td>
     </tr>
   </s:iterator>
   </tbody>
    </table>
   </div>
   </div>
<div class="alert alert-success alert-dismissible" role="alert" id="del-alert" style="display:none;" >
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>Warning!</strong> The book has been deleted!
</div>

   <script type="text/javascript">
   	$(document).ready(function(){
   		$("span[name='ico-del']").click(function(){
   			var isbn = $(this).parent("td").prev().prev().prev().children("span").text();
   			var obj = $(this);
			$.ajax({
				url:"deleteBook",
				type:"post",
				data:{bookisbn:isbn},
				success:function(data, status){
					if(status == "success"){
						obj.parent().parent().remove();
						$("#del-alert").show();
					}
				}
			});
   		});
   		
   		$("span[name='ico-detail']").click(function() {
   			var isbn = $(this).parent("td").prev().prev().children("span").text();
   			window.location.href = "viewBookDetail?bookisbn="+isbn;
   		});
   	});

   </script>