<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
			<style>
			  body {
		            padding-top : 50px;
		        }
		    </style>
    
		<script type="text/javascript">
		
			function fncGetList(currentPage) {
				$('#currentPage').val(currentPage);
				$('form').attr('method','POST').attr('action','/purchase/listPurchase').submit();
			//document.getElementById("currentPage").value = currentPage;
		   	//document.detailForm.submit();	
			}
			$(function(){
		
				$('td:nth-child(1)').on('click', function(){
					self.location="/purchase/getPurchase?tranNo="+$(this).parent().find('#tranNo').val();
				});
				
				$('td:nth-child(3)').on('click', function(){
					self.location="/user/getUser?userId="+$(this).parent().find('#buyerId').val();
				})
				
				$('td:nth-child(8):contains("거래완료")').on('click', function(){
					self.location="/purchase/updateTranCode2?tranNo="+$(this).parent().find('#tranNo').val()+"&tranCode=003";
				});
				
				$('td:nth-child(8):contains("거래취소")').on('click', function(){
					self.location="/purchase/removePurchase?tranNo="+$(this).parent().find('#tranNo').val();
				});
			});
				
		</script>
	</head>

	<body>

		<jsp:include page="/layout/toolbar.jsp"/>
		
		<div class="container">
		
			<div class="page-header text-info">
				<h3>구매목록조회</h3>
			</div>
			
			<div class="row">
			
				<div class="col-md-6 text-left">
					<p class="text-primary">
						전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지	
					</p>
				</div>
			
				<div>
					<form class="form-inline" name="detailForm">
							<input type="hidden" id="currentPage" name="currentPage" value=""/>					
					</form>
				</div>
			
			</div>
			
			<table class="table table-hover table-striped">
			
				<thead>
					<tr>
						<th align="center">No</th>
						<th><input type="hidden"></th>
						<th align="left">회원ID</th>
						<th><input type="hidden"></th>
						<th align="left">회원명</th>
						<th align="left">전화번호</th>
						<th align="left">배송현황</th>
						<th align="left">수취확인</th>
					</tr>
				</thead>
				
				<tbody>
				
					<c:set var="i" value="0"/>
						<c:forEach var="purchase" items="${ list }">
							<c:set var="i" value="${ i+1 }"/>
								<tr>
									<td align="center">${ i }</td>
									<td><input type="hidden" id="tranNo" name="tranNo" value="${purchase.tranNo}"></td>
									<td align="left">${ purchase.buyer.userId }</td>
									<td><input type="hidden" id="buyerId" name="buyerId" value="${purchase.buyer.userId}"></td>
									<td align="left">${purchase.receiverName}</td>
									<td align="left">${purchase.receiverPhone}</td>
									<td align="left">현재
										<c:if test="${purchase.tranCode==001}">
											배송 준비
										</c:if>
										<c:if test="${purchase.tranCode==002}">
											배송중
										</c:if>
										<c:if test="${purchase.tranCode==003}">
											거래 완료
										</c:if>
											상태 입니다.</td>
									<td align="right">
										<c:if test="${purchase.tranCode==001}">
											거래취소
										</c:if>
										<c:if test="${purchase.tranCode==002}">
											거래완료
										</c:if>
									</td>
								</tr>
						</c:forEach>
				
				</tbody>
				
			</table>
		
		</div>
	
	<jsp:include page="../common/pageNavigator_new.jsp"/>

	</body>

</html>