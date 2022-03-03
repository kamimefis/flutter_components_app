//To handle json file menu_opts.json
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> options = [];

//constructor MenuProvider calls to loadData method()
  _MenuProvider() {
    loadData();
  }

  //Future con una lista de objetos dinámicos. La lista son las opciones que se mostrarán en pantalla
 Future<List<dynamic>> loadData() async{
    final res= await rootBundle.loadString('data/menu_opts.json');
   
      Map dataMap= json.decode(res);
      // print(dataMap['rutas']);
      options= dataMap['rutas'];

      return options;
  }
}

//create a instance of MenuProvider()
final menuProvider= new _MenuProvider();
