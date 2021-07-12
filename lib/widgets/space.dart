import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double size;
  Space(this.size);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size, width: size,);
  }
}
