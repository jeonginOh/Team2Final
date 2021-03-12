<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
	#adultNum{
		-ms-user-select: none;
		-moz-user-select: -moz-none; 
		-webkit-user-select: none; 
		-khtml-user-select: none; 
		user-select:none;
	}
	#changeCount{
		user-select:none;
		display: none;
		position: absolute;
		background-color: #f9f9f9;
		min-width: 160px;
		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		padding: 12px 16px;
		z-index: 1;
	}
	#changeCount div{
 		-ms-user-select: none;
 		-moz-user-select: -moz-none; 
 		-webkit-user-select: none; 
 		-khtml-user-select: none;
	}
	#loading {
		height: 100%;
		width: 100%;
		left: 0px;
		top:0px;
		position: fixed;
		_position:absolute; 
		filter:alpha(opacity=50);
		-moz-opacity:0.5;
		opacity : 0.5;
	}
	.loading {
		background-color: white;
		z-index: 199;
	}
	#loading_img{
		position:absolute; 
		top:50%;
		left:50%;
		height:100px;
		margin-top:-75px;
		margin-left:-75px;	
		z-index: 200;
	}
	#accomWrap{
		width: 80%;
		margin: auto;
		display : flex;
		height: auto;
		position: relative;
		top: -35px;
	}
	.accomSelectSection{
		width:900px; 
		height:200px;
		border: 1px solid #D5D5D5;
		display: flex;
	}
	.accomSelectSection:hover{
		box-shadow: 1px 1px 2px 2px gray;
	}
	#accom a{
		text-decoration: none;
	}
	.accomSelectSection .accomSelectImage{display:inline-block; margin-right:10px;}
	.accomSelectSection .accomSelectImage img{width: 200px; height: 200px;}
	.accomSelectSection .accomSelectInfo{
		width: 90%;
	}
	.accomSelectSection .accomSelectInfo h3{
		color: black;
		margin-top: 20px;
		display: inline-block;
	}
	.accomSelectSection .accomSelectInfo p{
		font-size: 1.4em;
	}
	.accomSelectSection .accomSelectInfo .accomPriceInfo{
		text-align: right;
		margin-right: 10px;
		color: black;
	}
	.heartImg{
		position:relative;
		left:840px;
		top:60px;
		width:25px;
		margin-bottom: 12px;
		margin-left: 10px;
	}
	.accomSelectSection .starImg{
		width:20px;
		vertical-align: -18%;
	}
	
	#accomFilter {
		width: 250px;
		background-color: #4B70DD;
		padding: 30px 0;
	}
	#accomResult{
		width: 85%;
		height:auto;
		padding : 10px;
	}
	#accom{
		width:700px;
	}
	#accomKind input[type="radio"]{
		position: absolute;
		 width: 1px; 
		 height: 1px; 
		 padding: 0; 
		 margin: -1px; 
		 overflow: hidden; 
		 clip:rect(0,0,0,0); 
		 border: 0;
	}
	#accomKind h3{
		color: white;
	}
	#accomKind div{
		padding: 20px;
		border-top: 0.5px solid #79ABFF;
		border-bottom: 0.5px solid #79ABFF;
		color: white;
	}
	#accomFilter h3{
		text-align:center;
		margin-bottom:20px;
	}
	#accomKind label:hover{
	text-decoration:none;
	color:white;
	font-weight:800;
	}
	#accomFacility{
		border-bottom: 0.5px solid #79ABFF;
		padding-bottom: 20px;
		color: white;
	}
	#accomFacility input[type='checkbox']{
		margin-bottom: 10px;
		margin-left: 10px;
	}
	#accomConven{
		border-bottom: 0.5px solid #79ABFF;
		padding-bottom: 20px;
		margin-top: 12px;
		color: white;
	}
	#accomConven input[type='checkbox']{
		margin-bottom: 10px;
		margin-left: 10px;
	}
	#accomSearchBox{
		height: 70px;
		margin-left: 10px;
		padding-top: 15px;
		width: 70%;
	}
	#accomSearchBox #numCount{
		background-color: white;
		width: 50px;
		margin-right: 20px;
	}
	#accomSearchBox input[type='text']{
		margin-left:15px;
		width:150px;
		border-radius: 25px 25px 25px 25px;
		text-align: center;
	}
	#accomOrderBox{
		text-align: right;
		margin-bottom: 20px;
		margin-top: 20px;
	}
	#accomOrderBox a{
		text-decoration: none;
		color: black;
		margin-left: 10px;
	}
	#accomOrderBox a:hover{
		font-weight: 800;
	}
	
	
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/174a2d5b3b.js" crossorigin="anonymous"></script>



