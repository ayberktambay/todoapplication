
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/theme/theme_library.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ChangeTheme>((event, emit) {
      emit(ThemeChanged(themeData: event.theme));
    });
  }
}