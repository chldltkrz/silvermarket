import 'package:flutter/material.dart';

class ItemConfirm extends StatelessWidget {
  const ItemConfirm({super.key});
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
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSummaryRow('주문금액', '53,000원'),
          SizedBox(height: 10),
          _buildSummaryRow('배송비', '3,000원'),
          SizedBox(height: 10),
          _buildSummaryRow('할인금액', '2,000원', color: Colors.red),
          Divider(height: 30, thickness: 1, color: Colors.grey[400]),
          _buildSummaryRow(
            '합계금액',
            '54,000원',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ],
      ),
    );
  }
}
