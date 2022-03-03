import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        children: [
          _card1(),
        ],
      ),
    );
  }

  _card1() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('This is a title'),
            subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {}, 
              child: Text('cancelar') 
            ),
            TextButton(
              onPressed: () {}, 
              child: Text('OK')
            )
          ],
        )
        ],
      ),
    );
  }
}
