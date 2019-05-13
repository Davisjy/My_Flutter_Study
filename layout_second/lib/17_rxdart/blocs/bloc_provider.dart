import 'package:flutter/material.dart';
import './count_bloc.dart';

class BlocProvider extends InheritedWidget {
  final CountBloc bloc = CountBloc();

  BlocProvider({Key key, Widget child}): super(key: key, child:child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static CountBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bloc;
  }
}