import 'package:flutter/material.dart';
import 'package:silvermarket/pages/common/appbar.dart';

class ItemInfoPage extends StatelessWidget {
  const ItemInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '상품 상세 페이지'),
      body: Column(
        children: [
          Image.network(
            'https://via.placeholder.com/400', // Replace with any image URL
            fit: BoxFit.cover, // Adjust image fitting
            height: 400, // Set height for the image
            width: double.infinity, // Make it stretch across the screen
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text(
                  '상품이름',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '18,000원',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text("어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구",
                  style: TextStyle(fontSize: 20))),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 30, vertical: kBottomNavigationBarHeight),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_circle_outline),
                ),

                // Quantity Display
                Text(
                  '0',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Increase Button
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_circle_outline),
                ),
                Text(
                  "총 가격",
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Text('18,000원'),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
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
