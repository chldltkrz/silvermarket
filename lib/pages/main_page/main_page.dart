import 'package:flutter/material.dart';
import 'package:silvermarket/pages/item_cart_page/item_cart_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ItemCartPage());
  }
}
