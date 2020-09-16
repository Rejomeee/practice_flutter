import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class WiredashConsole extends StatelessWidget {
  final String userId;
  final String email;

  const WiredashConsole({
    Key key,
    this.userId = '',
    this.email = 'aronemalicse@yahoo.com',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Wiredash.of(context).setOptions(userEmail: email, userId: userId);
    Wiredash.of(context).show();
  }
}

class WiredashCustomTranslation extends WiredashTranslationData {
  String get feedbackStateIntroTitle => 'Henlo Dear!';
}
