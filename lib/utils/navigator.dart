import 'package:flutter/material.dart';

push(context, widget) => Navigator.of(context).push(MaterialPageRoute(builder: (c) => widget));
pop(context) => Navigator.of(context).pop();