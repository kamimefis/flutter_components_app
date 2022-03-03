import 'package:flutter/material.dart';

import 'package:components_app/src/providers/menu_provider.dart';
import 'package:components_app/src/utils/icon_string_util.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components App'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    //to call the imported instance menuProvider from _MenuProvider class, so you can
    //see menu_opts.json printed in console:
    // menuProvider.loadData();

    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          children: _listItems(snapshot.data),
        );
      },
    );

    // return ListView(
    //   children: _listItems(),
    // );
  }

  List<Widget> _listItems(List<dynamic> data) {
    final List<Widget> options = [];
    data.forEach((opt) {
      final widgetText = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Color.fromARGB(255, 64, 185, 255),
        ),
        onTap: () {},
      );

      options
        ..add(widgetText)
        ..add(Divider());
    });

    return options;
  }
}
