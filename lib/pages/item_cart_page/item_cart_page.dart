import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:silvermarket/controller/cart_controller.dart';
import 'package:silvermarket/pages/category_page/categogry_page.dart';
import 'package:silvermarket/pages/common/appbar.dart';
import 'package:silvermarket/pages/item_cart_page/widget/item_confirm.dart';
import 'package:silvermarket/pages/item_cart_page/widget/item_info.dart';

class ItemCartPage extends StatelessWidget {
  const ItemCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;

    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: CustomAppBar(title: '장바구니'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF182233)),
            ),
            SizedBox(height: 20),

            // Display carted items dynamically
            Expanded(
              child: Obx(() {
                final cartedItems = cartController.cartedItems;

                if (cartedItems.isEmpty) {
                  return Center(
                    child: Text(
                      '카트가 비어있습니다!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: cartedItems.length,
                  itemBuilder: (context, index) {
                    final item = cartedItems.keys.toList()[index];
                    final quantity = cartedItems[item]!;
                    return ItemInfo(
                      item: item,
                      quantity: quantity,
                      onRemove: () => cartController.removeItem(item),
                      onAdd: () => cartController.addItem(item),
                      onDelete: () => cartController.deleteItem(item),
                    );
                  },
                );
              }),
            ),

            Spacer(),

            // Display item confirmation section
            Obx(() {
              totalPrice = cartController.cartedItems.entries
                  .map((entry) => entry.key.price * entry.value)
                  .fold(
                      0,
                      (value, element) =>
                          value + element); // Use fold instead of reduce

              return ItemConfirm(totalPrice: totalPrice);
            }),

            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('결제알림'),
                            content: Text('총 금액은 ${NumberFormat('#,###').format(
                              totalPrice,
                            )} 원이 결제 됩니다'),
                            actions: [
                              CupertinoDialogAction(
                                child: Text('OK'),
                                onPressed: () {
                                  cartController.clearCart();
                                  Get.to(() => CategoryPage());
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    }, // Add purchase logic
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF182233),
                    ),
                    child: Text(
                      '구매하기',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
