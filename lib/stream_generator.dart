import 'dart:async';

class StreamGnerator {
  Stream<int> get intStream async* {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield (i);
    }
  }
}

class CustomStream {
  final StreamController<int> _controller = StreamController.broadcast();

  Stream<int> get stream => _controller.stream;
  int _currentVal = 0;
  int get currentValue => _currentVal;

  void add(int val) {
    _currentVal = val;
    _controller.sink.add(val);
  }

  void addError(Object e) {
    _controller.addError(e);
  }

  void dispose() {
    _controller.close();
  }
}
