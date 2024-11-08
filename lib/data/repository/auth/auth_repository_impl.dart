import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_clone/data/models/auth/sign_in_req.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{

  @override
  Future<Either> signin(SignInUserRequest signInUserRequest) async {
    return await sl<AuthFirebaseService>().signin(signInUserRequest);
  }

  @override
  Future<Either> signup(CreateUserRequest createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

}