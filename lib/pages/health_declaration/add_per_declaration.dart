import 'package:covid_app/constant.dart';
import 'package:covid_app/widgets/fire_base_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPerDeclaration extends StatefulWidget {
  const AddPerDeclaration({ Key? key }) : super(key: key);

  @override
  State<AddPerDeclaration> createState() => _AddPerDeclarationState();
}

class _AddPerDeclarationState extends State<AddPerDeclaration> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _dateDeclarationTextController = TextEditingController();
  TextEditingController _jobTextController = TextEditingController();
  TextEditingController _genderTextController = TextEditingController();
  TextEditingController _dateF0TextController = TextEditingController();
  TextEditingController _addressTextController = TextEditingController();
  TextEditingController _f0TextController = TextEditingController();
  TextEditingController _birthdayTextController = TextEditingController();
  TextEditingController _cccdTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  final _formVaccinationKey = GlobalKey<FormState>();
  String _birthday = '';
  String _userName = '';
  String _cccd = '';
  String _dateDeclaration = '';
  String _phone = '';
  String _job = '';
  String _gender = '';
  String _address = '';
  String _f0 = '';
  String _dateF0 = '';

  final _declaration = Declaration();

  void _createUserDeclaration() {
    final bool? isValid = _formVaccinationKey.currentState!.validate();
    if (isValid == false) {
      debugPrint(_birthday);
      debugPrint(_userName);
      debugPrint(_cccd);
      debugPrint(_f0);
      debugPrint(_phone);
      debugPrint(_address);
      debugPrint(_dateF0);
      debugPrint(_job);
      debugPrint(_dateDeclaration);
      debugPrint(_gender);
    } else {
      const snackBar = SnackBar(
        content: Text(
          'Khai báo thành công!',
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
      _declaration.createUserDeclaration(_userNameTextController.text, _birthdayTextController.text, _phoneTextController.text, _cccdTextController.text, _genderTextController.text, _jobTextController.text, _addressTextController.text, _dateDeclarationTextController.text, _f0TextController.text, _dateF0TextController.text);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    _userNameTextController = TextEditingController();
    _birthdayTextController = TextEditingController();
    _cccdTextController = TextEditingController();
    _dateDeclarationTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _jobTextController = TextEditingController();
    _genderTextController = TextEditingController();
    _dateF0TextController = TextEditingController();
    _addressTextController = TextEditingController();
    _f0TextController = TextEditingController();
  }

  @override
  void dispose() {
    _userNameTextController.dispose();
    _birthdayTextController.dispose();
    _cccdTextController.dispose();
    _dateDeclarationTextController.dispose();
    _phoneTextController.dispose();
    _jobTextController.dispose();
    _genderTextController.dispose();
    _dateF0TextController.dispose();
    _addressTextController.dispose();
    _f0TextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Khai báo F0",
        ),
        backgroundColor: Colors.green,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        centerTitle: true,
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
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Column(
              children: <Widget>[
                Form(
                  key: _formVaccinationKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey.shade200),
                            right: BorderSide(color: Colors.grey.shade200),
                            bottom: BorderSide(color: Colors.grey.shade200),
                            left: BorderSide(color: Colors.grey.shade200),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: TextFormField(
                          controller: _userNameTextController,
                          decoration: const InputDecoration(
                              hintText: "Họ và tên",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Trường này không được để trống!';
                            }
                            if (value.trim().length < 8) {
                              return 'Họ và tên phải ít nhất 8 ký tự!';
                            }
                            return null;
                          },
                          onChanged: (value) => _userName = value,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey.shade200),
                            right: BorderSide(color: Colors.grey.shade200),
                            bottom: BorderSide(color: Colors.grey.shade200),
                            left: BorderSide(color: Colors.grey.shade200),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: TextFormField(
                          controller: _birthdayTextController,
                          decoration: const InputDecoration(
                              hintText: "Sinh ngày (VD: 01/01/2000)",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Trường này không được để trống!';
                            }
                            if (value.trim().length != 10) {
                              return 'Trường này phải có ít nhất 10 ký tự!';
                            }
                            return null;
                          },
                          onChanged: (value) => _birthday = value,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey.shade200),
                            right: BorderSide(color: Colors.grey.shade200),
                            bottom: BorderSide(color: Colors.grey.shade200),
                            left: BorderSide(color: Colors.grey.shade200),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: TextFormField(
                          controller: _phoneTextController,
                          decoration: const InputDecoration(
                              hintText: "Số điện thoại",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Trường này không được để trống!';
                            }
                            if (value.trim().length != 10) {
                              return 'Số điện thoại phải có 10 chữ số!';
                            }
                            if (!regExp.hasMatch(value)) {
                              return 'Số điện thoại không hợp lệ!';
                            }
                            return null;
                          },
                          onChanged: (value) => _phone = value,
                        ),
                      ),
                      const SizedBox(height: 10),
                      
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey.shade200),
                            right: BorderSide(color: Colors.grey.shade200),
                            bottom: BorderSide(color: Colors.grey.shade200),
                            left: BorderSide(color: Colors.grey.shade200),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: TextFormField(
                          controller: _cccdTextController,
                          decoration: const InputDecoration(
                              hintText: "Số CCCD",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Trường này không được để trống!';
                            }
                            if (value.trim().length != 12) {
                              return 'Trường này phải có 12 chữ số!';
                            }
                            return null;
                          },
                          onChanged: (value) => _cccd = value,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey.shade200),
                            right: BorderSide(color: Colors.grey.shade200),
                            bottom: BorderSide(color: Colors.grey.shade200),
                            left: BorderSide(color: Colors.grey.shade200),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: TextFormField(
                          controller: _genderTextController,
                          decoration: const InputDecoration(
                              hintText: "Giới tính",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Trường này không được để trống!';
                            }
                            return null;
                          },
                          onChanged: (value) => _gender = value,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey.shade200),
                            right: BorderSide(color: Colors.grey.shade200),
                            bottom: BorderSide(color: Colors.grey.shade200),
                            left: BorderSide(color: Colors.grey.shade200),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: TextFormField(
                          controller: _jobTextController,
                          decoration: const InputDecoration(
                              hintText: "Nghề nghiệp",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Trường này không được để trống!';
                            }
                            return null;
                          },
                          onChanged: (value) => _job = value,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey.shade200),
                            right: BorderSide(color: Colors.grey.shade200),
                            bottom: BorderSide(color: Colors.grey.shade200),
                            left: BorderSide(color: Colors.grey.shade200),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: TextFormField(
                          controller: _addressTextController,
                          decoration: const InputDecoration(
                              hintText: "Địa chỉ",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Trường này không được để trống!';
                            }
                            return null;
                          },
                          onChanged: (value) => _address = value,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey.shade200),
                            right: BorderSide(color: Colors.grey.shade200),
                            bottom: BorderSide(color: Colors.grey.shade200),
                            left: BorderSide(color: Colors.grey.shade200),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: TextFormField(
                          controller: _dateDeclarationTextController,
                          decoration: const InputDecoration(
                              hintText: "Ngày khai báo",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Trường này không được để trống!';
                            }
                            if (value.trim().length != 10) {
                              return 'Trường này phải có ít nhất 10 ký tự!';
                            }
                            return null;
                          },
                          onChanged: (value) => _dateDeclaration = value,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey.shade200),
                            right: BorderSide(color: Colors.grey.shade200),
                            bottom: BorderSide(color: Colors.grey.shade200),
                            left: BorderSide(color: Colors.grey.shade200),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: TextFormField(
                          controller: _f0TextController,
                          decoration: const InputDecoration(
                              hintText: 'Đã từng bị F0 trước đây chưa (Điền "CÓ" hoặc "CHƯA")',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Trường này không được để trống!';
                            }
                            return null;
                          },
                          onChanged: (value) => _f0 = value,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey.shade200),
                            right: BorderSide(color: Colors.grey.shade200),
                            bottom: BorderSide(color: Colors.grey.shade200),
                            left: BorderSide(color: Colors.grey.shade200),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: TextFormField(
                          controller: _dateF0TextController,
                          decoration: const InputDecoration(
                              hintText: "Ngày bị F0",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Trường này không được để trống!';
                            }
                            if (value.trim().length != 10) {
                              return 'Trường này phải có ít nhất 10 ký tự!';
                            }
                            return null;
                          },
                          onChanged: (value) => _dateF0 = value,
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
                      onPressed: () {
                        _createUserDeclaration();
                      },
                      child:  const Text("Xác nhận", style: TextStyle(fontSize: 18),),
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