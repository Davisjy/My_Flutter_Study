import './bloc_base.dart';
import 'dart:async';

class IncrementBloc extends BlockBase {
  int _counter;

  StreamController<int> _counterPipe = StreamController<int>();
  Stream<int> get outCounter => _counterPipe.stream;

  IncrementBloc() {
    _counter = 0;
  }

  increamentCounter() {
    _counter = _counter + 1;
    _counterPipe.sink.add(_counter);
  }

  @override
  void dispose() {
    _counterPipe.close();
  }
}