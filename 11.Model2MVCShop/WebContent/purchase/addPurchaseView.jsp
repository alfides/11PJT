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

		<!--  ///////////////////////// CSS ////////////////////////// -->
			<style>
		       body > div.container{
		        	border: 3px solid #D6CDB7;
		            margin-top: 10px;
		        }
		    </style>
	
	
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
  		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript">
		
		$(function(){
		    $("#datepicker").datepicker({
				dateFormat : 'yymmdd'
		    });
		});

			function fncAddPurchase() {
				//document.addPurchase.submit();
				$('form').attr('method','POST').attr("action","/purchase/addPurchase").submit();
			}
			$(function(){
				$('button.btn.btn-primary').on('click',function(){
					fncAddPurchase();
				});
			});
			
			$(function(){
				$('a[href="#"]').on('click',function(){
					history.go(-1);
				});
			});

		
		</script>
	</head>
	
	<body>
		
		<jsp:include page="/layout/toolbar.jsp"/>
	
		<div class="navbar navbar-default">
			<div class="container">
				<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
			</div>
		</div>
	
		<div class="container">
		
			<h1 class="bg-primary text-center">상 품 구 매</h1>
		
			<form class="form-horizontal">
			<input type="hidden" name="tranCode" value="001">
			<input type="hidden" name="prodNo" value="${ purchase.purchaseProd.prodNo }" />
							
				<div class="form-group">
					<label for="prodName" 
						class="col-sm-offset-1 col-sm-3 control-label">
						상 품 명
					</label>
					<div class="col-sm-4">
						${ purchase.purchaseProd.prodName }
					</div>
				</div>
				
				<div class="form-group">
					<label for="prodDetail" 
						class="col-sm-offset-1 col-sm-3 control-label">
						상 세 정 보
					</label>
					<div class="col-sm-4">
						${ purchase.purchaseProd.prodDetail }
					</div>
				</div>
				
				<div class="form-group">
					<label for="manuDate" 
						class="col-sm-offset-1 col-sm-3 control-label">
						제 조 일 자
					</label>
					<div class="col-sm-4">
						${ purchase.purchaseProd.manuDate }
					</div>
				</div>
				
				<div class="form-group">
					<label for="price" 
						class="col-sm-offset-1 col-sm-3 control-label">
						가 격
					</label>
					<div class="col-sm-4">
						${ purchase.purchaseProd.price }
					</div>
				</div>
				
				<div class="form-group">
					<label for="regDate" 
						class="col-sm-offset-1 col-sm-3 control-label">
						등 록 일 자
					</label>
					<div class="col-sm-4">
						${ purchase.purchaseProd.regDate }
					</div>
				</div>
				
				<div class="form-group">
					<label for="userId" 
						class="col-sm-offset-1 col-sm-3 control-label">
						구매자ID
					</label>
					<div class="col-sm-4">
						<input type="hidden" name="buyerId" value="${ purchase.buyer.userId }"/>
						${ purchase.buyer.userId }
					</div>
				</div>
				
				<div class="form-group">
					<label for="paymentOption" 
						class="col-sm-offset-1 col-sm-3 control-label">
						구 매 방 법
					</label>
					<div class="col-sm-4">
						<select name="paymentOption" class="form-control" 
							style="width: 120px; height: 35px" maxLength="20">
							<option value="001">현금구매</option>
							<option value="002">신용구매</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label for="receiverName" 
						class="col-sm-offset-1 col-sm-3 control-label">
						구매자이름
					</label>
					<div class="col-sm-4">
						<input type="text" name="receiverName" 	
						class="form-control" id="receiverName" 
						style="width: 100px; height: 20px" maxLength="20" 
						value="${ purchase.buyer.userName }" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="receiverPhone" 
						class="col-sm-offset-1 col-sm-3 control-label">
						구매자연락처
					</label>
					<div class="col-sm-4">
						<input type="text" name="receiverPhone" 	
						class="form-control" id="receiverPhone" 
						style="width: 100px; height: 20px" maxLength="20" 
						value="${ purchase.buyer.phone }" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="divyAddr" 
						class="col-sm-offset-1 col-sm-3 control-label">
						구매자주소
					</label>
					<div class="col-sm-4">
						<input type="text" name="divyAddr" 	
						class="form-control" id="divyAddr" 
						style="width: 150px; height: 20px" maxLength="20" 
						value="${ purchase.buyer.addr }" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="divyRequest" 
						class="col-sm-offset-1 col-sm-3 control-label">
						구매요청사항
					</label>
					<div class="col-sm-4">
						<input type="text" name="divyRequest" 	
						class="form-control" id="divyRequest" 
						style="width: 300px; height: 100px" maxLength="20"/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="divyDate" 
						class="col-sm-offset-1 col-sm-3 control-label">
						배송희망일자
					</label>
					<div class="col-sm-4">
						<input type="text" readonly="readonly" name="divyDate" 
						 id="datepicker" size="12"/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-4 text-center">
						<button type="button" class="btn btn-primary">구매</button>
						<a class="btn btn-primary btn" href="#" role="button">취소</a>
					</div>
				</div>		
				
			
			</form>
		
		</div>
	
	</body>

</html>