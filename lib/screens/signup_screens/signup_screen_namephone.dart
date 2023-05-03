import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mixin_mac/screens/signup_screens/signup_screen_school.dart';

import '../../components/custom_textformfield.dart';
import '../../components/number_formatter.dart';
import '../../const/colors.dart';
import '../../layout/text_layout.dart';

class SignUpScreenNamePhone extends StatefulWidget {
  final bool isAdIfmChecked;
  SignUpScreenNamePhone(this.isAdIfmChecked, {Key? key}) : super(key: key);

  @override
  State<SignUpScreenNamePhone> createState() => _SignUpScreenNamePhoneState();
}

class _SignUpScreenNamePhoneState extends State<SignUpScreenNamePhone> {

  final String serverUrl = 'http://122.37.227.143:8080/login';

  final _userNameTextEditController = TextEditingController();
  final _userPhoneNumberTextController = TextEditingController();
  final _userCertificationNumberController = TextEditingController();
  List<bool> isSelected = [false, false];
  List<String> genderList = ['여자', '남자'];
  String userGender = '';

  bool onClickSendButton = false;
  String sendText = '인증번호 전송';
  String sendAgainText = '인증번호 재전송';

  String userName = '';
  String userPhoneNumber = '';
  String userCertificationNumber = '';

  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 3);

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void getGender(){
    if(genderList[0] == true){
      userGender == '여자';
    } else if(genderList[1] == true){
      userGender == '남자';
    }
    print('userGender : $userGender');
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  int? newsAgency;
  String selectAgency = '통신사';
  String kt = 'KT';
  String skt = 'SKT';
  String lg = 'LG';
  String addp = '알뜰폰';

  void changeAgency() {
    if (newsAgency == 0) {
      selectAgency = kt;
    }
    if (newsAgency == 1) {
      selectAgency = skt;
    }
    if (newsAgency == 2) {
      selectAgency = lg;
    }
    if (newsAgency == 3) {
      selectAgency = addp;
    }
  }

  List<Widget> items = [
    const Text(
      'KT',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0),
    ),
    const Text(
      'SKT',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0),
    ),
    const Text(
      'LG',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0),
    ),
    const Text(
      '알뜰폰',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0),
    ),
  ];

  @override
  void dispose() {
    _userNameTextEditController.dispose();
    _userPhoneNumberTextController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        leading: GestureDetector(
          child: Image.asset('assets/images/back_icon.png'),
          onTap: () {
            Navigator.pop(context);
            print("widget.isAdIfmChecked: ${widget.isAdIfmChecked}");
          },
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 29),
              const HeadlineText(text: '이름과 전화번호로\n본인인증을 해주세요',),
              const SizedBox(height: 50.0),
              const InfoText(text: '이름'),
              const SizedBox(height: 12.0),
              CustomTextFormField(
                controller: _userNameTextEditController,
                hintText: '이름을 작성해주세요',
                onChanged: (String value) {
                  userName = value;
                },
              ),
              const SizedBox(height: 24.0),
              const InfoText(text: '성별'),
              const SizedBox(height: 12.0),
              Ink(
                width: 342,
                height: 56,
                color: Colors.white,
                child: GridView.count(
                  primary: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  childAspectRatio: 342 / 112,
                  children: List.generate(
                    isSelected.length,
                    (index) {
                      //using Inkwell widget to create a button
                      return InkWell(
                        // splashColor: MIXIN_POINT_COLOR,
                        //the default splashColor is grey
                        onTap: () {
                          //set the toggle logic
                          setState(() {
                            for (int indexBtn = 0;
                                indexBtn < isSelected.length;
                                indexBtn++) {
                              if (indexBtn == index) {
                                isSelected[indexBtn] = true;
                              } else {
                                isSelected[indexBtn] = false;
                              }
                            }
                            print('userGender : $userGender');
                            print(isSelected);
                          });
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            color: isSelected[index] ? MIXIN_ : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: isSelected[index]
                                ? Border.all(color: MIXIN_CLICK)
                                : Border.all(color: MIXIN_BLACK_5),
                          ),
                          child: Center(
                            child: Text(
                              genderList[index],
                              style: TextStyle(
                                color:
                                    isSelected[index] ? MIXIN_2 : MIXIN_BLACK_4,
                                fontFamily: 'SUIT',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              const InfoText(text: '전화번호'),
              const SizedBox(height: 12.0,),
              Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 113,
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              color: MIXIN_BLACK_5,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            elevation: 0.0,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 370,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 280,
                                        width: double.infinity,
                                        color: Colors.white,
                                        child: Center(
                                          child: ListWheelScrollView(
                                            itemExtent: 75,
                                            children: items,
                                            physics: FixedExtentScrollPhysics(),
                                            onSelectedItemChanged: (index) => {
                                              newsAgency = index,
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: MIXIN_POINT_COLOR,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0)),
                                              elevation: 8.0,
                                            ),
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              changeAgency();
                                              setState(() {});
                                              print(newsAgency);
                                            },
                                            child: const SizedBox(
                                              width: 342,
                                              height: 56,
                                              child: Center(
                                                child: Text(
                                                  '확인',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontFamily: 'SUIT',
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                '$selectAgency',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'SUIT',
                                    fontSize: 16.0,
                                    color: selectAgency == '통신사'
                                        ? MIXIN_BLACK_4
                                        : MIXIN_BLACK_1),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              const Icon(
                                Icons.arrow_drop_down_rounded,
                                color: MIXIN_BLACK_4,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      SizedBox(
                        width: 217,
                        height: 56,
                        child: TextFormField(
                          scrollPadding: EdgeInsets.all(0.0),
                          controller: _userPhoneNumberTextController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            NumberFormatter(),
                            LengthLimitingTextInputFormatter(13),
                          ],
                          cursorColor: Colors.grey,
                          obscureText: false,
                          autofocus: false,
                          onChanged: (String value) {
                            userPhoneNumber = value;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            hintText: '010-0000-0000',
                            hintStyle: const TextStyle(
                              color: MIXIN_BLACK_4,
                              fontSize: 16.0,
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w500,
                            ),
                            fillColor: Colors.grey,
                            filled: false,
                            // 모든 Input 상태의 기본 스타일 세팅
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                    color: MIXIN_BLACK_5, width: 1.5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                    color: MIXIN_BLACK_5, width: 1.5)),
                            // focus 일 때 세팅
                            focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                        color: MIXIN_BLACK_5, width: 1.5))
                                .copyWith(
                                    borderSide: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 1.5))
                                        .borderSide
                                    // .copyWith(color: Colors.red)),
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 216,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: MIXIN_BLACK_5,
                        width: 1.5,
                      ),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          width: 140,
                          height: 56,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            scrollPadding: EdgeInsets.all(0.0),
                            controller: _userCertificationNumberController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(6),
                            ],
                            cursorColor: Colors.grey,
                            obscureText: false,
                            autofocus: false,
                            onChanged: (String value) {
                              userCertificationNumber = value;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20),
                              hintText: '인증번호 입력',
                              hintStyle: const TextStyle(
                                color: MIXIN_BLACK_4,
                                fontSize: 16.0,
                                fontFamily: 'SUIT',
                                fontWeight: FontWeight.w500,
                              ),
                              fillColor: Colors.grey,
                              filled: false,
                              // 모든 Input 상태의 기본 스타일 세팅
                              border: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              // focus 일 때 세팅
                              focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent))
                                  .copyWith(
                                      borderSide: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.5))
                                          .borderSide
                                      // .copyWith(color: Colors.red)),
                                      ),
                            ),
                          ),
                        ),
                        Text('$minutes:$seconds'),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                    width: 110,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: MIXIN_POINT_COLOR,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          elevation: 0.0),
                      onPressed: () async {
                        setState(() {
                          onClickSendButton = true;
                        });
                        startTimer();
                        // Dio dio = Dio();
                        // final Response resp = await dio.post(serverUrl, data: {
                        //   "userEmail" : "adadaddda",
                        //   "userPassword" : "1234"
                        // });
                        // final Response resp1 = await dio.get(serverUrl);
                        // print(resp1);
                        // "userEmail": _userNameTextEditController.text,
                        // "userPassword": _userPhoneNumberTextController.text,
                        // "userName": "주현우",
                        // print(resp);
                        print(_userPhoneNumberTextController.text);
                        print(_userNameTextEditController.text);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          onClickSendButton == false ? sendText : sendAgainText,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100,),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: MIXIN_POINT_COLOR,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      elevation: 0.0),
                  onPressed: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreenSchool()),
                    );
                  },
                  child: const SizedBox(
                    width: 342,
                    height: 56,
                    child: Center(
                      child: Text(
                        '다음',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'SUIT',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
