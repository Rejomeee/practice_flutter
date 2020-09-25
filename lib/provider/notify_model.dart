import 'package:flutter/material.dart';

class NotifyModel extends ChangeNotifier {
  bool notifiedBadge = false;

  void changeNotifyBadgeStatus(notified) {
    notifiedBadge = notified;
    print('notifiedBadge');
    print(notifiedBadge);
    notifyListeners();
  }
}
