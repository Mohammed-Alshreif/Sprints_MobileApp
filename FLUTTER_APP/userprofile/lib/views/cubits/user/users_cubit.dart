import 'package:userprofile/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userprofile/models/user_model.dart';
import 'package:userprofile/services/user_services.dart';
import 'package:userprofile/models/user_model.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial()){
    getmyusers();
  }
void getmyusers() async {
  emit(Usersloading());
    var user = await UserServices().getusers();
    emit(Usersloaded(user));
    
  }
  
}
