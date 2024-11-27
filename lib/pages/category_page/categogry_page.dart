import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silvermarket/pages/item_cart_page/item_cart_page.dart';
import 'package:silvermarket/pages/item_list_page/item_list_page.dart';
import 'package:silvermarket/pages/main_page/main_page.dart';

class CategoryPage extends StatelessWidget {
  final List<String> categories = [
    '생활용품 구입',
    '건강식단 주문',
    '의료용품 대여',
    '근처 가까운 병원 정보',
    '힐링 영상',
    '간편한 사용법 안내',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD9DDE7),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF182233)),
          onPressed: () {
            // 뒤로 가기 동작
            Get.offAll(() => MainPage());
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Text(
                '카테고리',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF182233),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 두 열로 나누기
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // 카테고리 클릭 시 동작
                    Get.to(() => ItemListPage(),
                        arguments: {'category': categories[index]});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        // 테두리 추가
                        color: Color(0xFF116ACC), // 테두리 색상
                        width: 0.5, // 테두리 두께
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF116ACC),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFD9DDE7),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  // 첫 화면으로 이동
                  Get.offAll(() => MainPage());
                },
                icon: Icon(Icons.home, color: Color(0xFF182233)),
                label: Text(
                  '첫 화면',
                  style: TextStyle(color: Color(0xFF182233)),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  // 장바구니로 이동
                  Get.offAll(() => ItemCartPage());
                },
                icon: Icon(Icons.shopping_cart, color: Color(0xFF182233)),
                label: Text('장바구니', style: TextStyle(color: Color(0xFF182233))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
