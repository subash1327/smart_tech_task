import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_tech_task/controller/login_controller.dart';
import 'package:smart_tech_task/widgets/space.dart';
import 'package:smart_tech_task/widgets/submit_button.dart';
import 'package:smart_tech_task/widgets/text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController? controller;

  double screenWidth = 0.0;
  double screenHeight = 0.0;

  @override
  void initState() {
    controller = LoginController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final theme = Theme.of(context);

    final softInput = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(color: theme.backgroundColor.withOpacity(0.8),),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(screenWidth * 0.1),
                  width: screenWidth * 0.25,
                  height: screenWidth * 0.25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: theme.primaryColor),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                        color: theme.canvasColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Form(
                      key: controller?.form,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Space(20),
                            Text(
                              'Welcome Back',
                              style: theme.textTheme.headline5!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Space(8),
                            Text(
                              'Sign in to continue',
                              style: theme.textTheme.caption,
                            ),
                            Space(screenHeight * 0.05),
                            //Spacer(),
                            SmartTextField(controller!.email, 'EMAIL',
                              validator: controller?.emailValidator,
                              node: controller?.emailFocus,
                              onSubmitted: controller?.onEmailSubmit,
                            ),
                            Space(8),
                            SmartTextField(
                              controller!.password, 'PASSWORD', secure: true,
                              validator: controller?.passwordValidator,
                              node: controller?.passwordFocus,
                              onSubmitted: controller?.onPasswordSubmit,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: CupertinoButton(
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: theme.accentColor,
                                    fontSize: 14
                                  ),
                                ),
                                onPressed: () {},
                                padding: EdgeInsets.all(0),
                              ),
                            ),
                            Space(16),
                            SubmitButton('Login', controller?.login),
                            Space(screenWidth * 0.1)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          if(!softInput)Align(
            alignment: Alignment.bottomLeft,
            child: circle(screenWidth * 0.7,
                Offset(-screenWidth * 0.3, screenWidth * 0.3)),
          ),
          if(!softInput)Align(
            alignment: Alignment.bottomRight,
            child: circle(screenWidth * 0.7,
                Offset(screenWidth * 0.3, screenWidth * 0.3)),
          ),
          if(!softInput)Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addButton(),
                      Space(8),
                      Text(
                        'Join\nFamily',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.4),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      addButton(),
                      Space(8),
                      Text(
                        'Create\nAccount',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.4),
                        textAlign: TextAlign.end,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget addButton() {
    return RawMaterialButton(
        elevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        onPressed: () {},
        child: Icon(
          Icons.add_rounded,
          size: 40,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        fillColor: Theme
            .of(context)
            .accentColor,
        constraints: BoxConstraints(minHeight: 50, minWidth: 50));
  }

  Widget circle(double diameter, Offset offset) {
    return Transform.translate(
      offset: offset,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
            color: Theme
                .of(context)
                .backgroundColor
                .withOpacity(0.2),
            shape: BoxShape.circle),
      ),
    );
  }
}
