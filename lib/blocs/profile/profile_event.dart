part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {
  final String userid;

  const LoadProfile({required this.userid});

  @override
  List<Object?> get props => [userid];
}

class UpdateProfile extends ProfileEvent {
  final User u;

  const UpdateProfile({required this.u});

  @override
  List<Object?> get props => [u];
}
