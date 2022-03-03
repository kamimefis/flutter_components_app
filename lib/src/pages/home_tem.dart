import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temp home'),
      ),
      body: ListView(
        children: _shortCreateItems(),
        // children: _createItems()
        ),
    );
  }


//Large option to return the list of items to display in ListView 
  List<Widget> _createItems() {
    List<Widget> myList = [];

//Iterate options array
    for (var opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      myList
        ..add(tempWidget)
        ..add(Divider());
      //second option:
      //  myList.add(tempWidget);
      //  myList.add(Divider());
    }

    return myList;
  }

  //Short option to return option list:
  List<Widget> _shortCreateItems(){
    return options.map((item){
      return Column(
        children: [
          ListTile(
            title: Text(item + '!!!!'),
            subtitle: Text('subtitle'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider(),
        ],
      );
    }).toList();
  }


}
