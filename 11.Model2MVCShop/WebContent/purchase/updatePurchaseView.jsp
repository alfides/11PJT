<%@ page contentType="text/html; charset=euc-kr" %>
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
			
			function fncUpdatePurchase(){
				
				var name = $("input[name='receiverName']").val();
				var phone = $("input[name='receiverPhone']").val();
				var addr = $("input[name='divyAddr']").val();
			
				if(name == null || name.length<1){
					alert("�������̸��� ��Ȯ�� �Է��Ͽ��� �մϴ�.");
					return;
				}
				if(phone == null || phone.length<1){
					alert("����ó�� ��Ȯ�� �Է��Ͽ��� �մϴ�.");
					return;
				}
				if(addr == null || addr.length<1){
					alert("�ּҸ� ��Ȯ�� �Է��Ͽ��� �մϴ�.");
					return;
				}
				
				$('form').attr('method','POST').attr('action','/purchase/updatePurchase').submit();
			}
		
			$(function(){
				$('button.btn.btn-primary').on('click',function(){
					fncUpdatePurchase();
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
	
		<div class="navbar navbar-default">
			<div class="container">
				<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
			</div>
		</div>
		
		<div class="container">
		
			<h1 class="bg-primary text-center">������������</h1>
			
			<form name="updatePurchase" class="form-horizontal">
			
				<input type="hidden" name="prodNo" value="${purchase.purchaseProd.prodNo}">
				<input type="hidden" name="tranNo" value="${purchase.tranNo}">
				<input type="hidden" name="tranCode" value="${purchase.tranCode}">
				
				<div class="form-group">
					<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="receiverName" 
						name="receiverName" value="${ purchase.receiverName }"/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="receiverPhone" 
						name="receiverPhone" value="${ purchase.receiverPhone }"/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="divyAddr" 
						name="divyAddr" value="${ purchase.divyAddr }"/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="divyRequest" 
						name="divyRequest" value="${ purchase.divyRequest }"/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��</label>
					<div class="col-sm-4">
						<select name="paymentOption" class="form-control" 
							style="width: 120px; height: 35px" maxLength="20">
							<option value="001" ${ purchase.paymentOption==001 ? "selected" : "" }>���ݱ���</option>
							<option value="002" ${ purchase.paymentOption==002 ? "selected" : "" }>ī�屸��</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
					<div class="col-sm-4">
						<input type="text" readonly="readonly" name="divyDate" id="datepicker" size="12"/>
					</div>		
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-4 text-center">
						<button type="button" class="btn btn-primary">����</button>
						<a class="btn btn-primary btn" href="#" role="button">���</a>
					</div>
				</div>	
				
			</form>
		
		</div>	
	
	</body>

</html>