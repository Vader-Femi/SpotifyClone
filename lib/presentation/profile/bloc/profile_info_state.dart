import 'package:spotify_clone/domain/entities/user/user.dart';

abstract class ProfileInfoState {}

class ProfileInfoLoading extends ProfileInfoState{}

class ProfileInfoLoaded extends ProfileInfoState{
  final UserEntity userEntity;
  ProfileInfoLoaded({required this.userEntity});
}

class ProfileInfoFailure extends ProfileInfoState{
  final String error;
  ProfileInfoFailure({required this.error});
}