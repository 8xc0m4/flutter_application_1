import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item.dart';

class ItemDetail extends StatefulWidget {
  final Item item;

  const ItemDetail({super.key, required this.item});

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  int _quantity = 1; // 초기 수량 설정

  @override
  Widget build(BuildContext context) {
    // MediaQuery를 사용하여 화면 크기 가져오기
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //Theme에서 색상 가져오기
    final lightSkyBlue = Theme.of(context).colorScheme.primary;
    final skyBlue = Theme.of(context).colorScheme.secondary;
    final blue = Theme.of(context).colorScheme.tertiary;

    final black3 = Theme.of(context).colorScheme.onSurface;
    final white = Theme.of(context).colorScheme.surface;

    // functions
    final totalPrice = widget.item.price * _quantity; // 총 가격 계산

    return Scaffold(
      backgroundColor: lightSkyBlue,
      appBar: AppBar(
        title: Text(
          '상품 상세',
          style: TextStyle(color: blue),
        ),

        elevation: 0, // 평면으로 보이게 그림자 제거!
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // === body 1: import image ===
          Container(
            height: screenHeight * 0.4, // 화면 높이의 40% 사용
            width: screenWidth, // 화면 너비 전체 사용
            padding: const EdgeInsets.all(8.0), // 이미지 주변에 패딩 추가
            color: white,
            // 이미지 표시
            child: Image.file(
              File(widget.item.imagePath),
              fit: BoxFit.cover,
              // 이미지 로딩 실패 시 아이콘 표시
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          // === body 2: 상품 이름, 가격, 설명 ===
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05), // 화면 너비의 5% 패딩
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
              children: <Widget>[
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // 이름과 가격을 양쪽 끝에 배치
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      widget.item.name,
                      style: TextStyle(
                        fontSize: screenWidth * 0.06, // 화면 너비의 6% 크기
                        fontWeight: FontWeight.bold,
                        color: black3,
                      ),
                    )),
                    Text(
                      '${widget.item.price.toString()}원',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05, // 화면 너비의 5% 크기
                        fontWeight: FontWeight.bold,
                        color: blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02), // 화면 높이의 2% 간격
                Text(
                  '상품 정보',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // 화면 너비의 5% 크기
                    fontWeight: FontWeight.bold,
                    color: black3,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // 화면 높이의 2% 간격
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.03), // 화면 너비의 3% 패딩
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.item.description,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // 화면 너비의 4% 크기
                      height: 1.5,
                      color: black3,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // === body 3: 수량 조절 및 총 가격, 구매 버튼 ===
          const Spacer(), // Spacer를 사용하여 아래 버튼을 화면 하단에 위치시킴

          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05), // 화면 너비의 5% 패딩
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Row-1: 수량 선택 텍스트
                    Text(
                      '수량 선택',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05, // 화면 너비의 5% 크기
                        fontWeight: FontWeight.bold,
                        color: black3,
                      ),
                    ),
                    // Row-2: 수량 조절 버튼과 숫자 담는 내부 Row
                    Row(
                      children: [
                        _buildQuantityButton(
                          Icons.remove,
                          () {
                            setState(() {
                              if (_quantity > 1) _quantity--;
                            });
                          },
                          screenWidth,
                        ),
                        SizedBox(width: screenWidth * 0.04), // 화면 너비의 4% 간격
                        Text(
                          '$_quantity',
                          style: TextStyle(
                            fontSize: screenWidth * 0.05, // 화면 너비의 5% 크기
                            fontWeight: FontWeight.bold,
                            color: black3,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.04), // 화면 너비의 4% 간격
                        _buildQuantityButton(
                          Icons.add,
                          () {
                            setState(() {
                              _quantity++;
                            });
                          },
                          screenWidth,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: screenWidth * 0.3, // 화면 너비의 30% 사용
                ),
                // 총 가격 표시하는 Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 총 가격 텍스트 (왼쪽 위)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '총 가격',
                          style: TextStyle(
                            fontSize: screenWidth * 0.05, // 화면 너비의 5% 크기
                            fontWeight: FontWeight.bold,
                            color: black3,
                          ),
                        ),
                      ],
                    ),
                    // 총 가격 숫자 (오른쪽 아래)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${totalPrice.toString()}원',
                          style: TextStyle(
                            fontSize: screenWidth * 0.05, // 화면 너비의 5% 크기
                            fontWeight: FontWeight.bold,
                            color: blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02), // 화면 높이의 2% 간격
                // --- 구매 버튼 ---
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.065, // 화면 높이의 65% 사용
                  child: ElevatedButton(
                    onPressed: () {
                      // 구매 버튼 클릭 시 동작
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('${widget.item.name} $_quantity개 구매 완료!'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: skyBlue, // 버튼 배경색
                      foregroundColor: white, // 버튼 텍스트 색상
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // 둥근 모서리
                      ),
                      elevation: 3, // 그림자 효과
                    ),
                    child: Text(
                      'Buy',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05, // 화면 너비의 5% 크기
                        fontWeight: FontWeight.bold,
                        color: black3, // 버튼 텍스트 색상
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

@override
// 수량 조절 버튼 위젯 (MediaQuery 적용)
Widget _buildQuantityButton(
    IconData icon, VoidCallback onPressed, double screenWidth) {
  return Container(
    width: screenWidth * 0.1, // 화면 너비의 10%
    height: screenWidth * 0.1, // 화면 너비의 10%
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.grey),
    ),
    child: IconButton(
      icon: Icon(icon, size: screenWidth * 0.05), // 아이콘 크기도 화면 너비에 비례
      onPressed: onPressed,
    ),
  );
}
