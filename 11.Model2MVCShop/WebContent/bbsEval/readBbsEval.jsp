<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>


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
	 		body {
	            padding-top : 50px;
	        }
	     </style>

		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
  		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

		<script type="text/javascript">
		
		function fncWriteBbsEval(){
			//Form ��ȿ�� ����
		//  var name = document.detailForm.prodName.value;
		// 	var detail = document.detailForm.prodDetail.value;
		// 	var manuDate = document.detailForm.manuDate.value;
		// 	var price = document.detailForm.price.value;
			var name = $("input[name='contentName']").val();
			var content = $("input[name='content']").val();
		
			if(name == null || name.length<1){
				alert("������ �Է��� �ּ���.");
				return;
			}
			
			if(content == null || content.length<1){
				alert("������ �Է��� �ּ���.");
				return;
			}
			
			if(content.length>1000){
				alert("������ 1õ�� �̸����� �ۼ��� �ּ���.")
				return;
			}
			
		// 	document.detailForm.action='/product/addProduct';
		// 	document.detailForm.submit();
			$("form").attr("method", "POST").attr("action", "/bbsEval/addBbsEval").submit();
		}
			$(function(){
				$('button.btn.btn-primary').on('click',function(){
					fncWriteBbsEval();
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
	
		<jsp:include page="/layout/toolbar.jsp"/>
			

			<form class="form-inline" name="detailForm" enctype="multipart/form-data">

				<div class="container">
			
					<div class="page-header">
						<h3 class="text-info">�� ǰ ��</h3>
					</div>
				
					<div class="row">
						<div class="col-xs-4 col-md-2"><strong>�� ��</strong></div>
						<div class="col-xs-8 col-md-4">${ bbsEval.contentName }</div>
					</div>
					
					<hr/>
					
					<div class="row">
						<div class="col-xs-4 col-md-2"><strong>�ۼ���ID</strong></div>
						<div class="col-xs-8 col-md-4">${ bbsEval.bbsUser.userId }</div>
					</div>
					
					<hr/>
					
					<div class="row">
						<div class="col-xs-4 col-md-2"><strong>����</strong></div>
						<div class="col-xs-8 col-md-4">${ bbsEval.evalPoint }</div>
					</div>
					
					<hr/>
					
					<div class="row">
						<div class="col-xs-4 col-md-2"><strong>�� ��</strong></div>
						<div class="col-xs-8 col-md-4">${ bbsEval.content }</div>
					</div>
					
					<hr/>
					
					<div class="row">
						<div class="col-xs-4 col-md-2"><strong>�� �� �� ǰ</strong></div>
						<div class="col-xs-8 col-md-4">${ bbsEval.bbsProd.prodName }</div>
					</div>
					
					<hr/>
					
					<div class="row">
						<div class="col-xs-4 col-md-2"><strong>�� �� ��</strong></div>
						<div class="col-xs-8 col-md-4">${ bbsEval.regDate }</div>
					</div>
					
					<hr/>
					
					<div class="row">
						<div class="col-md-12 text-center">
							<button type="button" class="btn btn-primary">����</button>
							<a class="btn btn-primary btn" href="#" role="button">���</a>
							<a class="btn btn-primary btn" href="##" role="button">����</a>
						</div>
					</div>
				</div>
			</form>
	
	
	</body>

</html>
