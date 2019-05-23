<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>


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
				dateFormat: "yy-mm-dd"
			});
		});
		
		function fncAddProduct(){
			//Form 유효성 검증
		//  var name = document.detailForm.prodName.value;
		// 	var detail = document.detailForm.prodDetail.value;
		// 	var manuDate = document.detailForm.manuDate.value;
		// 	var price = document.detailForm.price.value;
			var name = $("input[name='prodName']").val();
			var detail = $("input[name='prodDetail']").val();
			var manuDate = $("input[name='manuDate']").val();
			var price = $("input[name='price']").val();
		
			if(name == null || name.length<1){
				alert("상품명은 반드시 입력하여야 합니다.");
				return;
			}
			if(detail == null || detail.length<1){
				alert("상품상세정보는 반드시 입력하여야 합니다.");
				return;
			}
			if(manuDate == null || manuDate.length<1){
				alert("제조일자는 반드시 입력하셔야 합니다.");
				return;
			}
			if(price == null || price.length<1){
				alert("가격은 반드시 입력하셔야 합니다.");
				return;
			}
			
		// 	document.detailForm.action='/product/addProduct';
		// 	document.detailForm.submit();
			$("form").attr("method", "POST").attr("action", "/product/addProduct").submit();
		}
			$(function(){
				$('button.btn.btn-primary').on('click',function(){
					fncAddProduct();
				});
			});
			
			$(function(){
				$('a[href="#"]').on('click',function(){
					$("form")[0].reset;
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
						<input type="text" class="form-control" id="prodName" name="prodName">
					</div>				
				</div>

				<div class="form-group">
					<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상세정보</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="prodDetail" name="prodDetail">
					</div>		
				</div>
				
				<div class="form-group">
					<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
					<div class="col-sm-4">
						<input type="text" readonly="readonly" name="manuDate" id="datepicker" size="12"/>
					</div>		
				</div>
				
				<div class="form-group">
					<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="price" name="price"/>
					</div>		
				</div>
				
				<div class="form-group">
					<label for="file" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
					<div class="col-sm-4">
						<input type="file" class="form-control" id="file" name="file" style="width: 300px; height: 40px" maxLength="13"/>
					</div>		
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-4 text-center">
						<button type="button" class="btn btn-primary">등록</button>
						<a class="btn btn-primary btn" href="#" role="button">취소</a>
					</div>
				</div>				
			
			</form>
		
		</div>
	
	</body>

</html>
