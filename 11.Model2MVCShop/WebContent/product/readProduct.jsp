<%@ page contentType="text/html; charset=euc-kr"%>
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
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<style>
	 		body {
	            padding-top : 50px;
	        }
	     </style>
	    
	     <!--  ///////////////////////// JavaScript ////////////////////////// -->
		<script type="text/javascript">
		
			$(function(){
				$("button.btn.btn-primary").on("click", function(){
					self.location="/purchase/addPurchaseView?prodNo=${ product.prodNo }&userId=${ user.userId }"
				});
				
				$("a[href='#']").on("click", function(){
					history.go(-1);
				});
			});

		</script>

	</head>
	
	<body>
	
		<jsp:include page="/layout/toolbar.jsp"/>
		
		<form class="form-inline" name="detailForm" enctype="multipart/form-data">
			
			<div class="container">
			
				<div class="page-header">
					<h3 class="text-info">상품상세정보</h3>
				</div>
			
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>상 품 번 호</strong></div>
					<div class="col-xs-8 col-md-4">${ product.prodNo }</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>상 품 명</strong></div>
					<div class="col-xs-8 col-md-4">${ product.prodName }</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>상 품 이 미 지</strong></div>
					<div class="col-xs-8 col-md-4">
						<img src="../images/uploadFiles/${product.fileName}"/>
					</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>상 세 정 보</strong></div>
					<div class="col-xs-8 col-md-4">${ product.prodDetail }</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>제 조 일</strong></div>
					<div class="col-xs-8 col-md-4">${ product.manuDate }</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>가 격</strong></div>
					<div class="col-xs-8 col-md-4">${ product.price }</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>등 록 일 자</strong></div>
					<div class="col-xs-8 col-md-4">${ product.regDate }</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-md-12 text-center">
						<c:if test="${ purchase.tranCode eq null }">
							<button type="button" class="btn btn-primary">구매</button>
						</c:if>
						<a class="btn btn-primary btn" href="#" role="button">이전</a>
					</div>
				</div>
				
				<br/>
				
			</div>
		
		</form>
	
	</body>

</html>