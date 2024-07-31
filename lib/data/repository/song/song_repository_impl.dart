import 'package:dartz/dartz.dart';
import 'package:spotidupe/data/sources/songs/song_firebase_service.dart';
import 'package:spotidupe/domain/repository/song/song.dart';
import 'package:spotidupe/service_locator.dart';

class SongRepositoryImpl extends SongsRepository{
  @override
  Future<Either> getNewSongs() async {
  return await sl<SongFirebaseService>().getNewsSongs();
  }
  
}