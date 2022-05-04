import 'package:cafe/pages/albums.dart';
import 'package:cafe/pages/favourites.dart';
import 'package:cafe/pages/mymusic.dart';
import 'package:cafe/pages/playlist.dart';
import 'package:flutter/material.dart';


import 'pages/nowplaying.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentSelectedIndex = 0;
  final _pages = [
    MyMusic(),
    Albums(),
    Playlist(),
    Favourites(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: NowPlaying(),
      body: _pages[_currentSelectedIndex],
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
        canvasColor: Color.fromARGB(188, 182, 36, 111),),
        child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            currentIndex: _currentSelectedIndex,
            onTap: (newIndex) {
              setState(() {
                _currentSelectedIndex = newIndex;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.headphones), label: 'My Music'),
              BottomNavigationBarItem(icon: Icon(Icons.album), label: 'Albums'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.playlist_add), label: 'Playlist'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outlined), label: 'Favourite'),
            ]),
      ),
    );
  }
}
