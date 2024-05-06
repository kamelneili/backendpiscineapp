import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eshopbackend/features/blocs/user/user_event.dart';
import 'package:eshopbackend/features/blocs/user/user_state.dart';
import 'package:eshopbackend/features/repositories/user/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  StreamSubscription? _userSubscription;
  UserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserLoading()) {
    on<LoadUsers>(_onLoadUsers);
    on<LoadCoachs>(_onLoadCoachs);
    on<UpdateCoachs>(_onUpdateCoachs);

    on<UpdateUsers>(_onUpdateUsers);
    on<DeleteUser>(_onDeleteUser);
  }

  void _onLoadUsers(event, Emitter<UserState> emit) {
    _userSubscription?.cancel();
    _userSubscription =
        _userRepository.getUsers().listen((users) => add(UpdateUsers(users)));
  }

  //get all coachs
  void _onLoadCoachs(event, Emitter<UserState> emit) {
    _userSubscription?.cancel();
    _userSubscription = _userRepository
        .getCoachs()
        .listen((coachs) => add(UpdateCoachs(coachs)));
  }

  //

  void _onUpdateUsers(event, Emitter<UserState> emit) async {
    print("client");
    print(event.users);
    emit(UserLoaded(users: event.users));
  }

  //
  void _onUpdateCoachs(event, Emitter<UserState> emit) async {
    print("coachs");
    print(event.coachs);
    emit(CoachsLoaded(coachs: event.coachs));
  }

  void _onDeleteUser(event, Emitter<UserState> emit) async {
    print("delete");
    print(event.user);
    await _userRepository.deleteUser(event.user);
    _userSubscription =
        _userRepository.getUsers().listen((users) => add(UpdateUsers(users)));
  }
}
