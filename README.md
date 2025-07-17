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

|  이름   |  담당   |     |
| --- | --- |--- |
| 이상록   |   프로젝트 총괄, 컨벤션, 룰 셋업  |     |
|   정소린  |  상품 상세 페이지 만들기   |     |
|    임초희  | 프로젝트 협업 리더, 상품 목록 페이지 만들기   |     |
|  김영민   |   상품 등록 페이지 만들기   |     |
|  공통   |  SA 작성 , 스크럼 일지 정리, QnA 정리 등.. + 시연 영상, 발표 자료, ReadMe   |     |

```dart
/lib
├── main.dart  
├── item_list.dart  
├── item_detail.dart  
├── item_register.dart  
├── /assets
│ └── /item_description
|    └── descriptions.dart
| └── /item_images
```



Type 설명 참고사항

---

Feat 기능 추가 기능 당 최초 한 번만 사용

---

Build 라이브러리 세팅/업데이트 라이브러리 설치 최초 한 번만 사용

---

Update 라이브러리 버전 업데이트/커스텀  

---

Config Config 파일 설정  

---

Remove 파일 삭제  

---

Fix 기능 에러 수정  

---

HotFix 치명적인 버그 수정 main 브랜치에 바로 반영

---

Style UI 관련 CSS 수정  

---

Chore 단순 코드 수정 주석, 줄 바꿈, 임포트문, 세미콜론 등등..

---

Revise 기능 추가나 덧붙임을 위한 수정  

---

Typo 오타 수정  

---

Modify 기능 변경 있는 코드 개선/변경  

---

Refactor 기능 변경 없는 코드 개선  

---

Asset 이미지, 폰트 리소스 파일

---

Docs 문서 작성  
