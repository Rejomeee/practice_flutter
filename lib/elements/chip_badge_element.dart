import 'package:flutter/material.dart';

class ChipBadgeWidget extends StatelessWidget {
  final IconData icon;
  final String someText;
  const ChipBadgeWidget({
    Key key,
    this.icon,
    this.someText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        constraints: BoxConstraints(
          minWidth: 50.0,
          minHeight: 30.0,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.transparent,
            border:
                Border.all(color: Colors.purpleAccent[100].withOpacity(0.4))),
        child: icon != null
            ? Icon(
                icon,
                color: Colors.purpleAccent[100].withOpacity(0.3),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  someText,
                  style: TextStyle(
                      color: Colors.purpleAccent[100].withOpacity(0.3)),
                ),
              ),
      ),
    );
  }
}
