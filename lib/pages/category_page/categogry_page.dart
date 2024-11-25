import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key}); // const 생성자 추가

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Page'),
      ),
      body: const Center(
        child: Text(
          '카테고리 페이지',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
