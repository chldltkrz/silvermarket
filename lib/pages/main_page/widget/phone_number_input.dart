import 'package:flutter/material.dart';

class PhoneNumberInput extends StatelessWidget {
  const PhoneNumberInput({super.key}); // const 생성자 추가

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF182233),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16), // 내부 여백 추가
        child: Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.phone, // 숫자 키패드 표시
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: '전화번호를 입력하세요',
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  border: InputBorder.none, // 기본 테두리 제거
                ),
              ),
            ),
            const Icon(
              Icons.phone, // 전화 아이콘 추가 (선택 사항)
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
