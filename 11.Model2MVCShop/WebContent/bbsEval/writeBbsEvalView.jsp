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
		
		function fncWriteBbsEval(){
			//Form ��ȿ�� ����
		//  var name = document.detailForm.prodName.value;
		// 	var detail = document.detailForm.prodDetail.value;
		// 	var manuDate = document.detailForm.manuDate.value;
		// 	var price = document.detailForm.price.value;
// 			var name = $("input[name='contentName']").val();
// 			var content = $("input[name='content']").val();
		
// 			if(name == null || name.length<1){
// 				alert("������ �Է��� �ּ���.");
// 				return;
// 			}
			
// 			if(content == null || content.length<1){
// 				alert("������ �Է��� �ּ���.");
// 				return;
// 			}
			
// 			if(content.length>1000){
// 				alert("������ 1õ�� �̸����� �ۼ��� �ּ���.")
// 				return;
// 			}
			
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
	
		<div class="navbar navbar-default">
			<div class="container">
				<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
			</div>
		</div>
		
		<div class="container">
		
			<h1 class="bg-primary text-center">�� ǰ �� �� ��</h1>
			
			<form class="text-center p-5" method="post" enctype="multipart/form-data">
			<input type="hidden" id="bbsUser.userId" name="bbsUser.userId" value="${ sessionScope.user.userId }"/>
			<input type="hidden" id="bbsProd.prodNo" name="bbsProd.prodNo" value="${ param.prodNo }"/>
			
 			
				<input type="text" class="form-control" placeholder="����" 
				id="contentName" name="contentName" value="" required>
						
				<hr/>
								
				<div class="col-sm-4" align="left">
					<select name="evalPoint" class="form-control" 
						style="width: 120px; height: 35px" maxLength="20">
						<option value="5">�븸��</option>
						<option value="4">����</option>
						<option value="3">����</option>
						<option value="2">�Ǹ�</option>
						<option value="1">��Ǹ�</option>
					</select>
					<hr/>
					<hr/>
				</div>
				
				
				<textarea class="form-control" rows="20" placeholder="����" 
				id="content" name="content" value="" required></textarea>
				
				<hr/>
				
				<div class="form-group">
					<label for="file" class="col-sm-1 control-label">����1</label>
					<div class="col-sm-4">
						<input type="file" class="form-control" id="file" name="file" style="width: 300px; height: 40px" maxLength="13"/>
					</div>		
				</div>
				
				<hr/>
				
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-4 text-center">
						<button type="button" class="btn btn-primary">���</button>
						<a class="btn btn-primary btn" href="#" role="button">���</a>
					</div>
				</div>
				
				<hr/>
				<hr/>
				<hr/>
				<hr/>
				
				
			</form>
	
		</div>
	
	</body>

</html>
