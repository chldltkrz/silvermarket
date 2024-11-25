import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silvermarket/controller/cart_controller.dart';
import 'package:silvermarket/controller/item_controller.dart';
import 'package:silvermarket/pages/main_page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(ItemController(), permanent: true);
    Get.put(CartController(), permanent: true);
    return GetMaterialApp(
      title: 'InnoWave Silver Market',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}
