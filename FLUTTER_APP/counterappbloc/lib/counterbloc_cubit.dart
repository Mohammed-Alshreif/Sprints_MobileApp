import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
//builder: (context, counter) stat=counter (;
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
