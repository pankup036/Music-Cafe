import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class NowPlayingScreen extends StatefulWidget {
  List<Audio> songs;
  int count;
  NowPlayingScreen({Key? key, required this.songs, required this.count})
      : super(key: key);

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  bool autoPlay = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assetsAudioPlayer.open(
        Playlist(
          audios: widget.songs,
          startIndex: widget.count,
        ),
        showNotification: true);
  }

  @override
  Widget build(BuildContext context) {
    // final assetaudioplayer=AssetsAudioPlayer();
    return Scaffold(
      backgroundColor: Color.fromARGB(188, 182, 36, 111),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Now Playing',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 30,
              ))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: assetsAudioPlayer.builderRealtimePlayingInfos(
              builder: (BuildContext context, RealtimePlayingInfos realtime) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20.0), //or 15.0
                          child: Container(
                            decoration: BoxDecoration(),
                            height: 400.0,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: QueryArtworkWidget(
                                keepOldArtwork: true,
                                id: int.parse(realtime
                                    .current!.audio.audio.metas.id
                                    .toString()),
                                type: ArtworkType.AUDIO,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.tune,
                            size: 35,
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 35,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      assetsAudioPlayer.builderRealtimePlayingInfos(
                          builder: (context, infos) {
                        Duration currentPosition = infos.currentPosition;
                        Duration total = infos.duration;
                        return ProgressBar(
                          progress: currentPosition,
                          total: total,
                          onSeek: (to) {
                            assetsAudioPlayer.seek(to);
                          },
                           baseBarColor: const Color.fromARGB(255, 190, 190, 190),
          progressBarColor: Color.fromARGB(209, 115, 67, 236 ),
          bufferedBarColor: const Color.fromARGB(209, 115, 67, 236 ),
          thumbColor: const Color.fromARGB(213, 236, 20, 132),
                        );
                      }),
                      // LinearPercentIndicator(
                      //   lineHeight: 8,
                      //   percent: 0.4,
                      //   barRadius: const Radius.circular(16),
                      //   progressColor: Color.fromARGB(255, 179, 31, 147),
                      //   backgroundColor: Colors.grey[300],
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text('1.35',style: TextStyle(fontSize: 15,),),
                      //     Text('4.35',style: TextStyle(fontSize: 15,),)
                      //   ],
                      // ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Icon(Icons.shuffle,size: 35,),
                        IconButton(
                            onPressed: () {
                              assetsAudioPlayer.shuffle;
                            },
                            icon: Icon(Icons.shuffle, size: 35)),
                        // Icon(Icons.skip_previous,size: 45,color: Colors.white,),
                        IconButton(
                            onPressed: () {
                              assetsAudioPlayer.previous();
                            },
                            icon: Icon(
                              Icons.skip_previous,
                              size: 45,
                              color: Colors.white,
                            )),
                        Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Colors.white),
                            child: IconButton(
                              onPressed: () {
                                assetsAudioPlayer.pause();
                              },
                              icon: Icon(Icons.play_arrow),
                            )),

                        // IconButton(onpressed:(){} Icons.skip_next, size: 45,color: Colors.white),
                        IconButton(
                            onPressed: () {
                              assetsAudioPlayer.next();
                            },
                            icon: Icon(Icons.skip_next,
                                size: 45, color: Colors.white)),
                        Icon(Icons.playlist_add, size: 35)
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
