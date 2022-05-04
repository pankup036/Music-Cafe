

import 'package:cafe/pages/drawer.dart';
import 'package:cafe/pages/musiclist.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MyMusic extends StatefulWidget {
  const MyMusic({Key? key}) : super(key: key);

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  final OnAudioQuery _audioQuery = OnAudioQuery();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
  }

  requestPermission()async{
bool reqpermission =await _audioQuery.permissionsStatus();
   if(!reqpermission){
     _audioQuery.permissionsRequest();
     setState(() {
       
     });
  }
  

   
   
  


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
        body: FutureBuilder<List<SongModel>>(
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
                    return ListTile(
                      leading: QueryArtworkWidget(id: item.data![index].id,type: ArtworkType.AUDIO,),
                      title: Text(item.data![index].displayNameWOExt,overflow: TextOverflow.ellipsis,),
                      subtitle: Text(item.data![index].artist?? 'No Artist'),
                      trailing: Icon(Icons.more_vert),
                    );
                  },
                  separatorBuilder: (Context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: item.data!.length);
            })); // SafeArea(
    //       child: ListView.separated(itemBuilder: (context,index){
    //         return Padding(
    //   padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
    //   child: Container(
    //     height: 75,
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(15),
    //         color: Color.fromARGB(209, 115, 67, 236)),
    //     child: ListTile(
    //       leading: ClipRRect(
    //         borderRadius: BorderRadius.circular(5.0), //or 15.0
    //         child: Container(
    //           height: 70.0,
    //           width: 50.0,
    //           child: Image.asset(
    //             'Assets/10.jpg',
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //       title: Text('PETTA'),
    //       subtitle: Text('Unknown Artist'),
    //       trailing: PopupMenuButton(
    //         icon: Icon(Icons
    //             .more_vert_outlined), //don't specify icon if you want 3 dot menu
    //         // color: Colors.blue,
    //         itemBuilder: (context) => [
    //           PopupMenuItem(
    //             value: 0,
    //             child: Text(
    //               "Add to Playlist",
    //               style: TextStyle(color: Colors.black),
    //             ),
    //           ),
    //           PopupMenuItem(
    //             value: 1,
    //             child: Text(
    //               "Add to Favourites",
    //               style: TextStyle(color: Colors.black),
    //             ),
    //           ),
    //         ],
    //         onSelected: (item) => {print(item)},
    //       ),
    //     ),
    //   ),
    // );
    //       }, separatorBuilder: (context,index){return SizedBox(height: 10,);}, itemCount: 10)

    //  ) ,);
  }

  // void requestPermission() async
  //  bool PermissionStatus=await _audioQuery.permissionsStatus();
  //  if(!PermissionStatus){

  //  }
  // }

}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}