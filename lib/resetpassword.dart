import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({ Key? key }) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailTextController = TextEditingController();
  final _formRegisterKey = GlobalKey<FormState>();

  String _userEmail = '';

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  Future resetPassword() async {
    final bool? isValid = _formRegisterKey.currentState!.validate();
    if (isValid == false) {
      debugPrint(_userEmail);
    } else {
      const snackBar = SnackBar(
        content: Text(
          'Vui lòng kiểm tra email!',
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
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailTextController.text.trim()).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Độ cao tạo hiệu ứng bóng
        title: const Text(
          "Đổi Mật Khẩu Mới",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formRegisterKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.white)),
                        ),
                        child: TextFormField(
                          controller: _emailTextController,
                          decoration: const InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Vui lòng nhập email của bạn!';
                            }
                            // Check if the entered email has the right format
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Vui lòng nhập email hợp lệ!';
                            }
                            // Return null if the entered email is valid
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                          onChanged: (value) => _userEmail = value,
                        ),
                      ),
                    ],
                  )
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
                      onPressed: resetPassword,
                      child:  const Text("Đổi mật khẩu", style: TextStyle(fontSize: 18),),
                      style: TextButton.styleFrom(primary: Colors.white,),
                    ),
                  ),
                ),
              ],
            ),
        ))),
    );
  }
}