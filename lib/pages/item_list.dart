
///-- 소린: 아이템 상세 페이지로 넘길때 이렇게 부탁드려요!!! --
// onTap: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => ItemDetail(item: item),
//     ),
//   );
// }

/// -------------------------------------
///-- 소란: item 모델 활용하는 법! 참고용입니당~~~
/// ListView.builder를 사용하여 상품 리스트를 표시할 때 item 모델을 활용하는 모델입니다.
/// 
// final items = Provider.of<ItemProvider>(context).items;

// ListView.builder(
//   itemCount: items.length,
//   itemBuilder: (_, index) {
//     final item = items[index];
//     return ListTile(
//       title: Text(item.name),
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => ItemDetail(item: item),
//           ),
//         );
//       },
//     );
//   },
// )


