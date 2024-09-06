import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import 'package:spotify_clone/service_locator.dart';

class AddOrRemoveFavouriteSongUseCase implements Usecase<Either,String> {

  @override
  Future<Either> call({String? params}) async {
    return sl<SongsRepository>().addOrRemoveFavouriteSong(params!);
  }

}