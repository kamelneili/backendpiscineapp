import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eshopbackend/features/blocs/auth/auth_bloc.dart';
import 'package:eshopbackend/features/models/data_model.dart';
import 'package:eshopbackend/features/repositories/user/user_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;
  StreamSubscription? _authSubscription;

  ProfileBloc({
    required AuthBloc authBloc,
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(ProfileLoading()) {
    on<LoadProfile>(_onLoadProfile);
    // on<UpdateProfile>(_onUpdateProfile);

    // _authSubscription = _authBloc.stream.listen((state) {
    //   if (state.user is AuthUserChanged) {
    //     if (state.user != null) {
    //       print('authSubscription');
    //       add(LoadProfile(userid:state.authUser!.uid));
    //     }
    //   }
    // });
  }

  Future _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    print('event.authUser=');
    print(event.userid);
    print('success Profileauthenticated here ');
    final u = await _userRepository.getOrderUser(event.userid).first;
    print("my name");
    print(u.fullName);
    _userRepository.getUser(event.userid);
    emit(ProfileLoaded(user: u));
  }

  // void _onUpdateProfile(
  //   UpdateProfile event,
  //   Emitter<ProfileState> emit,
  // ) {
  //   _userRepository.updateUser(event.user);
  // }

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    super.close();
  }
}
