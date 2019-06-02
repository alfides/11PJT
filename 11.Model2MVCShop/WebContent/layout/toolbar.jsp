<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  ȸ������ DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >ȸ������</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">����������ȸ</a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'admin'}">
	                         	<li><a href="#">ȸ��������ȸ</a></li>
	                         </c:if>
	                         
	                         <li class="divider"></li>
	                         <li><a href="#">etc...</a></li>
	                     </ul>
	                 </li>
	                 
	              <!-- �ǸŻ�ǰ���� DrowDown  -->
	               <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >�ǸŻ�ǰ����</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">��ǰ���</a></li>
		                         <li><a href="#">��ǰ�ǸŰ���</a></li>
		                         <li class="divider"></li>
		                         <li><a href="#">etc..</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	              <!-- ���Ű��� DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >��ǰ����</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">��ǰ�˻�</a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                           <li><a href="#">�����̷���ȸ</a></li>
	                         </c:if>
	                         
	                         <li><a href="#">�ֱٺ���ǰ</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">etc..</a></li>
	                     </ul>
	                 </li>
	                 
<!-- 	                 <li class="dropdown"> -->
<!-- 	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> -->
<!-- 	                         <span >�Խ���</span> -->
<!-- 	                         <span class="caret"></span> -->
<!-- 	                     </a> -->
<!-- 	                     <ul class="dropdown-menu"> -->
<!-- 	                         <li><a href="#">��ǰ��Խ���</a></li> -->
<!-- 	                         <li><a href="#">QnA�Խ���</a></li> -->
<!-- 	                         <li class="divider"></li> -->
<!-- 	                         <li><a href="#">etc..</a></li> -->
<!-- 	                     </ul> -->
<!-- 	                 </li> -->
	                 
	                 <li><a href="#">etc...</a></li>
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">�α׾ƿ�</a></li>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�α׾ƿ�')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		 $(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 	$("a:contains('��ǰ�˻�')").on("click" , function() {
					self.location = "/product/listProduct?menu=search"
				}); 
			 });
		 
		 $(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 	$("a:contains('��ǰ�ǸŰ���')").on("click" , function() {
					self.location = "/product/listProduct?menu=manage"
				}); 
			 });
		 
		 $(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 	$("a:contains('��ǰ���')").on("click" , function() {
					//$(self.location).attr("href","/user/logout");
					self.location = "/product/addProductView.jsp"
				}); 
			 });
		 
		 $(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 	$("a:contains('�����̷���ȸ')").on("click" , function() {
			 		$(self.location).attr("href","/purchase/listPurchase?userId=${sessionScope.user.userId}");
				}); 
			 });
		 
// 		 $(function() {
// 				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 			 	$("a:contains('��ǰ��Խ���')").on("click" , function() {
// 			 		$(self.location).attr("href","/bbsEval/listBbsEval?menu=search");
// 				}); 
// 			 });
		
	 	$( "a:contains('����������ȸ')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	</script>  