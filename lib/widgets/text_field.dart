import 'package:flutter/material.dart';
import 'package:smart_tech_task/widgets/space.dart';

class SmartTextField extends StatelessWidget {
  final TextEditingController controller;
  final String lable;
  final bool secure;
  final validator, onSubmitted;
  final FocusNode? node;

  SmartTextField(this.controller, this.lable,  {this.validator, this.onSubmitted, this.secure = false, this.node});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Space(8),
        Text(lable, style: TextStyle(color: theme.accentColor.withOpacity(0.5), fontSize: 10),),
        Container(
          //height: 50,
          margin: EdgeInsets.only(top: 4, bottom: 8),
          decoration: BoxDecoration(
            color: theme.backgroundColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:const EdgeInsets.all(10),
                width: 32, height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.accentColor
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 3, height: 32,
                decoration: BoxDecoration(
                    color: theme.canvasColor
                ),
              ),
              Space(10),
              Expanded(
                child: TextFormField(
                  focusNode: node,
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  obscureText: secure,
                  validator: validator,
                  onFieldSubmitted: onSubmitted,
                ),
              ),
              Space(10),
            ],
          ),
        ),
      ],
    );
  }
}
