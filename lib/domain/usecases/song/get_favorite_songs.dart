import 'package:dartz/dartz.dart';
import 'package:spotidupe/core/usecase/usecase.dart';
import 'package:spotidupe/domain/repository/song/song.dart';
import 'package:spotidupe/service_locator.dart';

class GetFavoriteSongsUseCase implements Usecase<Either,dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getUserFavoriteSongs();
  }
}

  