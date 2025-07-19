// lib/providers/item_provider.dart
import 'package:flutter/material.dart';
import '../models/item.dart';

// ChangeNotifier를 상속받아 상태 관리를 수행하는 ItemProvider 클래스입니다!
// 상품 리스트를 관리하고, 상품을 추가할 때마다 UI를 업데이트합니다.
class ItemProvider extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

// ----여기는 가짜 데이터!!! ---
  ItemProvider() {
    //앱 시작 시 몇 개의 상품을 미리 추가
    _items.add(Item(
      id: 'mock_1',
      name: '대충 문어',
      description:
          '이 문어는 영국에서 시작되어 행운을 부르는 문어입니다. 이 문어를 구매하고 나서 일주일 내에 지인에게 추천하지 않을 시 문어의 저주가 발생하여 머리가 문어처럼 반짝일 것입니다.',
      imagePath: 'lib/assets/images/octopus.png',
      price: 18000,
    ));
    _items.add(Item(
      id: 'mock_2',
      name: '대충 오징어',
      description:
          '이 오징어는 일본에서 시작되어 행운을 부르는 오징어입니다. 이 오징어를 구매하고 나서 일주일 내에 지인에게 추천하지 않을 시 오징어의 저주가 발생하여 머리가 오징어처럼 반짝일 것입니다.',
      imagePath: 'lib/assets/images/squid.png',
      price: 15000,
    ));
  }
}
