import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/sign_in_req.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class SigninUseCase implements Usecase<Either,SignInUserRequest> {

  @override
  Future<Either> call({SignInUserRequest? params}) async {

    return sl<AuthRepository>().signin(params!);
  }

}