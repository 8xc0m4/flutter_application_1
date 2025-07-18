// lib/models/item.dart
import 'package:flutter/material.dart';

class Item {
  final String id; // 상품 고유 ID
  final String name; // 상품 이름
  final String description; // 상품 설명
  final String imagePath; // 상품 이미지 경로 (assets/images/xxx.jpg)
  final int price; // 상품 가격

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
  });
}
