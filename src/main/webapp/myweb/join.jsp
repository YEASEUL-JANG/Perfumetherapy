<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원가입</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp" %>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico.png" />
<link href="../Resources/css/styles.css" rel="stylesheet" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
.i{
color: #048dcd;
font-weight: bolder;
font-size: 20px;}
.jointable{
margin: 20px 0px;
width: 100%;
border-left: none;
border-right: none;
border-top: 1px solid #e8e8e8;
border-bottom: 1px solid #e8e8e8;

}
.jointable th{
color: #999;
border-bottom: 1px solid #e8e8e8;
background: #fafafa;
width: 200px;
text-align: center;
padding: 20px;
font-size: 15px;

}
.jointable td{
color: #333;
border-bottom: 1px solid #e8e8e8;
font-size: 15px;
padding: 20px;
}
#agreement{
width: 100%;
background: #fafafa;
font-size: 15px;
border: 1px solid #d7d7d7;
}
#agreement td{
padding: 25px;
color: #333;
border-bottom: 1px solid #d7d7d7;
}

.scrollbox{
overflow: scroll;
width: 100%;
height: 100px;
font-size: 11px;
padding: 10px;
background-color: white;
border: 1px solid #e8e8e8;
color: #747474;
margin: 15px;
}
#j_button{
background: #222;
font-size: 15px;
font-weight: bold;
color: white;
padding: 15px;
width: 220px;
border-radius: 10px;
margin: 25px;
}
.id_ok{
color: #048dcd;
display: none;
}

.id_already{
color:red; 
display: none;
}
</style>
<script type="text/javascript">
 function execDaumPostcode() {
  new daum.Postcode({
   oncomplete: function(data) {
    var addr = ''; 
    var extraAddr = ''; 
    if (data.userSelectedType === 'R') { 
        addr = data.roadAddress;
    } else { 
        addr = data.jibunAddress;
    }
    if(data.userSelectedType === 'R'){
        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            extraAddr += data.bname;
        }
        if(data.buildingName !== '' && data.apartment === 'Y'){
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        if(extraAddr !== ''){
            extraAddr = ' (' + extraAddr + ')';
        }
        document.getElementById("extraAddress").value = extraAddr;
    
    } else {
        document.getElementById("extraAddress").value = '';
    }
    document.getElementById("postcode").value = data.zonecode;
    document.getElementById("address").value = addr;
    document.getElementById("detailAddress").focus();
   }
  }).open();
 }
$(function(){
    $(".checkbox_group").on("click", "#check_all", function () {
        $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
    });

    $(".checkbox_group").on("click", ".normal", function() {
        var is_checked = true;

        $(".checkbox_group .normal").each(function(){
            is_checked = is_checked && $(this).is(":checked");
        });

        $("#check_all").prop("checked", is_checked);
    });
});  

function checkId(){
	const id = $("#userid").val();
	$.ajax({
		type : "post",
		url : "${path}/user_servlet/idcheck.do",
		data: {id: id},
		success : function(result){
			if(result == 0){//사용가능아이디
				$('.id_ok').css("display","inline-block"); 
                $('.id_already').css("display", "none");
			}else{//존재하는 아이디
				$('.id_already').css("display","inline-block");
                $('.id_ok').css("display", "none");
			} 
		},
		error: function(){
			alert("에러입니다.");
		}
	});
}

