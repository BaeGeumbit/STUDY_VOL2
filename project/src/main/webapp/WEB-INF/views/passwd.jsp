<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
	<%@include file="header.jsp" %>
	<script type="text/javascript">
			
			function check_passwd(){
				//alert($('#orgin_passwd').val()+"/"+$('#new_passwd').val()+"/"+$('#new_passwd2').val());
				if($('#origin_passwd').val() == ""){
					alert('현재 비밀번호를 입력해주세요');
				}else if($('#new_passwd').val() == ""){
					alert('새로운 비밀번호를 입력해주세요');
				}else if($('#new_passwd2').val() == ""){
					alert('비밀번호 확인을 입력해주세요');
				}else if($('#new_passwd').val() != $('#new_passwd2').val()){
					alert('입력하신 새 비밀번호를 \n 다시 확인해주세요');
				}else{
					$.ajax({
						method : "POST",
						data : {
							"origin_passwd" : $('#origin_passwd').val(),
							"new_passwd" : $('#new_passwd').val(),
						},
						url : "/updatePasswd",
						dataType : "text",
						success : function(data){
							if(data == "1"){
								alert('비밀번호 변경에 성공했습니다');
								location.href="/index";
							}else if(data == "2"){
								alert("현재 비밀번호가 맞지 않습니다");
							}else if(data == "3"){
								alert("변경에 실패하였습니다. \n 다시 시도해주세요");
							}
						},
						error : function(request,status,error){
							alert( "code:"+request.status+"\n"
									  +"message:"+request.responseText
									  +"\n"+"error:"+error);	
						}	
						
					});
				}
			}
			
		
	</script>
	<div class="col-xs-10 right">
		<div class="container change_passwd">

			<h2>비밀번호 변경</h2>
			<div class="form-group row">
				<div class="col-xs-4">
					현재비밀번호 <input type="password" id="origin_passwd" value="" class="form-control" placeholder="">
					새 비밀번호 <input type="password" id="new_passwd" value="" class="form-control" placeholder="">
					비밀번호 확인 <input type="password" id="new_passwd2" value="" class="form-control"  placeholder="">
					<button class="btn" onclick="check_passwd()">
					변경
					</button>
				</div>
			</div>
		</div> <!-- .container -->
	</div><!-- .col-xs-10 right-->
	
</div><!-- .index -->

</html>