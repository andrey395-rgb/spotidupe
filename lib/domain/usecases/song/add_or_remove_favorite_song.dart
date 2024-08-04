import 'package:dartz/dartz.dart';
import 'package:spotidupe/core/usecase/usecase.dart';
import 'package:spotidupe/domain/repository/song/song.dart';
import 'package:spotidupe/service_locator.dart';

class AddOrRemoveFavoriteSongUseCase implements Usecase<Either,String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<SongsRepository>().addOrRemoveFavoriteSongs(params!);
  }
}

  