import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cafe/notification.dart';
import 'package:cafe/pages/drawer.dart';
import 'package:cafe/pages/nowplaying.dart';
import 'package:cafe/pages/nowplayingscreen.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MyMusic extends StatefulWidget {
  const MyMusic({Key? key}) : super(key: key);

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  List<Audio> fullSongs = [];
  List<SongModel> fetchedSongs = [];
  List<SongModel> allSongs = [];

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  final OnAudioQuery _audioQuery = OnAudioQuery();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
  }
  //  Audio find(List<Audio> source, String fromPath) {
  //   return source.firstWhere((element) => element.path == fromPath);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(213, 236, 20, 132),
        drawer: drawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //backgroundColor: Color(0xffC28ADC),
          iconTheme: IconThemeData(color: Colors.black, size: 35),
          title: Text(
            'Music Cafe',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          // backgroundColor: Colors.transparent,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        
        body: 
        
        FutureBuilder<List<SongModel>>(
            future: _audioQuery.querySongs(
                sortType: null,
                orderType: OrderType.ASC_OR_SMALLER,
                uriType: UriType.EXTERNAL,
                ignoreCase: true),
            builder: (context, item) {
              if (item.data == null) {
                return CircularProgressIndicator();
              }
              if (item.data!.isEmpty) {
                return Center(child: Text('No Songs found'));
              }

              return ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top:10.0,left: 10.0,right: 10.0),
                      child: Container( height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(209, 115, 67, 236)),
                        child: ListTile(
                          onTap: (() async {
                            for (var element in allSongs) {
                              fullSongs.add(
                                Audio.file(element.uri.toString(),
                                    metas: Metas(
                                      title: element.title,
                                      id: element.id.toString(),
                                      artist: element.artist,
                                    )),
                              );
                            }
                            int size = fullSongs.length;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NowPlayingScreen(
                                      songs: fullSongs,
                                      count: size,
                                    )));
                          }),
                          leading: QueryArtworkWidget(
                            id: item.data![index].id,
                            type: ArtworkType.AUDIO,
                          ),
                          title: Text(
                            item.data![index].displayNameWOExt,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(item.data![index].artist ?? 'No Artist'),
                          trailing: Icon(Icons.more_vert),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (Context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: item.data!.length);
            }));
  }

  void requestPermission() async {
    bool requestpermission = await _audioQuery.permissionsStatus();
    if (!requestpermission) {
      _audioQuery.permissionsRequest();
    }
    setState(() {});
    fetchedSongs = await _audioQuery.querySongs();
    for (var element in fetchedSongs) {
      if (element.fileExtension == "mp3") {
        allSongs.add(element);
      }
    }
  }
}
