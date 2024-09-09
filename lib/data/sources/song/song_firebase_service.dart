import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/song/song.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/domain/usecases/song/is_favourite_song.dart';
import 'package:spotify_clone/service_locator.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();

  Future<Either> getAllSongs();

  Future<Either> addOrRemoveFavouriteSong(String songId);

  Future<bool> isFavouriteSong(String songId);

  Future<Either> getFavouriteSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];

      var data = await FirebaseFirestore.instance
          .collection("Songs")
          .orderBy("releaseDate", descending: true)
          .limit(3)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        var isFavourite = await sl<IsFavouriteSongongUseCase>()
            .call(params: element.reference.id);
        songModel.isFavourite = isFavourite;
        songModel.songId = element.reference.id;
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return const Left("An Error occurred, Please try again");
    }
  }

  @override
  Future<Either> getAllSongs() async {
    try {
      List<SongEntity> songs = [];

      var data = await FirebaseFirestore.instance
          .collection("Songs")
          .orderBy("releaseDate", descending: true)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        var isFavourite = await sl<IsFavouriteSongongUseCase>()
            .call(params: element.reference.id);
        songModel.isFavourite = isFavourite;
        songModel.songId = element.reference.id;
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return const Left("An Error occurred, Please try again");
    }
  }

  @override
  Future<Either> addOrRemoveFavouriteSong(String songId) async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      late bool isFavourite;
      var user = firebaseAuth.currentUser;
      String uId = user!.uid;

      QuerySnapshot favouriteSongs = await firebaseFirestore
          .collection("Users")
          .doc(uId)
          .collection("Favourites")
          .where("songId", isEqualTo: songId)
          .get();

      if (favouriteSongs.docs.isNotEmpty) {
        await favouriteSongs.docs.first.reference.delete();
        isFavourite = false;
      } else {
        await firebaseFirestore
            .collection("Users")
            .doc(uId)
            .collection("Favourites")
            .add({"songId": songId, "addedDate": Timestamp.now()});

        isFavourite = true;
      }

      return Right(isFavourite);
    } catch (e) {
      return Left("An error occured: ${e.toString()}");
    }
  }

  @override
  Future<bool> isFavouriteSong(String songId) async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = firebaseAuth.currentUser;
      String uId = user!.uid;

      QuerySnapshot favouriteSongs = await firebaseFirestore
          .collection("Users")
          .doc(uId)
          .collection("Favourites")
          .where("songId", isEqualTo: songId)
          .get();

      if (favouriteSongs.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getFavouriteSongs() async {
    try {
      List<SongEntity> songs = [];

      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = firebaseAuth.currentUser;
      String uId = user!.uid;

      var data = await firebaseFirestore
          .collection("Users")
          .doc(uId)
          .collection("Favourites")
          .orderBy("addedDate", descending: true)
          .get();

      for (var element in data.docs) {
        String songId = element["songId"];
        var song =
            await firebaseFirestore.collection("Songs").doc(songId).get();
        var songModel = SongModel.fromJson(song.data() ?? {});
        songModel.songId = songId;
        songModel.isFavourite = true;
        songs.add(songModel.toEntity());
        print(songModel.toEntity());
      }
      
      print(songs.length);

      return Right(songs);
    } on FirebaseException catch (e) {
      return const Left("An Error occurred, Please try again");
    }
  }
}
