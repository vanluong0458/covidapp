import 'package:covid_app/constant.dart';
import 'package:covid_app/pages/vaccinations/vaccination.dart';
import 'package:covid_app/widgets/fire_base_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddInfoFamily extends StatefulWidget {
  const AddInfoFamily({ Key? key }) : super(key: key);

  @override
  State<AddInfoFamily> createState() => _AddInfoFamilyState();
}

class _AddInfoFamilyState extends State<AddInfoFamily> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _birthdayTextController = TextEditingController();
  TextEditingController _cccdTextController = TextEditingController();
  TextEditingController _typevaccinTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _numberTextController = TextEditingController();
  final _formVaccinationKey = GlobalKey<FormState>();
  String _birthday = '';
  String _userName = '';
  String _cccd = '';
  String _typevaccin = '';
  String _phone = '';
  String _number = '';

  final _vaccin = Vaccin();

  Future _createFamilyVaccin() async {
    final bool? isValid = _formVaccinationKey.currentState!.validate();
    if (isValid == false) {
      debugPrint(_birthday);
      debugPrint(_userName);
      debugPrint(_cccd);
      debugPrint(_typevaccin);
      debugPrint(_phone);
      debugPrint(_number);
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
      await _vaccin.createFamilyVaccin(_userNameTextController.text.trim(), _birthdayTextController.text.trim(), _phoneTextController.text.trim(), _cccdTextController.text.trim(), _numberTextController.text.trim(), _typevaccinTextController.text.trim()).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Vaccination(),));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _userNameTextController = TextEditingController();
    _birthdayTextController = TextEditingController();
    _cccdTextController = TextEditingController();
    _typevaccinTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _numberTextController = TextEditingController();
  }

  @override
  void dispose() {
    _userNameTextController.dispose();
    _birthdayTextController.dispose();
    _cccdTextController.dispose();
    _typevaccinTextController.dispose();
    _phoneTextController.dispose();
    _numberTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Khai báo tiêm chủng",
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
                          controller: _numberTextController,
                          decoration: const InputDecoration(
                              hintText: "Số mũi đã tiêm",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Trường này không được để trống!';
                            }
                            return null;
                          },
                          onChanged: (value) => _number = value,
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
                          controller: _typevaccinTextController,
                          decoration: const InputDecoration(
                              hintText: "Đã được tiêm vắc xin Covid-19",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Trường này không được để trống!';
                            }
                            if (value.trim().length < 6) {
                              return 'Trường này phải có ít nhất 6 ký tự!';
                            }
                            return null;
                          },
                          onChanged: (value) => _typevaccin = value,
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
                        _createFamilyVaccin();
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