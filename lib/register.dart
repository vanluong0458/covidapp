import 'constant.dart';
import 'package:covid_app/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register extends StatefulWidget {
  static const String id = 'register form';

  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPass = false;
  bool _showConfirmPass = false;

  String _userEmail = '';
  String _password = '';
  String _confirmPassword = '';

  void signUp() {
    final bool? isValid = _formKey.currentState!.validate();
    if (isValid == false) {
      debugPrint(_userEmail);
      debugPrint(_password);
      debugPrint(_confirmPassword);
    } else {
      const snackBar = SnackBar(
        content: Text(
          'Đăng ký thành công!',
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
        shape: StadiumBorder(),
        margin: EdgeInsets.symmetric(vertical:16, horizontal: 12),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      );
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                        Form(
                          key: _formKey,
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
                                      return 'Email không hợp lệ!';
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

                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional.centerEnd,
                                  children: [
                                    TextFormField(
                                      controller: _confirmPasswordTextController,
                                      decoration: const InputDecoration(
                                          hintText: "Xác nhận mật khẩu",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                      obscureText: !_showConfirmPass,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Trường này không được để trống!';
                                        }
                                        if (value != _password) {
                                          return 'Mật khẩu nhập lại không đúng!';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) => _confirmPassword = value,
                                    ),
                                    GestureDetector(
                                      onTap: onShowConfirmPass,
                                      child: Icon(
                                        _showConfirmPass ? Icons.remove_red_eye_sharp: Icons.remove_red_eye_outlined
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 40),
                              Container(
                                height: 50,
                                margin: const EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.green[800]
                                ),
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      signUp();
                                    },
                                    child:  const Text("Đăng ký"),
                                    style: TextButton.styleFrom(primary: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              Container(
                                height: 50,
                                margin: const EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.green[800]
                                ),
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                                    },
                                    child:  const Text("Đăng nhập"),
                                    style: TextButton.styleFrom(primary: Colors.white),
                                  ),
                                ),
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

  void onShowConfirmPass() {
    setState(() {
      _showConfirmPass = !_showConfirmPass;
    });
  }
}