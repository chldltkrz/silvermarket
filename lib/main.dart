import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silvermarket/controller/cart_controller.dart';
import 'package:silvermarket/controller/item_controller.dart';
import 'package:silvermarket/pages/main_page/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ItemController(), permanent: true);
    Get.put(CartController(), permanent: true);
    return GetMaterialApp(
      title: 'InnoWave Silver Market',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoryPage(),  // CategoryPage 사용
    );
  }
}
