import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/sources/user/user_firebase_service.dart';
import 'package:spotify_clone/domain/repository/user/user.dart';
import 'package:spotify_clone/service_locator.dart';

class UserRepositoryImpl extends UserRepository {

  @override
  Future<Either> getUser() async {
    return await sl<UserFirebaseService>().getUser();
  }

}