<%@ page contentType="text/html; charset=EUC-KR"%>
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
				$('button.btn.btn-primary').on('click', function(){
					self.location="/purchase/updatePurchaseView?tranNo="+$('#tranNo').val()+"&buyerId="+$('#buyerId').val();
				});
			});
			
			$(function(){
				$('button.btn.btn-primary:contains("상품평")').on('click', function(){
					self.location="/bbsEval/writeBbsEvalView.jsp?prodNo="+$('#prodNo').val();
				});
			});
			
			$(function(){
				$('a[href="#"]').on('click', function(){
					history.go(-1);
				});
			});

		</script>

	</head>
	
	<body>
	
		<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	
		<form class="form-inline" name="detailForm">
		
			<div class="container">
			
				<div class="page-header">
					<h3 class="text-info">구매상세조회</h3>
				</div>
				
				<input type="hidden" id="tranNo" name="tranNo" value="${ purchase.tranNo }"/>
				<input type="hidden" id="prodNo" name="prodNo" value="${ purchase.purchaseProd.prodNo }"/>
				<input type="hidden" id="prodName" name="prodName" value="${ purchase.purchaseProd.prodName }"/>
				<input type="hidden" id="buyerId" name="buyerId" value="${ purchase.buyer.userId }"/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>상 품 번 호</strong></div>
					<div class="col-xs-8 col-md-4">${ purchase.purchaseProd.prodNo }</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>상 품 명</strong></div>
					<div class="col-xs-8 col-md-4">${ purchase.purchaseProd.prodName }</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>구매자ID</strong></div>
					<div class="col-xs-8 col-md-4">${ purchase.buyer.userId }</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>구 매 방 법</strong></div>
					<div class="col-xs-8 col-md-4">
						<c:if test="${ purchase.paymentOption==001 }">
							현금구매
						</c:if>
						<c:if test="${ purchase.paymentOption==002 }">
							신용구매
						</c:if>
					</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>구매자이름</strong></div>
					<div class="col-xs-8 col-md-4">${ purchase.receiverName }</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>구매자연락처</strong></div>
					<div class="col-xs-8 col-md-4">${ purchase.receiverPhone }</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>구매요청사항</strong></div>
					<div class="col-xs-8 col-md-4">${ purchase.divyRequest }</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>배송희망일</strong></div>
					<div class="col-xs-8 col-md-4">${ purchase.divyDate }</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>주 문 일 자</strong></div>
					<div class="col-xs-8 col-md-4">${ purchase.orderDate }</div>
				</div>				
				
				<div class="row">
					<div class="col-md-12 text-center">
						<c:if test="${ purchase.tranCode==001 }">
							<button type="button" class="btn btn-primary">수정</button>
						</c:if>
						<c:if test="${ purchase.tranCode==003 }">
							<button type="button" class="btn btn-primary">상품평작성</button>
						</c:if>
						<a class="btn btn-primary btn" href="#" role="button">이전</a>
					</div>
				</div>
			
			</div>
		
		</form>
	
	</body>

</html>