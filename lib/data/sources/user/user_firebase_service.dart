import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/core/configs/constants/app_urls.dart';
import 'package:spotify_clone/data/models/user/user.dart';

abstract class UserFirebaseService{

  Future<Either> getUser();
}

class UserFirebaseServiceImpl extends UserFirebaseService{


  @override
  Future<Either> getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = await firebaseFirestore.collection("Users").doc(
        firebaseAuth.currentUser?.uid
      ).get();

      UserModel userModel = UserModel.fromJson(user.data() ?? {});
      userModel.imageURL = firebaseAuth.currentUser?.photoURL ?? AppURLS.defaultProfileImage;
      return Right(userModel.toEntity());

    } catch (e) {
      return Left("Could not get user $e");
    }
  }

}