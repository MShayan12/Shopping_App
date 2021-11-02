import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Favourite News",
          style: TextStyle(color: Colors.pink),
        ),
      ),
      body: Center(
        child: Text(
          "Favourite News are Empty",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
