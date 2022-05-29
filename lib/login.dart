import 'package:covid_app/pages/introduction.dart';
import 'package:covid_app/resetpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constant.dart';
import 'register.dart';

class Login extends StatefulWidget {
  static const String id = 'login form';

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final _formRegisterKey = GlobalKey<FormState>();
  bool _showPass = false;

  String _userEmail = '';
  String _password = '';

  void _trySubmitLoginForm() {
    final bool? isValid = _formRegisterKey.currentState!.validate();
    if (isValid == false) {
      debugPrint(_userEmail);
      debugPrint(_password);
    } else {
      FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Introduction()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.green.shade900,
                  Colors.green.shade500,
                  Colors.green.shade400,
                ]
            )
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 40, top: 20, right: 20),
              height: 170,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/virus.png"))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/new-normality.svg",
                          width: 130,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                        Positioned(
                          top: 20,
                          left: 150,
                          child: Text(
                            'Chào mừng\nđến với RCOVI',
                            style: kHeadingTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(),
                      ],
                    )
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 20),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Form(
                          key: _formRegisterKey,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                ),
                                child: TextFormField(
                                  controller: _emailTextController,
                                  decoration: const InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Vui lòng nhập email của bạn!';
                                    }
                                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                      return 'Vui lòng nhập email hợp lệ!';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => _userEmail = value,
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional.centerEnd,
                                  children: [
                                    TextFormField(
                                      controller: _passwordTextController,
                                      decoration: const InputDecoration(
                                          hintText: "Mật khẩu",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                      obscureText: !_showPass,
                                      validator: (value) {
                                        if (value == null || value.trim().isEmpty) {
                                          return 'Trường này không được để trống!';
                                        }
                                        if (value.trim().length < 8) {
                                          return 'Mật khẩu phải ít nhất 8 ký tự!';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) => _password = value,
                                    ),
                                    GestureDetector(
                                      onTap: onShowPass,
                                      child: Icon(
                                        _showPass ? Icons.remove_red_eye_sharp: Icons.remove_red_eye_outlined
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),

                              Container(
                                height: 50,
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.green[800]
                                ),
                                child: Center(
                                  child: TextButton(
                                    onPressed: _trySubmitLoginForm,
                                    child:  const Text("Đăng nhập"),
                                    style: TextButton.styleFrom(primary: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              Container(
                                height: 50,
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.green[800]
                                ),
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                                    },
                                    child:  const Text("Đăng ký"),
                                    style: TextButton.styleFrom(primary: Colors.white,),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPassword())),
                                child: const Text("Quên mật khẩu?")
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void onShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}