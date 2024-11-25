import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      "상품 이름",
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () => {},
                      child: Text("선택"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "간략한 설명",
                      style: TextStyle(fontSize: 13),
                    ),
                    Spacer(),
                    Text(
                      "16,000원",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
