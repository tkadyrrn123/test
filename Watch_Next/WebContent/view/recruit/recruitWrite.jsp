<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% System.out.println(request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<%@ include file="/view/layout/import.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/Resources/js/editor.js"></script>
<script>
	$(document).ready(function() {
		$("#txtEditor").Editor();
	});
</script>
<script type="text/javascript">
	$(document).ready(function(){  
	  
		$(".topnav").hover(function() { //마우스를 topnav에 오버시
			$(this).parent().find(".subnav").slideDown('normal').show(); //subnav가 내려옴.
			$(this).parent().hover(function() {  
			}, function(){  
				$(this).parent().find(".subnav").slideUp('fast'); //subnav에서 마우스 벗어났을 시 원위치시킴  
			});  
		});  
	  	
		$(window).scroll(function(){
		    var navbar = $(this).scrollTop();
		    console.log(navbar);
		    var header = $('header');
		    if(navbar > 100){
		        header.addClass('down');
		    }else{
		        header.removeClass('down');
		    }
		  });
		$('.recW_submit').click(function(){
			if($('#recW_recruitName').val().length==0){
				alert("모집 제목을 입력하세요.");
				$('#recW_recruitName').focus();
				return false;
			}else if($('div.Editor-editor')[0].innerHTML.length==0){
				alert("모집 내용을 입력하세요.");
				$('div.Editor-editor').focus();
				return false;
			}else{
				$('#editor_content').val($('div.Editor-editor')[0].innerHTML);
				/* $('div.Editor-editor')[0].innerHTML; */
				// 쪽지 window.open("writePopup.html", "a", "width=400, height=300, left=100, top=50"); 
				alert("작성이 완료되었습니다.");
				return true;
			}
		});
	});  
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="<%=request.getContextPath() %>/Resources/css/editor.css" type="text/css" rel="stylesheet"/>
<link rel= "stylesheet" type="text/css" href="<%=request.getContextPath() %>/Resources/css/recruit_write.css">
</head>
<body>
<!--header -->
<%@ include file="/view/layout/Header.jsp" %>
	<!-- 모집 게시판 작성 -->
<br clear="all">
<form>
	<div id="recW_recruit">
		<h2><strong>모집 게시판 작성</strong></h2>
		<hr id="red_line">
		<br>
		<h4><strong>제목 : &ensp;<input type="text" id="recW_recruitName" name="recW_recruitName"></strong></h4>
		<h4><strong>종류 : &nbsp;
		<select id="recW_type" name="recW_type">
			<option>NETFLIX</option>
			<option>WATCHA</option>
		</select>
		</strong></h4>
	</div>
	<!-- 텍스트 편집기 부분 -->
	<div class="col-lg-12 nopadding">
		<textarea id="txtEditor"></textarea>
		<input type="hidden" id="editor_content" name="editor_content">
	</div>

	<div id = "recW_roop">
	&nbsp;<br>&nbsp;<br>&nbsp;<br>
	<p>&nbsp;</p>
	<input type="reset" value="취소" id="recW_button">
	<input type="submit" value="완료" id="recW_button" class="recW_submit">
	</div>
</form>
<!-- footer -->
<%@ include file="/view/layout/footer.jsp" %>
<script src="<%=request.getContextPath() %>/Resources/js/Header.js"></script>

</body>
</html>