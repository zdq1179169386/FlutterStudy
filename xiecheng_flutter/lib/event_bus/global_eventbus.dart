import 'package:event_bus/event_bus.dart';

//事件总线
class GlobalEventBus{
  EventBus eventBus;
  factory GlobalEventBus() => _getInstance();

  static GlobalEventBus get instance => _getInstance();

  static GlobalEventBus _instance;

  GlobalEventBus._internal() {
    // 创建对象
    eventBus = EventBus();
  }

  static GlobalEventBus _getInstance() {
    if (_instance == null) {
      _instance = GlobalEventBus._internal();
    }
    return _instance;
  }
}

