<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<head>

	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<style>
	  body {
            padding-top : 50px;
        }
    </style>

  <script type="text/javascript">


	function fncGetList(currentPage) {
		$('#currentPage').val(currentPage);
		//document.getElementById("currentPage").value = currentPage;
		$('form').attr('method', 'POST').attr('action', '/bbsEval/listBbsEval').submit();
		
	 	//document.detailForm.submit();
	}
	
	$(function(){
		$('td:nth-child(4)').on('click', function(){
			var contentNo=$(this).parent().children("td:first").text().trim();
			self.location="/bbsEval/getBbsEval?contentNo="+contentNo+"&menu=search";
		});
	})
	
</script>

</head>

<body>

<jsp:include page="/layout/toolbar.jsp"/>

	<div class="container">
	
		<div class="page-header text-info">
			<h3>��ǰ��Խ���</h3>
		</div>
		
		<div class="row">
			<div class="col-md-6 text-left">
				<p class="text-primary">
					��ü  ${ resultPage.totalCount } �Ǽ�,	����  ${ resultPage.currentPage } ������
				</p>
			</div>

		
		<div class="col-md-6 text-right">
			<form class="form-inline" name="detailForm">
				<input type="hidden" id="menu" name="menu"/>
				<input type="hidden" id="currentPage" name="currentPage" value=""/>
				
					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0" ${ !empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>�ۼ���ID</option>
							<option value="1" ${ !empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
							<option value="2" ${ !empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>����</option>
						</select>
					</div>
					
					<div class="form-group">
						<label class="sr-only" for="searchKeyword">�˻���</label>
						<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="�˻���"
								value="${ ! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>
					
					<button type="button" class="btn btn-default">�˻�</button>
				
				</form>
			</div>
			</div>
			
		<table class="table table-hover table-striped">
		
			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">�ۼ���</th>
					<th align="left">��ǰ��</th>
					<th align="left">����</th>
					<th align="left">�����</th>
					<th align="left">����</th>
				</tr>
			</thead>
		
			<tbody>
			
				<c:set var="i" value="0"/>
				<c:forEach var="bbsEval" items="${ list }">
					<tr>
						<td align="center">${ bbsEval.contentNo }</td>
						<td align="left">${ bbsEval.bbsUser.userId }</td>
						<td align="left">${ bbsEval.bbsProd.prodName }</td>
						<td align="left">${ bbsEval.contentName }</td>
						<td align="left">${ bbsEval.regDate }</td>
						<td align="left">${ bbsEval.evalPoint }</td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
	
	</div>
		
			<jsp:include page="../common/pageNavigator_new.jsp"/>
			
</body>
	
</html>