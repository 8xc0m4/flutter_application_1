import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ItemRegister extends StatefulWidget {
  const ItemRegister({super.key});

  //Function(image, name, price, description) onResister;

  @override
  State<ItemRegister> createState() => _ItemRegister();
}

class _ItemRegister extends State<ItemRegister> {
  // late String itemName;
  // late int itemPrice;
  // late String itemDescription;

  File? _image;

  // 이미지 피커
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  // 빌드 - * 레이아웃 디자인 나오면 맞춰서 수정해야함 *
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("상품 등록"),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                selectImage(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 5),
                    itemText("상품 이름"),
                    const SizedBox(width: 5),
                    Expanded(child: nameTextField()),
                    const SizedBox(width: 5),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 5),
                    itemText("상품 가격"),
                    const SizedBox(width: 5),
                    Expanded(child: priceTextField()),
                    const SizedBox(width: 5),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: itemText("상품 설명"),
                ),
              ],
            ),
          ),
          Expanded(child: descriptionTextField()),
          registerBotton(),
        ],
      ),
    );
  }

  GestureDetector selectImage() {
    return GestureDetector(
      onTap: _pickImage,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 250,
          width: double.infinity,
          color: Color(0xFF95C5D4),
          alignment: Alignment.center,
          child: _image == null
              ? const Text(
                  "사진 선택",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              : Image.file(_image!, fit: BoxFit.cover),
        ),
      ),
    );
  }

  // 상품 정보 텍스트 디자인
  Widget itemText(String iteminfo) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        iteminfo,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 상품 이름 텍스트 필드
  Padding nameTextField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: borderDecoration("상품명"),
        cursorColor: Color(0xFF95C5D4),
      ),
    );
  }

  // 상품 가격 텍스트 필드
  Widget priceTextField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(fontSize: 12),
        keyboardType: TextInputType.number,
        decoration: borderDecoration("숫자만 입력해주세요.(단위 : 원)"),
        cursorColor: Color(0xFF95C5D4),
      ),
    );
  }

  // 상품 설명 텍스트 필드
  Widget descriptionTextField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        height: 150,
        child: TextField(
          style: TextStyle(fontSize: 12),
          minLines: 10,
          maxLines: null,
          textAlignVertical: TextAlignVertical.top,
          decoration: borderDecoration("상품 설명을 입력하세요."),
          cursorColor: Color(0xFF95C5D4),
        ),
      ),
    );
  }

  // 보더 속성
  InputDecoration borderDecoration(String guideText) {
    return const InputDecoration(
      hintText: "",
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF95C5D4)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF95C5D4)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pinkAccent),
      ),
    );
  }

  // 등록하기 버튼
  Widget registerBotton() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF95c5d4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
            child: const Text(
              "등록하기",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            // ? () {
            //     Navigator.pop(context, Image, name, price, ItemRegister);
            //   }
            // : null,
          ),
        ),
      ),
    );
  }
}
