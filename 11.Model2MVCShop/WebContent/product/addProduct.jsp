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

		<!--  ///////////////////////// CSS ////////////////////////// -->
			<style>
		       body > div.container{
		        	border: 3px solid #D6CDB7;
		            margin-top: 10px;
		        }
		    </style>

		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
		<script type="text/javascript">

			$(function(){
				$('button.btn.btn-primary').on('click', function(){
					self.location="/product/listProduct?menu=manage"
				});
				
				$('a[href="#"]').on('click', function(){
					self.location="/product/addProductView.jsp;"
				});
			});

		</script>
	</head>
	
	<body>
	
		<div class="navbar navbar-default">
			<div class="container">
				<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
			</div>
		</div>
		
				<div class="container">
		
			<h1 class="bg-primary text-center">상 품 등 록</h1>
			
			<form class="form-horizontal" enctype="multipart/form-data">
			
				<div class="form-group">
					<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
					<div class="col-sm-4">
						${ product.prodName }
					</div>				
				</div>

				<div class="form-group">
					<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상세정보</label>
					<div class="col-sm-4">
						${ product.prodDetail }
					</div>		
				</div>
				
				<div class="form-group">
					<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
					<div class="col-sm-4">
						${ product.manuDate }
					</div>		
				</div>
				
				<div class="form-group">
					<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
					<div class="col-sm-4">
						${ product.price }
					</div>		
				</div>
				
				<div class="form-group">
					<label for="file" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
					<div class="col-sm-4">
						${ product.fileName }
					</div>		
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-4 text-center">
						<button type="button" class="btn btn-primary">확인</button>
						<a class="btn btn-primary btn" href="#" role="button">추가등록</a>
					</div>
				</div>
			</form>
		</div>
	
	</body>

</html>
