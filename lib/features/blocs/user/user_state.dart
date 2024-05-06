import 'package:equatable/equatable.dart';
import 'package:eshopbackend/features/models/data_model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserDeleted extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;
  const UserLoaded({this.users = const <User>[]});
  @override
  List<Object> get props => [users];
}

class CoachsLoaded extends UserState {
  final List<User> coachs;
  const CoachsLoaded({this.coachs = const <User>[]});
  @override
  List<Object> get props => [coachs];
}
