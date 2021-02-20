<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/tour/resources/js/jquery-3.5.1.min.js"></script>
<!-- datepicker라이브러리 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<h1>쿠폰발급</h1>
<div>
<form action="${cp }/goCreateCoupon" method="post" onsubmit="return checkIssue()">
<div>
<div>
쿠폰명
<input type="text" name="coupName" id="coupName">
<span id="warnName" style="color: red; font-size: 0.7em;"></span>
</div>
<div>
쿠폰 발급대상
<span id="warnMember" style="color: red; font-size: 0.7em;"></span>
<br>
<input type="checkbox" id="allmember">전 회원<br>
<input type="checkbox" name="memberGrade" value="Bronze">Bronze<br>
<input type="checkbox" name="memberGrade" value="Silver">Silver<br>
<input type="checkbox" name="memberGrade" value="Gold">Gold<br>
<input type="checkbox" name="memberGrade" value="Platinum">Platinum<br>
<input type="checkbox" name="memberGrade" value="Vip">Vip<br>
</div>
<div>
할인율
<select name="dcRate">
	<option value="10">10%</option>
	<option value="20">20%</option>
	<option value="30">30%</option>
	<option value="40">40%</option>
	<option value="50">50%</option>
</select>
</div>
유효기간<br>
<input type="checkbox" id="valid">유효기간없음<br>
<input type="text" name="expire" id="expire" readonly="readonly">
</div>
<div>
<button id="issue">발급하기</button>
</div>
</form>
</div>
</body>
<script>
$("#valid").click(function(){
	if($(this).is(":checked")==true){
		$("#expire").attr("disabled",true);
		$("#expire").datepicker('option','disabled',true);
	}else if($(this).is(":checked")==false){
		$("#expire").attr("disabled",false);
		$("#expire").datepicker('option','disabled',false);
	}
});

$("#allmember").click(function(){
	if($(this).is(":checked")==true){
		$("input:checkbox[name='memberGrade']").prop("checked", true);
	}else{
		$("input:checkbox[name='memberGrade']").prop("checked", false);
	}
});

$("input:checkbox").click(function(){
	$("#warnMember").text("");
});
$("#coupName").on('keyup',function(){
	$("#warnName").text("");
});

function checkIssue(){
	var coupName=$("#coupName").val();
	if(coupName==''){
		$("#warnName").text("쿠폰 이름을 입력해주세요.");
		return false;
	}
	var isChecked=false;
	$("input:checkbox[name='memberGrade']").each(function(){
		if($(this).is(":checked")==true){
			isChecked=true;
		}
	});
	if(isChecked==false){
		$("#warnMember").text("발급대상을 선택해주세요.");
		return false;
	}
	return true;
}

$("#expire").datepicker({
	dateFormat:'yy-mm-dd',
	dayNamesMin:['일','월','화','수','목','금','토'],
	monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	yearSuffix:"년",
	showMonthAfterYear:true,
	minDate:0,
	showAnim:"toggle"
});
</script>
</html>