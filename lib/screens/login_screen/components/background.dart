import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery.of(context).size; //get the height and width of the screen.
    return Container(
      color: Colors.white,
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipPath(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.indigo[400],
                      Colors.indigo[700],
                      Colors.indigo[900]
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    tileMode: TileMode.repeated),
              ),
            ),
            clipper: BackgroundClipper(),
          ),
          child,
        ],
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height * 0.33);

    path.quadraticBezierTo(size.width * 0.20, size.height * 0.28,
        size.width * 0.41, size.height * 0.38);

    path.quadraticBezierTo(size.width * 0.60, size.height * 0.47,
        size.width * 0.88, size.height * 0.38);

    path.quadraticBezierTo(
        size.width * 0.94, size.height * 0.36, size.width, size.height * 0.38);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
