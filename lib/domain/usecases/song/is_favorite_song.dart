import 'package:spotidupe/core/usecase/usecase.dart';
import 'package:spotidupe/domain/repository/song/song.dart';
import 'package:spotidupe/service_locator.dart';

class IsFavoriteSongUseCase implements Usecase<bool,String> {
  @override
  Future<bool> call({String ? params}) async {
    return await sl<SongsRepository>().isFavoriteSong(params!);
  }
}

  