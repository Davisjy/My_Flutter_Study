import 'package:flutter/material.dart';

abstract class BlockBase {
  void dispose();
}

class BlockProvider<T extends BlockBase> extends StatefulWidget {
  BlockProvider({Key key, @required this.bloc, @required this.child}): super(key:key);
  final T bloc;
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return _BlockProviderState();
  }

  static T of<T extends BlockBase>(BuildContext context) {
    final type = _typeOf<BlockProvider<T>>();
    BlockProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlockProviderState<T> extends State<BlockProvider<BlockBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

