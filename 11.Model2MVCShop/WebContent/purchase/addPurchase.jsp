<%@ page contentType="text/html; charset=EUC-KR"%>
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
				
				$("button.btn.btn-primary").on("click", function(){
					self.location="/purchase/listPurchase?userId="+$("#buyerId").val();
				});
				
				$('a[href="#"]').on("click", function(){
					self.location="/product/listProduct?menu=search";
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
			<h1 class="bg-primary text-center">�� �� Ȯ ��</h1>

			<form class="form-horizontal">
				<input type="hidden" id="buyerId" name="buyerId" value="${ purchase.buyer.userId }">
				<input type="hidden" id="tranNo" name="tranNo" value="${ purchase.tranNo }">
				<div class="form-group">
					<label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ �� ȣ</label>
					<div class="col-sm-4">
						${ purchase.purchaseProd.prodNo }
					</div>				
				</div>
				
				<div class="form-group">
					<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">������ID</label>
					<div class="col-sm-4">
						${ purchase.buyer.userId }
					</div>				
				</div>
				
				<div class="form-group">
					<label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
					<div class="col-sm-4">
						${ purchase.paymentOption }
					</div>				
				</div>
				
				<div class="form-group">
					<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
					<div class="col-sm-4">
						${ purchase.receiverName }
					</div>				
				</div>
				
				<div class="form-group">
					<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
					<div class="col-sm-4">
						${ purchase.receiverPhone }
					</div>				
				</div>
				
				<div class="form-group">
					<label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
					<div class="col-sm-4">
						${ purchase.divyAddr }
					</div>				
				</div>
				
				<div class="form-group">
					<label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
					<div class="col-sm-4">
						${ purchase.divyRequest }
					</div>				
				</div>
				
				<div class="form-group">
					<label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
					<div class="col-sm-4">
						${ purchase.divyDate }
					</div>				
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-4 text-center">
						<button type="button" class="btn btn-primary">���Ÿ��Ȯ��</button>
						<a class="btn btn-primary btn" href="#" role="button">��ǰ���</a>
					</div>
				</div>
			</form>
			
		</div>
	
	</body>
	
</html>