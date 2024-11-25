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
      body: Stack(
        children: [
          // Main Content
          Column(
            children: [
              // Category Name Section
              CategoryName(),
              // List of Items Section
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Example item count
                  itemBuilder: (context, index) {
                    return Item();
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
                  // Add your action here
                },
                backgroundColor: Colors.white, // White background
                elevation: 5, // Shadow for the button
                child: Text(
                  '+', // Black "+" symbol
                  style: TextStyle(
                    fontSize: 28, // Larger font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Black color for "="
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
