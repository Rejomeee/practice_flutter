import 'package:flutter/material.dart';

class RoudedButton extends StatelessWidget {
  final String text;
  final Function press;
  final bool disableButton;
  final Color color, textColor;
  const RoudedButton({
    Key key,
    this.text,
    this.press,
    this.color = Colors.indigoAccent,
    this.textColor = Colors.white,
    this.disableButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery.of(context).size; //get the height and width of the screen.
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: AbsorbPointer(
          absorbing: disableButton,
          child: FlatButton(
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            color: disableButton ? color.withOpacity(0.5) : color,
            onPressed: press,
          ),
        ),
      ),
    );
  }
}
