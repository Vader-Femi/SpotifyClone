import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import 'package:spotify_clone/service_locator.dart';

class IsFavouriteSongongUseCase implements Usecase<bool,String> {

  @override
  Future<bool> call({String? params}) async {
    return sl<SongsRepository>().isFavouriteSong(params!);
  }

}