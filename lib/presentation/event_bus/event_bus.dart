import 'dart:async';
import 'package:injectable/injectable.dart';

@lazySingleton
class EventBus {
  final StreamController<Event> _streamController = StreamController<Event>.broadcast();

  Stream<Event> get stream => _streamController.stream;

  Stream<T> on<T extends Event>() {
    if (T == dynamic) {
      return _streamController.stream as Stream<T>;
    }
    return _streamController.stream.where((event) => event is T).cast<T>();
  }

  void fire(Event event) {
    _streamController.add(event);
  }

  void destroy() => _streamController.close();
}

abstract class Event {
  const Event();
}
