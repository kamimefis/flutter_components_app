import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  //Create an object to control the scroll
  ScrollController _scrollController = new ScrollController();

  List<int> _numberList= [] /*[1,2,3,4,5]*/;
  int _lastItem = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addItemsToListView();

    _scrollController.addListener(() {
      //if the current position of the scroll is equal to the end of the screen:
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //add more items to the listview:
        _addItemsToListView();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View')),
      body: _createList(),
    );
  }

  Widget _createList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _numberList.length,
      itemBuilder: (BuildContext context, int index){

        final _images= _numberList[index];

        return FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage('https://picsum.photos/500/300/?image=$_images')
        );
      }
    );
  }


  //method to add 10 images at the end of the image scroll
  void _addItemsToListView() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _numberList.add(_lastItem);
    }
    setState(() {
      
    });

  }

}