<div id="accomWrap">

<div id="accomFilter">
<div id="accomKind">
	<h3>종류</h3>
	<div>
	<i class="fas fa-globe"></i>
	<input type="radio" id="r1" name="gck" value="0" checked="checked" id="defradio">
	<label for="r1">전체</label>
	</div>
	<div>
	<i class="fas fa-laptop-house"></i>
	<input type="radio" id="r2" name="gck" value="2">
	<label for="r2">펜션</label>
	</div>
	<div>
	<i class="fas fa-warehouse"></i>
	<input type="radio" id="r3" name="gck" value="3">
	<label for="r3">캠핑</label>
	</div>
	<div>
	<i class="fas fa-house-user"></i>
	<input type="radio" id="r4" name="gck" value="4">
	<label for="r4">게스트하우스</label>
	</div>
</div>
<br>
<div id="accomFacility">
	<h3>편의시설</h3>
	<input type="checkbox" id="fac1" name="fck" value="수영장">
	<label for="fac1">수영장</label><br>
	<input type="checkbox" id="fac2" name="fck" value="바베큐장">
	<label for="fac2">바베큐장</label><br>
	<input type="checkbox" id="fac3" name="fck" value="유아시설">
	<label for="fac3">유아시설</label><br>
	<input type="checkbox" id="fac4" name="fck" value="카페">
	<label for="fac4">카페</label><br>
	<input type="checkbox" id="fac5" name="fck" value="편의점">
	<label for="fac5">편의점</label><br>
	<input type="checkbox" id="fac6" name="fck" value="온천">
	<label for="fac6">온천</label><br>
	<input type="checkbox" id="fac7" name="fck" value="탁구장">
	<label for="fac7">탁구장</label><br>
	<input type="checkbox" id="fac8" name="fck" value="골프장">
	<label for="fac8">골프장</label><br>
	<input type="checkbox" id="fac9" name="fck" value="족구장">
	<label for="fac9">족구장</label><br>
	<input type="checkbox" id="fac10" name="fck" value="연회장">
	<label for="fac10">연회장</label><br>
</div>
<div id="accomConven">
	<h3>서비스</h3>
	<input type="checkbox" id="con1" name="cck" value="wifi">
	<label for="con1">wifi</label><br>
	<input type="checkbox" id="con2" name="cck" value="조식서비스">
	<label for="con2">조식서비스</label><br>
	<input type="checkbox" id="con3" name="cck" value="무료주차">
	<label for="con3">무료주차</label><br>
	<input type="checkbox" id="con4" name="cck" value="픽업">
	<label for="con4">픽업</label><br>
	<input type="checkbox" id="con5" name="cck" value="보드게임">
	<label for="con5">보드게임</label><br>
	<input type="checkbox" id="con6" name="cck" value="영화관람">
	<label for="con6">영화관람</label><br>
	<input type="checkbox" id="con7" name="cck" value="금연">
	<label for="con7">금연</label><br>
	<input type="checkbox" id="con8" name="cck" value="반려동물동반">
	<label for="con8">반려동물동반</label><br>
</div>
<div id="accomCharge">
	<p style="text-align: center;">
	  <label for="amount">숙박 요금</label>
	  <input type="text" id="amount" readonly style="text-align: center; border:0; color:#f6931f; font-weight:bold; width:150px;">
	</p>
	<div id="slider-range" style="width: 90%"></div>
</div>
</div>

