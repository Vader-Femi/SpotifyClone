import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserRequest createUserReq);

  Future<void> signin();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signin() async {}

  @override
  Future<Either> signup(CreateUserRequest createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      return const Right("Sign up was successful");

    } on FirebaseAuthException catch (e) {
      
      String message = "";
      if (e.code == "Weak Password") {
        message = "The Password provided is too weak";
      } else if (e.code == "emmail-already-in-use") {
        message = "An account already exist with that email";
      } else {
        message = e.message ?? "Something went wrong";
      }

      return Left(message);
    }
  }
}
