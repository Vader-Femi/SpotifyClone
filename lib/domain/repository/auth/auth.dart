import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';

abstract class AuthRepository {

  Future<Either> signup(CreateUserRequest createUserReq);

  Future<void> signin();
}