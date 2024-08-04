import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotidupe/domain/entities/song/song.dart';
import 'package:spotidupe/domain/usecases/song/get_favorite_songs.dart';
import 'package:spotidupe/presentation/profile/bloc/favorite_songs_state.dart';
import 'package:spotidupe/service_locator.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoriteSongsLoading());

  List<SongEntity> favoriteSongs = [];

  Future<void> getFavoriteSongs() async {
    var user = await sl<GetFavoriteSongsUseCase>().call();

    user.fold(
      (l) {
        emit(FavoriteSongsFailure());
      },
      (r) {
        favoriteSongs = r;
        emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
      },
    );
  }

  void removeSong(int index) {
    favoriteSongs.removeAt(index);
    emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
  }
}
