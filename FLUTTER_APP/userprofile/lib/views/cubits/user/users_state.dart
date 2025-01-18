part of 'users_cubit.dart';
@immutable

abstract class UsersState {}

class UsersInitial extends UsersState {}

class Usersloading extends UsersState {}
class Usersloaded extends UsersState {
  final List <User> user ;
  Usersloaded(this.user);
}


