import 'package:flutter_bloc/flutter_bloc.dart';

// Events============
class ThemeEvent {}

// States============
enum AppTheme { light, dark }

class ThemeState {
  final AppTheme theme;
  ThemeState(this.theme);
}

// BLoC============
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(AppTheme.light)) {
    on<ThemeEvent>((event, emit) {
      emit(ThemeState(state.theme == AppTheme.light ? AppTheme.dark : AppTheme.light));
    });
  }
}
