import 'package:flutter/material.dart';
import 'pages/category_page/category_page.dart';  // 정확한 경로로 import

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silver Market App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoryPage(),  // CategoryPage 사용
    );
  }
}
