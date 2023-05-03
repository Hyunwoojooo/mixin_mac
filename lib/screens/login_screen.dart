import 'package:flutter/material.dart';
import 'package:mixin_mac/screens/signup_screens/signup_screen_tos.dart';

import '../components/custom_textformfield.dart';
import '../components/default_layout.dart';
import '../const/colors.dart';
import 'make_profile_card_screens/make_category_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String serverUrl = 'http://122.37.227.143:8000/http/post';

  final _idTextEditController = TextEditingController();
  final _passwordTextController = TextEditingController();

  String username = '';
  String password = '';

  @override
  void dispose() {
    _idTextEditController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 162,
                ),
                Image.asset('assets/images/mixin_logo.png'),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  'Everyone\'s playground',
                  style: TextStyle(
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: MIXIN_POINT_COLOR),
                ),
                const SizedBox(
                  height: 67,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomTextFormField(
                    hintText: '아이디',
                    onChanged: (String value) {
                      username = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomTextFormField(
                    hintText: '비밀번호',
                    onChanged: (String value) {
                      password = value;
                    },
                    obscrueText: true,
                  ),
                ),
                const SizedBox(
                  height: 107.0,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: MIXIN_POINT_COLOR,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        elevation: 0.0
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const MakeCategoryScreen()),
                      );
                    },
                    child: const SizedBox(
                      width: 260,
                      height: 56,
                      child: Center(
                        child: Text(
                          '로그인',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0.0),
                      ),
                      onPressed: () {},
                      child: const Text(
                        '아이디 찾기',
                        style: TextStyle(
                            color: MIXIN_BLACK_4,
                            fontSize: 12,
                            fontFamily: 'SUIT',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const VerticalDivider(
                      width: 12,
                      thickness: 7.0,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0.0),
                      ),
                      onPressed: () {},
                      child: const Text(
                        '비밀번호 찾기',
                        style: TextStyle(
                            color: MIXIN_BLACK_4,
                            fontSize: 12,
                            fontFamily: 'SUIT',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const VerticalDivider(
                      width: 12,
                      thickness: 7.0,
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const SignUpScreen1()),
                        );
                      },
                      child: const Text(
                        '회원가입',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: MIXIN_POINT_COLOR,
                          fontSize: 14,
                          fontFamily: 'SUIT',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
