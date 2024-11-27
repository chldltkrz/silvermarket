import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:silvermarket/classes/item_class.dart';
import 'package:silvermarket/controller/cart_controller.dart';
import 'package:silvermarket/pages/common/appbar.dart';
import 'package:silvermarket/pages/item_cart_page/item_cart_page.dart';

class ItemInfoPage extends StatelessWidget {
  final ItemClass item;

  ItemInfoPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: CustomAppBar(title: '상품 상세 페이지'),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          item.image != null
              ? Image.file(
                  File(item.image!.path), // Convert XFile to File
                  fit: BoxFit.cover,
                  height: 400,
                  width: double.infinity,
                )
              : Image.network(
                  'https://via.placeholder.com/400', // Fallback placeholder
                  fit: BoxFit.cover,
                  height: 400,
                  width: double.infinity,
                ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text(
                  item.name,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  NumberFormat('#,###').format(item.price) + '원',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(item.description, style: TextStyle(fontSize: 20)),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 30, vertical: kBottomNavigationBarHeight),
            child: Row(
              children: [
                // Decrease Button
                Obx(() {
                  int itemCount = cartController.cartedItems[item] ?? 0;
                  return IconButton(
                    onPressed: itemCount > 0
                        ? () {
                            cartController.removeItem(item);
                          }
                        : null, // Disable button if count is 0
                    icon: Icon(Icons.remove_circle_outline),
                    color: itemCount > 0 ? Color(0xFF182233) : Colors.grey,
                  );
                }),

                // Quantity Display
                Obx(() {
                  int itemCount = cartController.cartedItems[item] ?? 0;
                  return Text(
                    '$itemCount',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),

                // Increase Button
                IconButton(
                  onPressed: () {
                    cartController.addItem(item);
                  },
                  icon: Icon(Icons.add_circle_outline),
                  color: Color(0xFF182233),
                ),
                Text(
                  "총 가격",
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Obx(() {
                  int itemCount = cartController.cartedItems[item] ?? 0;
                  int totalPrice = itemCount * item.price;
                  return Text(
                    '${NumberFormat('#,###').format(totalPrice)}원',
                    style: TextStyle(fontSize: 20),
                  );
                }),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => ItemCartPage());
                  },
                  child: Text('구매하기'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
