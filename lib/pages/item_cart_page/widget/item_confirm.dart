import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemConfirm extends StatelessWidget {
  final int totalPrice; // Dynamic total price passed from parent

  const ItemConfirm({super.key, required this.totalPrice});

  Widget _buildSummaryRow(String title, String value,
      {Color color = Colors.black,
      double fontSize = 16,
      FontWeight fontWeight = FontWeight.w400}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    int deliveryFee = (totalPrice == 0 ? 0 : 3000); // Fixed delivery fee
    int discount = (totalPrice == 0 ? 0 : 2000); // Fixed discount amount
    final int finalPrice = totalPrice + deliveryFee - discount;

    return Container(
      color: Color(0xFFD9DDE7),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSummaryRow(
              '주문금액', '${NumberFormat('#,###').format(totalPrice)}원'),
          SizedBox(height: 10),
          _buildSummaryRow(
              '배송비', '${NumberFormat('#,###').format(deliveryFee)}원'),
          SizedBox(height: 10),
          _buildSummaryRow('할인금액', '${NumberFormat('#,###').format(discount)}원',
              color: Colors.red),
          Divider(height: 30, thickness: 1, color: Colors.grey[400]),
          _buildSummaryRow(
            '합계금액',
            '${NumberFormat('#,###').format(finalPrice)}원',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ],
      ),
    );
  }
}
