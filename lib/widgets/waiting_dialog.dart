import 'package:flutter/material.dart';

showWaitingDialog(BuildContext context) {
  showDialog(context: context, builder: (c){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height - 150),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          //Text('Please Wait')
        ],
      ),
    );
  }, barrierDismissible: false,);
}