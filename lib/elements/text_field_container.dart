import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final bool hasError;
  const TextFieldContainer({
    Key key,
    this.child,
    this.hasError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          // color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(29),
          border:
              Border.all(color: hasError ? Colors.red : Colors.indigoAccent)),
      child: child,
    );
  }
}
