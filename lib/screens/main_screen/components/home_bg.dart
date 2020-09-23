import 'package:flutter/material.dart';

class HomeBg extends StatelessWidget {
  final Widget child;
  final double height;
  const HomeBg({
    Key key,
    @required this.child,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Color(0xFF212121),
      width: double.infinity,
      child: child,
    );
  }
}
