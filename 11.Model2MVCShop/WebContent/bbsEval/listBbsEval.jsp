<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<head>

	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
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
			<h3>상품평게시판</h3>
		</div>
		
		<div class="row">
			<div class="col-md-6 text-left">
				<p class="text-primary">
					전체  ${ resultPage.totalCount } 건수,	현재  ${ resultPage.currentPage } 페이지
				</p>
			</div>

		
		<div class="col-md-6 text-right">
			<form class="form-inline" name="detailForm">
				<input type="hidden" id="menu" name="menu"/>
				<input type="hidden" id="currentPage" name="currentPage" value=""/>
				
					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0" ${ !empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>작성자ID</option>
							<option value="1" ${ !empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>내용</option>
						</select>
					</div>
					
					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label>
						<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어"
								value="${ ! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>
					
					<button type="button" class="btn btn-default">검색</button>
				
				</form>
			</div>
			</div>
			
		<table class="table table-hover table-striped">
		
			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">작성자</th>
					<th align="left">제목</th>
					<th align="left">등록일</th>
					<th align="left">평점</th>
				</tr>
			</thead>
		
			<tbody>
			
				<c:set var="i" value="0"/>
				<c:forEach var="bbsEval" items="${ list }">
					<tr>
						<td align="center">${ bbsEval.contentNo }</td>
						<td align="left">${ bbsEval.bbsUser.userId }</td>
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