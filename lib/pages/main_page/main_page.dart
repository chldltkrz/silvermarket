import 'package:flutter/material.dart';
import 'package:silvermarket/pages/category_page/categogry_page.dart';
import 'package:silvermarket/pages/main_page/widget/phone_number_input.dart';
import 'package:silvermarket/pages/main_page/widget/enter_button.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: Column(
        children: [
          Expanded(
            flex: 1, // 화면의 절반을 차지하도록 설정
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // 그림자 위치
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // 위쪽부터 정렬
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 8),
                  // 큰 텍스트
                  Text(
                    'SILVER MARKET',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      // letterSpacing: 3.0,  글자 간격 설정
                      // fontFamily: 'Roboto', 폰트 종류 변경
                    ),
                  ),

                  SizedBox(height: 2),

                  Text(
                    '쾌적한 시니어 라이프를 위한 모든 것',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 35),

                  Text(
                    '전화번호/카카오톡/네이버 아이디로\n간편하게 회원가입하세요',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20),

                  // 전화번호 입력 버튼 (별도 파일에서 가져옴)
                  PhoneNumberInput(),

                  SizedBox(height: 20),

                  // 가입하기 버튼 (별도 파일에서 가져옴)
                  EnterButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoryPage(),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
