import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, confirmBtnTxt;
  final Image image;
  final Function confirmBtnFnc;

  CustomDialog({
    this.title = 'The Title',
    this.description =
        "We were both young when I first saw you. I close my eyes and the flashback starts. I'm standin' there. On a balcony in summer air",
    this.confirmBtnTxt = 'Confirm',
    this.image,
    this.confirmBtnFnc,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 100, bottom: 16, left: 16, right: 16),
            margin: EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  )
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: confirmBtnFnc,
                    child: Text(
                      confirmBtnTxt,
                      style: TextStyle(
                          color: confirmBtnTxt == 'Logout' ? Colors.red : null),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 16,
            right: 16,
            child: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 50,
            ),
          )
        ],
      ),
    );
  }
}
