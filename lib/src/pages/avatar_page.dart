import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://static.wikia.nocookie.net/espokemon/images/6/62/Bulbasaur_PLB.png/revision/latest?cb=20170426010212'),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: CircleAvatar(
              child: Text('CL'),
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://static.wikia.nocookie.net/videojuego/images/4/43/Bulbasaur.png/revision/latest?cb=20110113231911'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}