import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item.dart';
import 'package:provider/provider.dart';

class ItemDetail extends StatefulWidget {
  final Item item;

  const ItemDetail({super.key, required this.item});

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  int quantity = 1;
  final Color mainColor = const Color(0xFF95C5D4);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE6ECF2), //seed color
      appBar: AppBar(
        title: Text(
          '상품 상세',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: mainColor),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // 그림자 없이!
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * 0.01,
          ),
          // 이미지 !!
          Container(
            color: mainColor,
            width: double.infinity,
            height: screenHeight * 0.3,
            alignment: Alignment.center,
            child: Image.asset(
              widget.item.imagePath,
              height: screenHeight * 0.2,
              fit: BoxFit.fill,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.image_not_supported),
            ),
          ),
          const SizedBox(height: 24),

          // 설명 영역
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.item.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${widget.item.price}원',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '상품 정보',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            widget.item.description,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // 구매 영역
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewPadding.bottom + 8),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.015,
          ),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
            color: mainColor,
          ),
          height: screenHeight * 0.1,
          width: double.infinity,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 수량 조절
              Row(
                children: [
                  _quantityBox(
                    onPressed: _decreaseQuantity,
                    icon: Icons.remove,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Text('$quantity', style: const TextStyle(fontSize: 22)),
                  SizedBox(width: screenWidth * 0.01),
                  _quantityBox(
                    onPressed: _increaseQuantity,
                    icon: Icons.add,
                  ),
                ],
              ),
              SizedBox(width: screenWidth * 0.01),
              // 총 가격 텍스트 및 금액 (겹치게 배치)
              SizedBox(
                width: screenWidth * 0.3, // 총 가격 영역 너비 조절
                height: screenHeight * 0.1, // Stack 높이 조절
                child: Stack(
                  children: [
                    // '총 가격' 텍스트 (위쪽)
                    Positioned(
                      left: 0,
                      top: screenHeight * 0.005,
                      child: Text(
                        '총 가격',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // 가격 텍스트 (조금 아래, 겹쳐지게)
                    Positioned(
                      left: screenWidth * 0.1,
                      top: screenHeight * 0.03, // 이 값을 조정하면 겹침 정도 조절 가능
                      child: Text(
                        '${widget.item.price * quantity}원',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // // 가격 표시
              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     const Text('총 가격', style: TextStyle(fontSize: 12)),
              //     Text('${widget.item.price * quantity}원',
              //         style: const TextStyle(
              //             fontSize: 16, fontWeight: FontWeight.bold)),
              //   ],
              // ),
              SizedBox(width: screenWidth * 0.01),
              // 구매 버튼
              ElevatedButton(
                onPressed: _showPurchaseDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Buy',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 수량 조절 관련 위젯!!!
  ///

  void _increaseQuantity() {
    if (quantity < 99) {
      setState(() {
        quantity++;
      });
    }
  }

  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void _showPurchaseDialog() {
    showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('구매 확인'),
        content: Text('${widget.item.name}을 $quantity개 구매하시겠어요?'),
        actions: [
          CupertinoDialogAction(
            child: const Text('취소', style: TextStyle(color: Colors.blueGrey)),
            onPressed: () => Navigator.pop(ctx),
          ),
          CupertinoDialogAction(
            child: const Text('확인', style: TextStyle(color: Colors.black)),
            onPressed: () {
              Navigator.pop(ctx);
              _showCompleteDialog();
            },
          ),
        ],
      ),
    );
  }

  void _showCompleteDialog() {
    showCupertinoDialog(
      context: context,
      builder: (ctx) {
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (Navigator.canPop(ctx)) {
            Navigator.pop(ctx);
          }
        });
        return const CupertinoAlertDialog(
          title: Text('구매 완료'),
          content: Text('감사합니다!'),
        );
      },
    );
  }

  Widget _quantityBox(
      {IconData? icon, VoidCallback? onPressed, Widget? child}) {
    return Container(
      width: 36,
      height: 36,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: icon != null
            ? IconButton(
                icon: Icon(icon, size: 24, color: mainColor),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: onPressed,
              )
            : child!,
      ),
    );
  }
}