<div id="accomResult">
	<div id="accomSearchBox">
		<input type="search" placeholder="검색어 입력" id="keyword" style="width:200px; border-radius: 5px;">
		<div style="display: inline-block; width: 380px; text-align: center;">
		<input type="text" id="d1" readonly="readonly" size="10">
		<span style="margin-left: 10px;">~</span>
		<input type="text" id="d2" readonly="readonly" size="10">
		</div>
		<div style="display: inline-block;">
			<div id="numCount" name="nCount" style="width: 50px; text-align: center;">
			<span id="totCount" name="nCount" style="margin-right: 5px;">1명</span><i class="fas fa-angle-down"></i>
			</div>
			<div id="changeCount" name="nCount">
				인원<br><br>
				<div name="nCount">성인
					<i class="fas fa-minus-circle fa-2x" name="nCount" id="minCount"
					style="color: #B2EBF4;"></i>
					<span id="adultNum" name="nCount">1명</span>
					<i class="fas fa-plus-circle fa-2x" name="nCount" id="plusCount"
					style="color: #B2EBF4;"></i>
				</div>
			</div>
		</div>
		<input type="button" value="검색" id="searchAccom" class="btn btn-outline-primary" style="position: absolute;">
		<div id="accomOrderBox">
		<input type="hidden" id="classification">
			<a href="javascript:orderChange(1);"<c:if test='${classification==1}'>style="color:gray;"</c:if>>추천순</a>
			<a href="javascript:orderChange(2);"<c:if test='${classification==2}'>style="color:gray;"</c:if>>리뷰많은순</a>
			<a href="javascript:orderChange(3);"<c:if test='${classification==3}'>style="color:gray;"</c:if>>가격낮은순</a>
			<a href="javascript:orderChange(4);"<c:if test='${classification==4}'>style="color:gray;"</c:if>>가격높은순</a>
		</div>
	</div>
	<div id="accom">
	</div>
</div>
</div>


<script type="text/javascript">
var acnt=1; //어른 인원수
var totcnt=1; //총 인원수

