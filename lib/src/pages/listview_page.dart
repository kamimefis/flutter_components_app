import 'dart:async';

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
  bool _loading = false;


  //initState similar to useEffect in react??
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addItemsToListView();

    _scrollController.addListener(() {
      //if the current position of the scroll is equal to the end of the screen:
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //add more items to the listview:
        // _addItemsToListView();

        fetchData();
      }
    });
  }


  //ScrollController is listening all the changes in the scroll. In theory, if I go back on application
  //and go inside this screen section and go back again and go inside listview again, listeners are creating
  //each time. To handle this, we have to use dispose() (similar to unmount component in react??)
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  //RENDER ALL THE WIDGETS DISPLAYED ON SCREEN
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View')),
      body: Stack(
        children: [
          _createList(),
          _createLoadingWidget(),
        ],
      )
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

  //fetch simulator
  Future fetchData() async {
    setState(() {
      _loading = true;
    });

    final duration= new Duration(seconds: 2);
    return new Timer(duration, httpRes);  
  }

  //callback called in fetchData()
  void httpRes(){
    //loading is false because after 2 seconds the page is loaded
    _loading = false;

    //transition effect when more images are loaded on page
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250), 
      curve: Curves.fastLinearToSlowEaseIn
    );

    //to load more images on page
    _addItemsToListView();
  }


  Widget _createLoadingWidget() {
    if(_loading){
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        //the column use all the width of the screen, so center items inside row are possible:
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
    }
    return Container();
  }
    


}
