<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<div class="wrap">
    <div>결제 페이지</div>
    <div>${UserVO.email }</div>
    <input type="button" id="naverPayBtn" value="네이버페이 결제 버튼">
    <input type="button" value="카카오페이 결제 버튼">
    <input type="button" value="토스 결제 버튼">

    <script>
        var email = "${UserVO.email}";  // 사용자 이메일을 JavaScript로 전달
        
        // 네이버페이 SDK 초기화
        var oPay = Naver.Pay.create({
            "mode": "development", // 개발 모드 (배포 시 production으로 변경)
            "payType": "normal", // 일반 결제
            "clientId": "HN3GGCMDdTgGUfl0kFCo", // 실제 clientId 값으로 변경 필요
            "chainId": "a1liMUNoOXZKOU5" // 실제 chainId 값으로 변경 필요
        });

        // 결제 버튼 클릭 시 네이버페이 결제 시작
        document.getElementById("naverPayBtn").addEventListener("click", function() {
            oPay.open({
                "merchantUserKey": email,  // 사용자의 이메일을 가맹점 사용자 키로 전달
                "merchantPayKey": "partnder-orderkey", // 실제 가맹점의 주문 키로 변경 필요
                "productName": "level 2", // 결제 상품명
                "totalPayAmount": 6900, // 총 결제 금액
                "taxScopeAmount": 6900, // 과세 금액
                "taxExScopeAmount": 0, // 비과세 금액
                "productCount": 1, // 상품 수량
                "returnUrl": "http://localhost:8080/paymentResult", // 결제 후 돌아올 URL
                "productItems": [
                    {
                        "categoryType": "ETC",
                        "categoryId": "ETC",
                        "uid": "1234", // 상품 고유 ID
                        "name": "test", // 상품명
                        "payReferrer": "ETC", // 결제 출처
                        "count": 1 // 수량
                    },
                    {
                        "categoryType": "ETC",
                        "categoryId": "ETC",
                        "uid": "4567",
                        "name": "test2",
                        "payReferrer": "ETC",
                        "count": 2
                    }
                ]
            });
        });
        
        //oPay.close(); // SPA ( Single Page Application ) 의 경우 네이버페이 결제 화면을 닫습니다.
    </script>
</div>