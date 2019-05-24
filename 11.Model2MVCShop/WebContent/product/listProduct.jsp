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
		$('#menu').val('${param.menu}');
		alert($('#menu').val());
		alert($('form').serialize());
		//document.getElementById("currentPage").value = currentPage;
		$('form').attr('method', 'POST').attr('action', '/product/listProduct').submit();
		
	 	//document.detailForm.submit();
	}
	
	$(function(){
		var menu=$('#menu').val();
		
		$('button.btn.btn-default').on('click', function(){
			fncGetList(1);
		});
		
		if(${user.role=='admin'}){
			$(function(){
				$('td:nth-child(2)').on('click', function(){
					self.location="/product/getProduct?prodNo="+prodNo+"&menu="+menu;
				});
			});	
		};
		
		if(${user.role=='user'}){
			
			$('td:nth-child(6)').on('click', function(){
				var prodNo=$(this).parent().children('td:first').text().trim();
	
				//self.location="/product/getProduct?prodNo="+prodNo+"&menu="+menu;
							 // "/product/getProduct?prodNo=${ product.prodNo }&menu=${ param.menu }"
						$.ajax( 
								{
									url : "/product/json/getProduct/"+prodNo ,
									method : "GET" ,
									dataType : "json" ,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
										//alert(prodNo);
										//Debug...
										//alert(status);
										//Debug...
										//alert("JSONData : \n"+JSONData);
										var displayValue = "<h6>"
															+"품      번 	:<p id='pNo'>"+JSONData.prodNo+"</p>"
															+"품      명 	: "+JSONData.prodName+"<br/>"
															+"상세정보 : "+JSONData.prodDetail+"<br/>"
															+"제조일	: "+JSONData.manuDate+"<br/>"
															+"가      격	: "+JSONData.price+"<br/>"
															+'<input type="button" id="view" value="상세보기"><br/>'
															+'<input type="button" id="buying" value="구매"><br/>'
															+"</h6>";
										$("h6").remove();
										$( "#"+prodNo+"" ).html(displayValue);
									}
								}
							);
			});
		};
		
		if(${user.role=='admin'}){
			$('td:nth-child(6)').on('click', function(){
				if($("h6").text()==""){
					var prodNo=$(this).parent().children('td:first').text().trim();
					$.ajax( 
							{
								url : "/product/json/getProduct/"+prodNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									//alert(prodNo);
									//Debug...
									//alert(status);
									//Debug...
									//alert("JSONData : \n"+JSONData);
									var displayValue = "<h6>"
														+"품      번 	:<p id='pNo'>"+JSONData.prodNo+"</p>"
														+"품      명 	: "+JSONData.prodName+"<br/>"
														+"상세정보 : "+JSONData.prodDetail+"<br/>"
														+"제조일	: "+JSONData.manuDate+"<br/>"
														+"가      격	: "+JSONData.price+"<br/>"
														+"구매코드 : "+JSONData.proTranCode+"<br/>"
														+'<input type="button" id="view" value="상세보기"><br/>'
														+'<input type="button" id="modifying" value="수정"><br/>'
														+"</h6>";
									$("h6").remove();
									$( "#"+prodNo+"" ).html(displayValue);
								}
							}
						);
				}else{
					$("h6").remove();
				}
	
			});
		};
		
		$('td:nth-child(2)').on('click',function(){
			self.location="/product/getProduct?prodNo="+$(this).parent().children('td:first').text().trim()+"&menu="+menu;
		});
		
		$(document).on('click',"#view",function(){
			self.location="/product/getProduct?prodNo="+$(this).parent().find('#pNo').text().trim()+"&menu=search";
		});
		
		$(document).on('click','#modifying',function(){
			var pNo=$(this).parent().find('#pNo').text().trim();
			self.location="/product/getProduct?prodNo="+$(this).parent().find('#pNo').text().trim()+"&menu=manage";
		});
		
		$(document).on('click','#buying',function(){
			var userId='${user.userId}';
			var pNo=$(this).parent().find('#pNo').text().trim();
			self.location="/purchase/addPurchaseView?prodNo="+pNo+"&userId="+userId;
		});
		
		$('#delivery').on('click', function(){
			alert($(this).parent().children('td:first').text().trim());
			self.location="/purchase/updateTranCode1?prodNo="+$(this).parent().children('td:first').text().trim()+"&tranCode=002"
		});
	});

</script>

</head>

<body>

<jsp:include page="/layout/toolbar.jsp"/>

	<div class="container">
	
		<div class="page-header text-info">
			<c:if test='${ param.menu eq "manage" }'>
				<h3>상품관리</h3>
			</c:if>
			<c:if test='${ param.menu eq "search" }'>
				<h3>상품목록조회</h3>
			</c:if>
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
							<option value="0" ${ !empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
							<option value="1" ${ !empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
							<option value="2" ${ !empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
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
					<th align="left">상품명</th>
					<th align="left">가격</th>
					<th align="left">등록일</th>
					<th align="left">현재상태</th>
					<th align="left">간략정보</th>
					<c:if test="${ user.role == 'admin' }">
						<th align="left">배송여부</th>
					</c:if>
					<c:if test="${ user.role == 'user' }">
						<th align="left">추가기능</th>
					</c:if>
				</tr>
			</thead>
		
			<tbody>
			
				<c:set var="i" value="0"/>
				<c:forEach var="product" items="${ list }">
					<tr>
						<td align="center">${ product.prodNo }</td>
						<td align="left" title="Click : 상품 상세정보">${ product.prodName }</td>
						<td align="left">${ product.price }</td>
						<td align="left">${ product.regDate }</td>
						<c:if test="${ empty product.proTranCode }">
							<td align="left">판매중</td>
						</c:if>
						<c:if test="${ product.proTranCode == 001 && user.role=='admin' }">
							<td align="left">구매완료</td>
						</c:if>
						<c:if test="${ ! empty product.proTranCode && user.role!='admin' }">
							<td align="left">재고없음</td>
						</c:if>
						<c:if test="${ product.proTranCode == 002 && user.role=='admin' }">
							<td align="left">배송중</td>	
						</c:if>
						<c:if test="${ product.proTranCode == 003 && user.role=='admin' }">
							<td align="left">판매완료</td>	
						</c:if>
						<td align="left">
							<i class="glyphicon glyphicon-ok" id="${ product.prodNo }"></i>
							<input type="hidden" value="${ product.prodNo }">
						</td>
						<c:if test="${ user.role == 'user' }">
							<td align="left">기능추가중</td>
						</c:if>
						<c:if test="${ product.proTranCode != 001 && user.role == 'admin' }">
							<td align="left" value=""></td>
						</c:if>
						<c:if test="${ product.proTranCode == 001 && user.role == 'admin' }">
							<td align="left" id="delivery">배송하기</td>
						</c:if>
					</tr>
				</c:forEach>
			
			</tbody>
		
		
		</table>
	
	</div>
		
			<jsp:include page="../common/pageNavigator_new.jsp"/>
			
</body>
	
</html>