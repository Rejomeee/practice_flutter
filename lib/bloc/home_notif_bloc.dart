import 'dart:async';

class HomeNotifBloc {
  final StreamController<bool> _switchController = StreamController<bool>();

  Stream<bool> get itemStream => _switchController.stream;

  void showBadge(bool notified) {
    print('showBadge');
    _switchController.sink.add(notified);
  }

  close() {
    _switchController?.close();
  }
}

final homeNotifBloc = HomeNotifBloc();
