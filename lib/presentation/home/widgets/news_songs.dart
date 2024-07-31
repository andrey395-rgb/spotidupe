import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotidupe/core/configs/constants/app_urls.dart';
import 'package:spotidupe/domain/entities/song/song.dart';
import 'package:spotidupe/presentation/home/bloc/new_songs_state.dart';
import 'package:spotidupe/presentation/home/bloc/news_songs_cubit.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
          height: 200,
          child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
              builder: (context, state) {
            if (state is NewsSongsLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),);
            }

            if (state is NewsSongsLoaded) {
              return _songs(
                state.songs
              );
            }

            return Container();
          })),
    );
  }

   Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index) {
        return SizedBox(
          
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(30),
                    image: DecorationImage( 
                      // fit: BoxFit.cover,
                      image: NetworkImage(
                        '${AppUrls.songFirestorage}${songs[index].title}-${songs[index].artist}.jpg?${AppUrls.mediaAlt}'
                      )
                    )
                  ),
                ),
              )
            ]
          )
        );
      },  
      separatorBuilder: (context,index) => const SizedBox(width: 14,),
      itemCount: songs.length
    );
  }
}