function join(){
	const userid = $("#userid").val();
	const passwd = $("#passwd").val();
	const passwdck = $("#passwdck").val();
	const uname = $("#uname").val();
	const gender = $('input[name=gender]:checked').val();
	const address=$("#address").val();
	const detailAddress=$("#detailAddress").val();
	const extraAddress=$("#extraAddress").val();
	const phone = $("#phone").val();
	const user_email = $("#user_email").val();
	const middle = $("#middle").text();
	const email_address = $("#email_address").val();
	//정보입력 확인
	if(userid == ""){
		alert("아이디를 입력하세요");
		return;
	}
	const exp1 = /^[a-z0-9]{4,12}$/;
	if(!exp1.test(userid)){
		alert("ID는 영문소문자,숫자구성 4-16글자이내로 설정하세요.");
		return;
	}
	if(passwd == ""){
		alert("비밀번호를 입력하세요");
		return;
	}
	const exp2= /^(?=.*[A-Za-z])(?=.*[!@#$%^&*_+])(?=.*\d){4,16}/;
	if(!exp2.test(passwd)){
		alert("비밀번호는 영문,숫자,특수문자 포함 4-16글자이내로 설정하세요.");
		return;
	}
	if(passwd != passwdck){
		alert("비밀번호가 일치하지 않습니다.");
		return;
	}
	if(uname == ""){
		alert("이름를 입력하세요");
		return;
	}
	if(gender == ""){
		alert("성별을 체크하세요");
		return;
	}
	if(address == ""){
		alert("주소를 입력하세요");
		return;
	}
	if(phone == ""){
		alert("휴대폰 번호를 입력하세요");
		return;
	}
	if(user_email == ""){
		alert("이메일 주소를 입력하세요");
		return;
	}
	//값 합치기
	if(user_email != "" && email_address != "") {
		$("#totalemail").val(user_email+middle+email_address);
	}
	//이용약관 확인
	if($("#check_1").is(':checked') && $("#check_2").is(':checked') ){
		alert("가입하시겠습니까?");
		document.input.action="${path}/user_servlet/join.do";
		document.input.submit(); 
	}else{
		alert("이용약관을 확인해주세요.");
	}
}

</script>
</head>
<body>
<!-- nav -->
  <header>
  <jsp:include page="navbar.jsp"></jsp:include>
  </header>
  <!-- content -->
  <section class="py-5">
  <div class="container px-4 px-lg-5 mt-5">
   <div class="justify-content-center">
    <p><h2 class="fw-bold">회원 가입</h2>
    <table border="1" class="jointable">
     <tr>
      <th>회원구분</th>
      <td><input type="radio" checked> 개인회원</td>
     </tr>
    </table>
    <p><h4 class="fw-bold">기본 정보</h4>
    <span style="display:flex; flex-direction: row-reverse;"><span class="i">*</span>필수입력사항 </span>
    <!-- 입력폼 -->
    <form name="input" method="post">
    <table border="1" class="jointable">
    <tr>
     <th>아이디<span class="i">*</span></th>
     <td><input name="userid" id="userid" size="25" oninput="checkId()"> (영문소문자/숫자,4~16자)<br>
     <span class="id_ok">사용 가능한 아이디입니다.</span>
     <span class="id_already">이미 사용중인 아이디입니다.</span></td>
     </tr>
     <tr>
     <th>비밀번호<span class="i">*</span></th>
     <td><input type="password" id="passwd" name="passwd" size="25"> (영문/숫자/특수문자 모두포함, 4자~16자)</td>
    </tr>
    <tr>
     <th>비밀번호 확인<span class="i">*</span></th>
     <td><input type="password" id="passwdck" name="passwdck" size="25"></td>
    </tr>
    <tr>
     <th>이름<span class="i">*</span></th>
     <td><input name="uname" id="uname" size="25"></td>
    </tr>
    <tr>
     <th>성별<span class="i">*</span></th>
     <td><input type="radio" name="gender" class="gender" value="man"> 남자
      	 <input type="radio" name="gender" class="gender" value="woman"> 여자</td>
    </tr>
    <tr>
     <th>주소<span class="i">*</span></th>
     <td><input type="text" id="postcode" placeholder="우편번호" name="postcode">
		<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="address" placeholder="주소" name="address"><br>
		<input type="text" id="detailAddress" name = "detailAddress"placeholder="상세주소">
		<input type="text" id="extraAddress" name = "extraAddress"></td>
    </tr>
    <tr>
     <th>일반전화</th>
     <td><input name="hphone" id="hphone" size="25"></td>
    </tr>
    <tr>
     <th>휴대전화<span class="i">*</span></th>
     <td><input name="phone" size="25" id="phone" placeholder="01012345678"> ('-'없이)</td>
    </tr>
     <tr>
     <th>이메일<span class="i">*</span></th>
     <td>
     <input type="text" id="user_email" required><span id="middle">@</span>
     <input type="text" id="email_address" list="user_email_address">
		<datalist id="user_email_address">
			<option value="naver.com" checked></option>
			<option value="daum.net"></option>
			<option value="nate.com"></option>
			<option value="google.com"></option>
			<option value="직접입력"></option>
		</datalist>
		<input type="hidden" id="totalemail" name="email" value="">
     </td>
    </tr>
    <tr>
    </table>
    </form>
    <p>
    <p><h4 class="fw-bold">전체 동의</h4></p>
    <div class="checkbox_group">
    <table border="1" class="checkbox_group" id="agreement">
    <tr>
    <td><input type="checkbox" id="check_all"> 
    <label for="check_all"><b>이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</b></label>
    </td>
    </tr>
    <tr>
    <td><span style="color: red;">[필수]</span> 이용약관 동의<br>
    <div class="scrollbox">
    제1조(목적)
     이 약관은 (주)퍼퓸테라피 (전자상거래 사업자)가 운영하는 사이버 몰(이하 "몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.
     「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」
     제2조(정의)
     ①"몰" 이란 회사가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
     ②"이용자"란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
     ③"회원"이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
     ④"비회원"이라 함은 회원에 가입하지 않고 "몰"이 제공하는 서비스를 이용하는 자를 말합니다.
     
     제3조 (약관 등의 명시와 설명 및 개정)
     ①"몰"은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호•모사전송번호•전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
     ②"몰"은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회•배송책임•환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
     ③"몰"은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
     ④"몰"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰"은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
     ⑤"몰"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 "몰"에 송신하여 "몰"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
     ⑥이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
    </div>
    이용약관에 동의합니까? <input type="checkbox" id="check_1" class="normal"> 동의함
    </td>
    </tr>
    <tr>
    <td><span style="color: red;">[필수]</span> 개인정보 수집 및 이용 동의 <br>
    <div class="scrollbox">
     ** 본 양식은 쇼핑몰 운영에 도움을 드리고자 샘플로 제공되는 서식으로 쇼핑몰 운영형태에 따른 수정이 필요합니다. 쇼핑몰에 적용하시기 전, 쇼핑몰 운영 사항 등을 확인하시고 적절한 내용을 반영하여 사용하시기 바랍니다. **
     1. 개인정보 수집목적 및 이용목적
     가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
     콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스
     나. 회원 관리
     회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달
     2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보
     3. 개인정보의 보유기간 및 이용기간
     원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
     가. 회사 내부 방침에 의한 정보 보유 사유
     o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : 5년
     나. 관련 법령에 의한 정보보유 사유
     o 계약 또는 청약철회 등에 관한 기록
     -보존이유 : 전자상거래등에서의소비자보호에관한법률
     -보존기간 : 5년
    </div>
    개인정보 수집 및 이용에 동의하십니까? <input type="checkbox" id="check_2" class="normal"> 동의함
    </td>
    </tr>
    <tr>
    <td>[선택] 쇼핑정보 수신 동의<br>
    <div class="scrollbox">
    할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.
	단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.
	선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.
    </div>
    이메일 수신을 동의하십니까? <input type="checkbox" id="check_3" class="normal"> 동의함
    </td>
    </tr>
    </table>
    </div>
    <div align="center"><input type="button" id="j_button" value="회원가입" onclick="join()"></div>
    </div>
   </div>
  </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>