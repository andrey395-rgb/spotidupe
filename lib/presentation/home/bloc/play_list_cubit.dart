import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotidupe/domain/usecases/song/get_play_list.dart';
import 'package:spotidupe/service_locator.dart';
import 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState> {
  
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlayListUseCase>().call();
    returnedSongs.fold(
      (l) { //change data to l
      emit(
        
        PlayListLoadFailure()//experiment
        );
    }, (data) {
      emit(
        PlayListLoaded(songs: data)
        );
    });
  }
}
