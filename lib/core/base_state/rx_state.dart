import 'package:rxdart/rxdart.dart';

class RxValue<T> {
  Stream<T> get stream => _subject.stream;

  T get value => _subject.value;
  final BehaviorSubject<T> _subject;

  RxValue(T inital) : _subject = BehaviorSubject<T>.seeded(inital);

  dispose() {
    if (!_subject.isClosed) _subject.close();
  }
}

class RxState<T> {
  final RxValue<T> _value;

  RxState(T inital) : _value = RxValue(inital);

  // factory RxState(T inital) {
  //   return RxState<T>._(inital);
  // }

  emit(T val) {
    if (!_value._subject.isClosed) _value._subject.add(val);
  }

  RxValue<T> get value => _value;

  close() {
    _value.dispose();
  }
}
