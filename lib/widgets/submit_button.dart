import 'package:flutter/material.dart';


class SubmitButton extends StatelessWidget {
  final String label;
  final action;
  SubmitButton(this.label, this.action);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: FlatButton(
        onPressed: action,
        padding: const EdgeInsets.all(12),
        child: Text(
          label,
          style: theme.textTheme.headline6!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)),
        color: theme.accentColor,
      ),
    );
  }
}
