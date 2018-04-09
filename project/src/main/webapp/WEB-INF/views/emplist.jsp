<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">

	<%@include file="header.jsp" %>
	
	<script type="text/javascript">
		var first = 0;
		$(document).ready(function(){
			if(first == 0){
				searchEmp();
				++first;
			}
			
			$('#empSearchBt').click(function(){				
				if($('#empSearchText').val() == ""){					
					alert('검색 내용을 입력해주세요');		
				}else{				
					searchEmp();
				}
			});
			
			
		}); // document.ready	
		
		
		function searchEmp(){
			//alert($('#empSearchDrop').val()+"/"+$('#empSearchText').val(),$('#page').val());
			$.ajax({
				method : "POST",
				url : "/emplist/search",
				data : {
					"searchDrop" : $('#empSearchDrop').val(),
					"searchText" : $('#empSearchText').val(),
					"page" : $('#page').val()						
				},
				dataType : "json",
				success : function(data){
					console.log(data);
					var fulldata = eval(data);
					$('#searchDrop').val(fulldata.searchDrop).prop('selected', true);
					$('#searchText').val(fulldata.searchText);
					
					$('#list_tbody').empty();
					$('#pageul').empty();
					
					var listdata = eval(data.emplist);					
					var liststr = "";
					
					$(listdata).each(function(i,t){					
						liststr += "<tr ondblclick='empinfo("+t.EMP_NO+")'>"
								+  "<td>"+t.EMP_NO+"</td>"
								+  "<td>"+t.EMP_NAME+"</td>"
								+  "<td>"+t.EMP_STTS_NAME+"</td>"
								+  "<td>"+t.DPT_NAME+"</td>"
								+  "<td>"+t.RNK_NAME+"</td>"
								+  "<td>"+t.CNTCT_NO+"</td>"
								+  "<td>"+t.COMP_EMAIL+"</td>"
								+  "</tr>";
					});
					
					if(liststr == ""){
						liststr += "<tr>"
						+  "<td colspan='6'> 검색 결과가 없습니다 </td>"
						+  "</tr>";
					}
					
					$(liststr).appendTo('#list_tbody');
					
					var pagestr = "";
					var prePage = fulldata.endPage - fulldata.startPage;
					if(fulldata.pre == true){
						pagestr += '<li><a id="check-2" name="'+(fulldata.endPage - fulldata.startPage)+'" href="#">◀</a></li>'						
					}	
					for(var i=fulldata.startPage; i<fulldata.endPage+1; i++){
						pagestr += '<li><a id="check-2" name="'+i+'" href="#">'+i+'</a></li>'
					}
					if(fulldata.next == true){
						pagestr += '<li><a id="check-2" name="'+((fulldata.endPage*1)+1)+'" href="#">▶</a></li>'						
					}	
					
					$(pagestr).appendTo('#pageul'); 
					
					$("[id='check-2']").bind('click', function(){	
						$('#page').val($(this).attr('name'));		
						searchEmp();
					});
				},
				error : function(request,status,error){
					alert( "code:"+request.status+"\n"
							  +"message:"+request.responseText
							  +"\n"+"error:"+error);	
					}	
			});
		}
		
		function empinfo(obj){
			location.href = "/empinfo?emp_no="+obj;
		}
		
	</script>
		
		<div class="col-xs-10 right">
			<div class="container">
				<br>
				  <h3>사원 목록</h3>
				  <p>사원 목록입니다. 궁시렁 궁시렁</p>
				  <button type="button" class="btn btn-default" id="newMembt" onclick="location='/newMember'"> 
				 	신규
				 </button> 
				  <br> 
				  <form name="emplistfrm" method="post">
				    <input type="hidden" id="check" name="check" value="">
				    <input type="hidden" id="page" name="page" value="1">
					  <div class="col-xs-10 form-group list-text">
					  	 <select class="form-control" name="empSearchDrop" id="empSearchDrop"> 
			    			<option value="" >선택</option>
							<option value="emp_name">사원명</option>
							<option value="dpt_name">부서명</option>
							<option value="emp_stts_code">사원 상태</option>
						</select>			  	
						 <input type="text" class="form-control" id="empSearchText" name="empSearchText" 
						 			value=""	placeholder="검색할 내용을 입력해주세요">
						 <button type="button" class="btn btn-default" id="empSearchBt"> 
						 	<i class="glyphicon glyphicon-search"></i>
						 </button>
					  </div> <!-- .col-xs-10 form-group list-text -->
				  </form>
				  
				  <div class="col-xs-2"></div>
				 
				  <br><br><br><br>
				  <table class="table table-striped list-table">

					    <thead>
					      <tr>
					        <th>사원번호</th>
					        <th>성명</th>
					        <th>상태</th>
					        <th>부서</th>
					        <th>직급</th>
					        <th>연락처</th>
					        <th>Email</th>
					      </tr>
					    </thead>
				    
					    <tbody id="list_tbody">	
					    					      	      					  	       				      
					   </tbody> 
					   
				  </table>
				  
				  <div class="col-xs-12">
						<ul class="pager pagenum" id="pageul">
							  
					  	</ul>
					</div> <!-- .col-xs-12 -->

			</div>  <!-- .container -->
		</div><!-- .col-xs-10 right-->	
	</div><!-- .index -->

</html>