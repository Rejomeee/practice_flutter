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

// class BackgroundClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // TODO: implement getClip
//     var path = Path();

//     path.lineTo(0, size.height * 0.33);

//     path.quadraticBezierTo(size.width * 0.20, size.height * 0.28,
//         size.width * 0.41, size.height * 0.38);

//     path.quadraticBezierTo(size.width * 0.60, size.height * 0.47,
//         size.width * 0.88, size.height * 0.38);

//     path.quadraticBezierTo(
//         size.width * 0.94, size.height * 0.36, size.width, size.height * 0.38);

//     path.lineTo(size.width, 0);

//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
