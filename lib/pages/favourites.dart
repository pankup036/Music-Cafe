import 'package:cafe/pages/drawer.dart';
import 'package:cafe/pages/favouritelist.dart';
import 'package:flutter/material.dart';



class Favourites extends StatelessWidget {
  const Favourites({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(213, 236, 20, 132),
      drawer: drawer(),
      appBar: AppBar(
       iconTheme: IconThemeData( color: Colors.black,size: 35),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Favourites',style: TextStyle(fontSize: 25,color: Colors.black),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded,color: Colors.black,size:35)),
        ],
      ),
      body: SafeArea(child: 
      ListView(
        children: [
          SizedBox(height: 30,),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
          FavouriteList(),
        ],
      )),
      
    );
  }
}