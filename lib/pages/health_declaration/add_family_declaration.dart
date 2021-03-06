import 'package:covid_app/constant.dart';
import 'package:covid_app/pages/health_declaration/health_declaration.dart';
import 'package:covid_app/widgets/fire_base_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddFamilyDeclaration extends StatefulWidget {
  const AddFamilyDeclaration({ Key? key }) : super(key: key);

  @override
  State<AddFamilyDeclaration> createState() => _AddFamilyDeclarationState();
}

class _AddFamilyDeclarationState extends State<AddFamilyDeclaration> {
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

  Future _createFamilyDeclaration() async {
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
          'Khai b??o th??nh c??ng!',
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
      await _declaration.createFamilyDeclaration(_userNameTextController.text.trim(), _birthdayTextController.text.trim(), _phoneTextController.text.trim(), _cccdTextController.text.trim(), _genderTextController.text.trim(), _jobTextController.text.trim(), _addressTextController.text.trim(), _dateDeclarationTextController.text.trim(), _f0TextController.text.trim(), _dateF0TextController.text.trim()).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HealthDeclaration(),));
      });
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
          "Khai b??o F0",
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
                              hintText: "H??? v?? t??n",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Tr?????ng n??y kh??ng ???????c ????? tr???ng!';
                            }
                            if (value.trim().length < 8) {
                              return 'H??? v?? t??n ph???i ??t nh???t 8 k?? t???!';
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
                              hintText: "Sinh ng??y (VD: 01/01/2000)",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Tr?????ng n??y kh??ng ???????c ????? tr???ng!';
                            }
                            if (value.trim().length != 10) {
                              return 'Tr?????ng n??y ph???i c?? ??t nh???t 10 k?? t???!';
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
                              hintText: "S??? ??i???n tho???i",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Tr?????ng n??y kh??ng ???????c ????? tr???ng!';
                            }
                            if (value.trim().length != 10) {
                              return 'S??? ??i???n tho???i ph???i c?? 10 ch??? s???!';
                            }
                            if (!regExp.hasMatch(value)) {
                              return 'S??? ??i???n tho???i kh??ng h???p l???!';
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
                              hintText: "S??? CCCD",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Tr?????ng n??y kh??ng ???????c ????? tr???ng!';
                            }
                            if (value.trim().length != 12) {
                              return 'Tr?????ng n??y ph???i c?? 12 ch??? s???!';
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
                              hintText: "Gi???i t??nh",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Tr?????ng n??y kh??ng ???????c ????? tr???ng!';
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
                              hintText: "Ngh??? nghi???p",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Tr?????ng n??y kh??ng ???????c ????? tr???ng!';
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
                              hintText: "?????a ch???",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Tr?????ng n??y kh??ng ???????c ????? tr???ng!';
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
                              hintText: "Ng??y khai b??o",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Tr?????ng n??y kh??ng ???????c ????? tr???ng!';
                            }
                            if (value.trim().length != 10) {
                              return 'Tr?????ng n??y ph???i c?? ??t nh???t 10 k?? t???!';
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
                              hintText: '???? t???ng b??? F0 tr?????c ????y ch??a (??i???n "C??" ho???c "CH??A")',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Tr?????ng n??y kh??ng ???????c ????? tr???ng!';
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
                              hintText: "Ng??y b??? F0",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Tr?????ng n??y kh??ng ???????c ????? tr???ng!';
                            }
                            if (value.trim().length != 10) {
                              return 'Tr?????ng n??y ph???i c?? ??t nh???t 10 k?? t???!';
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
                        _createFamilyDeclaration();
                      },
                      child:  const Text("X??c nh???n", style: TextStyle(fontSize: 18),),
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