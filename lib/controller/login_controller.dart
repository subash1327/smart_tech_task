import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_tech_task/utils/navigator.dart';
import 'package:smart_tech_task/widgets/waiting_dialog.dart';

class LoginController{
  final BuildContext context;
  LoginController(this.context);

  TextEditingController email = TextEditingController(), password = TextEditingController();
  GlobalKey<FormState> form = GlobalKey();

  FocusNode emailFocus = FocusNode(), passwordFocus = FocusNode();

  login() async {
    if(form.currentState!.validate()){
      passwordFocus.unfocus();
      emailFocus.unfocus();



      showWaitingDialog(context);

      await Future.delayed(Duration(seconds: 3));

      pop(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logged In')));

    }
  }

  onEmailSubmit(String? value){
    passwordFocus.requestFocus();
  }

  onPasswordSubmit(String? value){
    login();
    passwordFocus.unfocus();
  }

  String? emailValidator(String? value){
    if(value!.isEmpty)
      return 'Please enter Email';
    final isValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    if(!isValid)
      return 'Invalid Email';
  }

  String? passwordValidator(String? value){
    if(value!.isEmpty)
      return 'Please enter Password';
    if(value.length < 8)
      return 'Password too short';
  }


}