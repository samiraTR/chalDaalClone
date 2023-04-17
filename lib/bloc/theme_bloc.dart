import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tst_app2/ui/themes/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: defaultTheme[AppTheme.light]!)) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeChanged) {
        emit.call(ThemeState(themeData: defaultTheme[event.theme]!));
      }
    });
  }
}
