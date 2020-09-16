import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildScreenLoadingWidget(int type) {
  if (type == 0)
    /* data loader */
    return Center(
      child: Column(
        children: <Widget>[CupertinoActivityIndicator()],
      ),
    );
  else
    /* screen loader */
    return Center(
      child: CircularProgressIndicator(),
    );
}
