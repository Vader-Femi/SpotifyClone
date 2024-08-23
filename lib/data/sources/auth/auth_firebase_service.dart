import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_clone/data/models/auth/sign_in_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserRequest createUserReq);

  Future<Either> signin(SignInUserRequest signInUserRequest);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {

  @override
  Future<Either> signin(SignInUserRequest signInUserRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signInUserRequest.email, password: signInUserRequest.password);

      return const Right("Sign in was successful");

    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == "invalid-email") {
        message = "Email or password invalid";
      } else if (e.code == "invalid-credential") {
        message = "Email or password invalid";
      } else {
        message = e.message ?? "Something went wrong";
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserRequest createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      return const Right("Sign up was successful");
    } on FirebaseAuthException catch (e) {

      String message = "";
      if (e.code == "weak-password") {
        message = "The Password provided is too weak";
      } else if (e.code == "email-already-in-use") {
        message = "An account already exist with that email";
      } else {
        message = e.message ?? "Something went wrong";
      }

      return Left(message);
    }
  }
}
