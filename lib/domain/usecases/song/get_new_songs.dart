import 'package:dartz/dartz.dart';
import 'package:spotidupe/core/configs/usecase/usecase.dart';
import 'package:spotidupe/data/models/auth/create_user_req.dart';
import 'package:spotidupe/data/repository/song/song_repository_impl.dart';
import 'package:spotidupe/domain/repository/auth/auth.dart';
import 'package:spotidupe/domain/repository/song/song.dart';
import 'package:spotidupe/service_locator.dart';

class GetNewsSongsUseCase implements Usecase<Either,dynamic> {

  @override
  Future<Either> call({params}) async{
    return await sl<SongsRepository>().getNewSongs();
  }
}