import 'package:flutter/material.dart';

class EnterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const EnterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      borderRadius: BorderRadius.circular(30),
      elevation: 5, // ElevatedButton과 유사한 그림자 효과
      child: InkWell(
        borderRadius: BorderRadius.circular(20), // 눌림 효과 반경
        onTap: onPressed,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(
            '가입하기',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
