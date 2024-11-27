import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silvermarket/controller/item_controller.dart';
import 'package:silvermarket/pages/common/appbar.dart';
import 'package:silvermarket/pages/item_list_page/widget/category_name.dart';
import 'package:silvermarket/pages/item_list_page/widget/item.dart';
import 'package:silvermarket/pages/item_regi_page/item_regi_page.dart';

class ItemListPage extends StatelessWidget {
  ItemListPage({super.key});
  final args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '상품 목록 페이지'),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Main Content
          Column(
            children: [
              // Category Name Section
              CategoryName(category: args['category']),
              // List of Items Section
              Expanded(
                child: GetBuilder<ItemController>(
                  builder: (controller) {
                    return ListView(
                      children: List.generate(
                        Get.find<ItemController>().getItems().length,
                        (index) => Item(
                            item: Get.find<ItemController>()
                                .getItems()
                                .elementAt(index)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // Floating Button in Absolute Position
          Positioned(
            bottom: 60, // Adjust the distance from the bottom
            right: 40, // Adjust the distance from the right
            child: SizedBox(
              width: 70, // Increase button size
              height: 70, // Increase button size
              child: FloatingActionButton(
                onPressed: () {
                  Get.to(() => ItemRegiPage());
                },
                backgroundColor: Colors.white, // White background
                elevation: 5, // Shadow for the button
                child: Text(
                  '+', // Black "+" symbol
                  style: TextStyle(
                    fontSize: 28, // Larger font size
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF182233), // Black color for "="
                  ),
                ),
                shape: CircleBorder(), // Ensures the button is perfectly round
              ),
            ),
          ),
        ],
      ),
    );
  }
}
