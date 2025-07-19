import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/item.dart';
import 'package:image_picker/image_picker.dart';

class ItemRegister extends StatefulWidget {
  const ItemRegister({super.key});

  @override
  State<ItemRegister> createState() => _ItemRegister();
}

class _ItemRegister extends State<ItemRegister> {
  // 텍스트 필드 컨트롤러
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();

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

  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      print("dlfma");
      setState(() {});
    });
    priceController.addListener(() {
      print("dlfma");

      setState(() {});
    });
  }

  // 빌드 - * 레이아웃 디자인 나오면 맞춰서 수정해야함 *
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 5),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 21, 10, 10),
                      child: itemText("상품 이름"),
                    ),
                    const SizedBox(width: 5),
                    Expanded(child: nameTextField()),
                    const SizedBox(width: 5),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 5),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 21, 10, 10),
                      child: itemText("상품 가격"),
                    ),
                    const SizedBox(width: 5),
                    Expanded(child: priceTextField()),
                    const SizedBox(width: 5),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(17, 21, 10, 10),
                    child: itemText("상품 설명"),
                  ),
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

  // 사진 선택
  GestureDetector selectImage() {
    return GestureDetector(
      onTap: _pickImage,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          height: 250,
          width: double.infinity,
          color: Color(0xFF95C5D4),
          child: _image == null
              ? Align(
                  alignment: Alignment.center,
                  child: const Text(
                    "사진 선택",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : Image.file(_image!, fit: BoxFit.cover),
        ),
      ),
    );
  }

  // 상품 정보 텍스트 디자인
  Widget itemText(String iteminfo) {
    return Text(
      iteminfo,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // 상품 이름 텍스트 필드
  Padding nameTextField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: nameController,
        style: TextStyle(
          fontSize: 12,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "상품 이름은 비워둘 수 없습니다.";
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUnfocus,
        cursorColor: Color(0xFF95C5D4),
        //cursorHeight: 20,
        decoration: borderDecoration("상품 이름을 입력해주세요."),
      ),
    );
  }

  // 상품 가격 텍스트 필드
  Widget priceTextField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: priceController,
        style: TextStyle(fontSize: 12),
        cursorColor: Color(0xFF95C5D4),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "상품 가격은 비워둘 수 없습니다.";
          }
          if (value.startsWith("0")) {
            return "상픔 가격은 0으로 시작할 수 없습니다.";
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUnfocus,
        decoration: borderDecoration("상품 가격을 입력해주세요.(단위:원)"),
      ),
    );
  }

  // 상품 설명 텍스트 필드
  Widget descriptionTextField() {
    return Padding(
      padding: EdgeInsets.fromLTRB(17, 10, 17, 10),
      child: SizedBox(
        height: 150,
        child: TextFormField(
          controller: descriptionController,
          style: TextStyle(fontSize: 12),
          minLines: 10,
          maxLines: null,
          textAlignVertical: TextAlignVertical.top,
          decoration: borderDecoration("상품 설명을 입력해주세요."),
          cursorColor: Color(0xFF95C5D4),
        ),
      ),
    );
  }

  // 보더 속성
  InputDecoration borderDecoration(String guideText) {
    return InputDecoration(
      hintText: guideText,
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

  bool isPossibleRegister() {
    return (nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        _image != null);
  }

  // 등록하기 버튼
  Widget registerBotton() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
            width: double.infinity,
            height: 56,
            child: IgnorePointer(
              ignoring: !isPossibleRegister(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: isPossibleRegister()
                        ? const Color(0xFF95c5d4)
                        : Colors.grey,
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
                  Navigator.pop(
                      context,
                      Item(
                          id: "",
                          name: nameController.text,
                          price: int.parse(priceController
                              .text), // NumberFormat('#,###').format(priceController.text),를 쓰면 15,000원 이렇게 나와용!!
                          description: descriptionController.text,
                          imagePath: _image!.path));
                },
              ),
            )),
      ),
    );
  }
}






/// ---소린 : 아이템 넘길때 이거 참고하셔도 좋을 것 같아요!!! ---
/// 
// final itemProvider = Provider.of<ItemProvider>(context, listen: false);

// void _submitForm() {
//   final newItem = Item(
//     id: const Uuid().v4(), // uuid로 고유 id 생성
//     name: nameController.text,
//     price: int.parse(priceController.text),
//     imagePath: _imagePath,
//     description: descriptionController.text,
//   );

//   itemProvider.addItem(newItem);

//   Navigator.pop(context); // 등록 후 뒤로
// }