var bindCk=true;


	$(document).ready(function(){
		var loading = $('<div id="loading" class="loading"></div><img id="loading_img" alt="loading" src="${cp}/resources/images/Spinner.gif" />').appendTo(document.body).hide();
		$(window)	
		.ajaxStart(function(){
		loading.show();
		})
		.ajaxStop(function(){
		loading.hide();
		});
		
		
		$( "#keyword" ).autocomplete({  
		      source : function(request,response ) { 
		      $.ajax({ 
		         url: "${cp}/nameList", 
		         dataType: "json", 
		         data: {  
		            searchValue: request.term }, 
		         success: function( result ) {
		        	 console.log(result);
		         var accomList = result.accomList;
		         response( accomList);
		            } 
		       	}); 
		      },
		      focus : function(event, ui) {    //포커스 가면
	                return false;//한글 에러 잡기용도로 사용됨
	          },
		      minLength: 1,
		      select: function(event, ui) {}
		}).bind('focus', function () {
	        $(this).autocomplete("search");
	    });

		
		$("#d1").datepicker('setDate','today');
		$("#d2").datepicker('setDate','+1D');
		var count=$("#totCount").text().replace(/[^0-9]/g,"");
		var startDate=$("#d1").val();
		var endDate=$("#d2").val();
		var param={
				"count" : count,
				"startDate" : startDate,
				"endDate" : endDate
		}
		getfirst(param);
		
	});
	$("#searchAccom").click(function(){
		$("input[type='checkbox']").prop("checked",false);
		$("#defradio").prop("checked",true);
		var count=$("#totCount").text().replace(/[^0-9]/g,"");
		var startDate=$("#d1").val();
		var endDate=$("#d2").val();
		var keyword=$("#keyword").val();
		var param={
				"count" : count,
				"startDate" : startDate,
				"endDate" : endDate,
				"keyword" : keyword
		}
		console.log(param);
		getfirst(param);
		
	});
	
	function getfirst(param){
		$.getJSON('${cp}/accomSelect_list',param, function(data) {
			var wMinprice=10000000;
			var wMaxprice=0;
			var count=$("#totCount").text().replace(/[^0-9]/g,"");
			var startDate=$("#d1").val();
			var endDate=$("#d2").val();
			var facility=[]; //시설 배열
			var conven=[]; //편의서비스 배열
			var category=[]; //카테고리 배열
			var keyword=param.keyword; //키워드 적었던것
			$("#accom").empty();
			if(data.list.length!=0){
				for(let i=0;i<data.list.length;i++){
					var accomNum=data.list[i].accom_service_number;
					var accomName=data.list[i].accom_name;
					var cate_number=data.list[i].cate_number;
					var minprice=data.list[i].minp;
					var maxprice=data.list[i].maxp;
					var howLong=data.howLong;
					var image=data.image[i];
					var rcnt=data.list[i].rcnt;
					var avgpoint=data.list[i].avgpoint;
					var fullstars = Math.floor(avgpoint);
					var decimal =  Math.round(avgpoint*10%10);
					var wishlist=data.wishlist[i];
					var stars ="";
				
					if(avgpoint==0){
						for(let l=0; l<5; l++){
							stars+="<img src='${cp }/resources/images/emptyStar.svg' class='starImg'>";
						}
					}else{
						if(fullstars==5){ // 평점이 5점이면~ 
							for(let k=0; k<fullstars; k++){
								stars+="<img src='${cp }/resources/images/fullStar.svg' class='starImg'>";
							}
						}else{
							for(let k=0; k<fullstars; k++){
								stars+="<img src='${cp }/resources/images/fullStar.svg' class='starImg'>";
							}
							if(decimal>=0 && decimal<3){
								stars+="<img src='${cp }/resources/images/emptyStar.svg' class='starImg'>";
							}else if(decimal>=3 && decimal<8 ){
								stars+="<img src='${cp }/resources/images/halfStar.svg' class='starImg'>";
							}else if(decimal>=8){
								stars+="<img src='${cp }/resources/images/fullStar.svg' class='starImg'>";
							}
							for(let l=0; l<5-fullstars-1; l++){
								stars+="<img src='${cp }/resources/images/emptyStar.svg' class='starImg'>";
							}
						}
					}
					
					if(wishlist=='yes'){
						var heart="<img src='${cp }/resources/images/HRT.svg' class='heartImg' onclick='wish(this)' alt='heart'>";
					}else{
						var heart="<img src='${cp }/resources/images/emptyHRT.svg' class='heartImg' onclick='wish(this)' alt='emptyheart'>";
					}
					
					if(image==null){
						var imageName="sorry.jpg";
					}else{
						var imageName=data.image[i].imgsavename;
					}
					var content=
						heart+
						"<input type='hidden' value='"+accomNum+"'>"+
						"<input type='hidden' value='"+cate_number+"'>"+
						"<a href='${cp}/accomDetail?accomNum="+accomNum+
							"&startDate="+startDate+"&endDate="+endDate+
							"&count="+count+"&cate_number="+cate_number+"' class='goDetail' onclick='bindCheck'>"+
							"<section class='accomSelectSection'>"+
								"<div class='accomSelectImage'>"+
								"<img src='${cp}/resources/upload/"+imageName+"'>"+
								"</div>"+
								"<div class='accomSelectInfo'>"+
								"<div>"+
								"<h3>"+accomName+"</h3>"+
								"</div>"+
								"<div class='accomPriceInfo'>"+
								"<p>"+stars+"("+rcnt+")"+"</p>"+
								"<p style='font-weight:bold; display:inline-block;'>총 "+minprice*howLong+"부터~</p>"+
								"<div style='font-size: 0.7em; display:inline-block; margin-left:10px;'>(1인당 "+parseInt(minprice*howLong/count)+"원)</div>"+
								"<div>1박 "+minprice+"원</div>"+
								"</div>"+
								"</div>"
							"</section>"+
							"</a>";
					$("#accom").append(content);
					if(wMinprice>minprice){
						wMinprice=minprice;
					}
					if(wMaxprice<maxprice){
						wMaxprice=maxprice;
					}
				}
			}else{
				var content=
				"<section class='accomSelectSection'>"+
				"<img src='${cp}/resources/images/sorry.jpg'>"+
				"<h3>검색결과가 없습니다...</h3>"
				"</section>";
				$("#accom").append(content);
			}
			var sliderMaxprice=wMaxprice;
			
			//함수 중복 실행 방지를 위해 언바인드 후 다시 바인드(1번만 실행)
			$("input[type='checkbox']").unbind("click").bind("click",function(){
				count=$("#totCount").text().replace(/[^0-9]/g,"");
				facility=[];
				conven=[];
				category=0;
				
				
				 $("input[name='fck']:checked").each(function(i){ //시설에 체크된 리스트 저장
		             facility.push($(this).val());
		         });
				 $("input[name='cck']:checked").each(function(i){ //편의서비스에 체크된 리스트 저장
		             conven.push($(this).val());
		         });
		         category=$("input[name='gck']:checked").val();
				 var param= {
						 "startDate" : startDate,
						 "endDate" : endDate,
						 "count" : count,
						 "facility" : facility,
						 "conven" : conven,
						 "category" : category,
						 "maxprice" : sliderMaxprice,
						 "keyword" : keyword
				 }
				 console.log(param);
				 getfilter(param);
				 
			});
			
			$("input[type='radio']").unbind("click").bind("click",function(){
				count=$("#totCount").text().replace(/[^0-9]/g,"");
				facility=[];
				conven=[];
				category=0;
				
				 $("input[name='fck']:checked").each(function(i){ //시설에 체크된 리스트 저장
		             facility.push($(this).val());
		         });
				 $("input[name='cck']:checked").each(function(i){ //편의서비스에 체크된 리스트 저장
		             conven.push($(this).val());
		         });
		         category=$("input[name='gck']:checked").val();
				 var param= {
						 "startDate" : startDate,
						 "endDate" : endDate,
						 "count" : count,
						 "facility" : facility,
						 "conven" : conven,
						 "category" : category,
						 "maxprice" : sliderMaxprice,
						 "keyword" : keyword
				 }
				 console.log(param);
				 getfilter(param);
				 
			});
			
			$( "#slider-range" ).slider({ //가격 슬라이더 
				range: "min",
			      min: wMinprice,
			      max: wMaxprice,
			      value: wMaxprice,
			      step : 4000,
			      slide: function( event, ui ) {
			        $( "#amount" ).val(" ~ " + ui.value + "원" );
			      },
			      stop:function(value,ui){
			    	  sliderMaxprice=parseInt(ui.value);
			    	  var param= {
								 "startDate" : startDate,
								 "endDate" : endDate,
								 "count" : count,
								 "facility" : facility,
								 "conven" : conven,
								 "category" : category,
								 "maxprice" : sliderMaxprice,
								 "keyword" : keyword
						 }
			    	  console.log(param);
			    	  getfilter(param);
			      }
			    });
			
			$( "#amount" ).val(" ~ " + $( "#slider-range" ).slider("value")+"원" );
		})
		.fail(function(){
		    $("#accom").empty();
		    var content=
			"<section class='accomSelectSection'>"+
				"<img src='${cp}/resources/images/3.png'>"+
				"<h3>검색결과가 없습니다...</h3>"
			"</section>";
			$("#accom").append(content);
		});
	}
	
	function orderChange(classification){ // 정렬 순서 변할때 
		var startDate=$("#d1").val();
		var endDate=$("#d2").val();
		var count=$("#totCount").text().replace(/[^0-9]/g,"");
		var facility=[];
		var conven=[];
		var category=0;
		var maxprice=$("#amount").val().replace(/[^0-9]/g,"");
		var keyword=$("#keyword").val();
		
		 $("input[name='fck']:checked").each(function(i){ //시설에 체크된 리스트 저장
             facility.push($(this).val());
         });
		 $("input[name='cck']:checked").each(function(i){ //편의서비스에 체크된 리스트 저장
             conven.push($(this).val());
         });
         category=$("input[name='gck']:checked").val();
		
		var param={
				"startDate" : startDate,
				 "endDate" : endDate,
				 "count" : count,
				 "facility" : facility,
				 "conven" : conven,
				 "category" : category,
				 "maxprice" : maxprice,
				 "classification" : classification,
				 "keyword" : keyword
		}
		getfilter(param);
	}
	
	function getfilter(param){

		$.ajax({
			url: '${cp}/accomSelect_list',
			dataType: 'json',
			data: param,
			success: function(data) {
				$("#accom").empty();
				var count=$("#totCount").text().replace(/[^0-9]/g,"");
				var startDate=$("#d1").val();
				var endDate=$("#d2").val();
				if(data.list.length!=0){
					for(let i=0;i<data.list.length;i++){
					 	var accomNum=data.list[i].accom_service_number;
						var accomName=data.list[i].accom_name;
						var cate_number=data.list[i].cate_number;
						var minprice=data.list[i].minp;
						var maxprice=data.list[i].maxp;
						var image=data.image[i];
						var howLong=data.howLong;
						var rcnt=data.list[i].rcnt;
						var avgpoint=data.list[i].avgpoint;
						var fullstars = Math.floor(avgpoint);
						var decimal =  Math.round(avgpoint*10%10);
						var wishlist=data.wishlist[i];
						var classification=data.classification;
						var stars ="";
					
						if(avgpoint==0){
							for(let l=0; l<5; l++){
								stars+="<img src='${cp }/resources/images/emptyStar.svg' class='starImg'>";
							}
						}else{
							if(fullstars==5){ // 평점이 5점이면~ 
								for(let k=0; k<fullstars; k++){
									stars+="<img src='${cp }/resources/images/fullStar.svg' class='starImg'>";
								}
							}else{
								for(let k=0; k<fullstars; k++){
									stars+="<img src='${cp }/resources/images/fullStar.svg' class='starImg'>";
								}
								if(decimal>=0 && decimal<3){
									stars+="<img src='${cp }/resources/images/emptyStar.svg' class='starImg'>";
								}else if(decimal>=3 && decimal<8 ){
									stars+="<img src='${cp }/resources/images/halfStar.svg' class='starImg'>";
								}else if(decimal>=8){
									stars+="<img src='${cp }/resources/images/fullStar.svg' class='starImg'>";
								}
								for(let l=0; l<5-fullstars-1; l++){
									stars+="<img src='${cp }/resources/images/emptyStar.svg' class='starImg'>";
								}
							}
						}
						
						if(image==null){
							var imageName="sorry.jpg";
						}else{
							var imageName=data.image[i].imgsavename;
						}
						
						if(wishlist=='yes'){
							var heart="<img src='${cp }/resources/images/HRT.svg' class='heartImg' onclick='wish(this)' alt='heart'>";
						}else{
							var heart="<img src='${cp }/resources/images/emptyHRT.svg' class='heartImg' onclick='wish(this)' alt='emptyheart'>";
						}
						
						console.log(accomName);
						console.log(minprice);
						if(classification!=4){
							var cfction=
								"<p style='font-weight:bold; display:inline-block;'>총 "+minprice*howLong+"부터~</p>"+
								"<div style='font-size: 0.7em; display:inline-block; margin-left:10px;'>(1인당 "+parseInt(minprice*howLong/count)+"원)</div>"+
								"<div>1박 "+minprice+"원</div>";
						}else{
							var cfction=
								"<p style='font-weight:bold; display:inline-block;'>~총 "+maxprice*howLong+"까지</p>"+
								"<div style='font-size: 0.7em; display:inline-block; margin-left:10px;'>(1인당 "+parseInt(maxprice*howLong/count)+"원)</div>"+
								"<div>1박 "+maxprice+"원</div>";
						}
						
						
						var content=
							heart+
							"<input type='hidden' value='"+accomNum+"'>"+
							"<input type='hidden' value='"+cate_number+"'>"+
							"<a href='${cp}/accomDetail?accomNum="+accomNum+
									"&startDate="+startDate+"&endDate="+endDate+
									"&count="+count+"&cate_number="+cate_number+"' class='goDetail' onclick='bindCheck'>"+
									"<section class='accomSelectSection'>"+
										"<div class='accomSelectImage'>"+
										"<img src='${cp}/resources/upload/"+imageName+"'>"+
										"</div>"+
										"<div class='accomSelectInfo'>"+
										"<div>"+
										"<h3>"+accomName+"</h3>"+
										"</div>"+
										"<div class='accomPriceInfo'>"+
										"<p>"+stars+"("+rcnt+")"+"</p>"+
										cfction+
										"</div>"+
										"</div>"
									"</section>"+
									"</a>";
						$("#accom").append(content);
					}
				}else{
					var content=
					"<section class='accomSelectSection'>"+
						"<img src='${cp}/resources/upload/sorry.jpg'>"+
						"<h3>검색결과가 없습니다...</h3>"
					"</section>";
					$("#accom").append(content);
				}
			},
		  error: function(XMLHttpRequest, textStatus, errorThrown) {
		    console.log(textStatus, errorThrown);
		    $("#accom").empty();
		    var content=
			"<section class='accomSelectSection'>"+
				"<img src='${cp}/resources/upload/sorry.jpg'>"+
				"<h3>검색결과가 없습니다...</h3>"
			"</section>";
			$("#accom").append(content);
		  }
		});
	}
	
	$("#plusCount").click(function(){
		if(!(acnt>=14)){
			acnt++;
			totcnt++;
		}
		$("#adultNum").text(acnt+"명");
		$("#totCount").text(totcnt+"명");
	});
	$("#minCount").click(function(){
		if(!(acnt<=1)){
			acnt--;
			totcnt--;
		}
		$("#adultNum").text(acnt+"명");
		$("#totCount").text(totcnt+"명");
	});
	$("#numCount").click(function(){
		$("#changeCount").slideToggle(200);
	});
	$('html').click(function(e){
		if(!$(e.target).is("[name='nCount']")){
			$("#changeCount").slideUp(200);
		}
	});
	$("#d1").datepicker({
		dateFormat:'yy-mm-dd',
		dayNamesMin:['일','월','화','수','목','금','토'],
		monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		yearSuffix:"년",
		showMonthAfterYear:true,
		minDate:0,
		maxDate:"2M",
		showAnim:"toggle",
		onClose: function(selectedDate) {
			var nextDay=new Date(selectedDate);
			nextDay.setDate(nextDay.getDate()+1);
			var nextTwo=new Date(selectedDate);
			nextTwo.setDate(nextTwo.getDate()+14);
			$("#d2").datepicker("option","minDate",nextDay);
			$("#d2").datepicker("option","maxDate",nextTwo);
		}
	});
	$("#d2").datepicker({
		dateFormat:'yy-mm-dd',
		dayNamesMin:['일','월','화','수','목','금','토'],
		monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		yearSuffix:"년",
		showMonthAfterYear:true,
		minDate:0,
		showAnim:"toggle"
	});
	
	function wish(img){
		event.stopPropagation();
		bindCk=false;
		var cate_number= img.nextSibling.nextSibling;
		var service_number= img.nextSibling;
		
		if(img.alt=='heart'){
			$.getJSON("${cp}/wishDelete", {"cate_number":cate_number.value,"service_number":service_number.value },
				function(data) {
				let result = data.code;
				if(result=='delete_success'){
					img.src="${cp }/resources/images/brokenHRT.svg"
					img.alt = 'brokenHRT';
				}else if(result=='delete_fail'){
					alert("delete ERROR");
				}
			});
// 			console.log(user_id.value+"/"+cate_number.value+"/"+service_number.value);
		}else if(img.alt=='brokenHRT' ){
			$.getJSON("${cp}/wishInsert", {"cate_number":cate_number.value,"service_number":service_number.value},
				function(data) {
				let result = data.code;
				if(result=='insert_success'){
					img.src="${cp}/resources/images/HRT.svg"
					img.alt = 'heart';
				}else if(result=='insert_fail'){
					alert("insert ERROR");
				}
			});
		}else if(img.alt=='emptyheart'){
			$.getJSON("${cp}/wishInsert", {"cate_number":cate_number.value,"service_number":service_number.value},
				function(data) {
				let result = data.code;
				if(result=='insert_success'){
					img.src="${cp }/resources/images/HRT.svg"
					img.alt = 'heart';
				}else if(result=='insert_fail'){
					alert("insert ERROR");
				}
			});
		}
	}
</script>