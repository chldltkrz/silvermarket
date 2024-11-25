import 'package:flutter/material.dart';
import 'package:silvermarket/pages/common/appbar.dart';
import 'package:silvermarket/pages/item_list_page/widget/category_name.dart';
import 'package:silvermarket/pages/item_list_page/widget/item.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '상품 목록 페이지'),
      body: Column(
        children: [
          CategoryName(),
          Item(),
        ],
      ),
    );
  }
}
