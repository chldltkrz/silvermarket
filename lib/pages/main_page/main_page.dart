import 'package:flutter/material.dart';
import 'package:silvermarket/pages/item_info_page/item_info_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ItemInfoPage());
  }
}
