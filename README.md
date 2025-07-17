# Team Projact - ShoppingMall

### 상품 목록 페이지 (item_list.dart)

- 상단 앱바 타이틀
- 상품목록은 카드 형식으로 되어 있음
- 상품 이미지, 상품 이름, 상품가격
  - (예외) 상품이 없으면 '상품이 없습니다' 출력
  - 가격이 세 자리 수 이상일 경우 세 자리마다 콤마(,) 찍기
  - 가격이 0 일 경우 “무료” 등 표현하기

### 상품 상세 페이지 (item_detail.dart)

- 앱바 타이틀
- 이미지
- 상품명
- 상품 설명
- 상품 개수
- 구매하기버튼
- 연상되는 금액 출력
  - (예외) 구매하기 버튼을 누를 때 개수가 1 이상인지 체크하는 로직

### 상품 등록 페이지 (item_register.dart)

- 앱바 타이틀
- 이미지
- 상품명
- 상품 가격
- 상품 설명
- 등록하기 버튼

# Divice:

iphone 16 pro max

도전 기능

- 장바구니

|     |     |     |
| --- | --- | --- |
|     |     |     |

/lib
├── main.dart  
├── item_list.dart  
├── item_detail.dart  
├── item_register.dart  
├── /assets
│ └── /item_description
| └── descriptions.dart
| └── /item_images
