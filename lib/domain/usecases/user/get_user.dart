import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/repository/user/user.dart';
import 'package:spotify_clone/service_locator.dart';

class GetUserUseCase extends Usecase<Either, dynamic> {

  @override
  Future<Either> call({params}) {
    return sl<UserRepository>().getUser();
  }
}