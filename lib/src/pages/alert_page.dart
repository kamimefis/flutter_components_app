import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showAlerts(context), 
          child: Text('Show alerts'),
          
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  void _showAlerts(BuildContext context){
    print('alarm!!!');
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0) ),
          title: Text('Alert!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('This is an alert message'),
              FlutterLogo(size: 100.0,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: Text('Cancel')
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: Text('OK')
            )
          ],
        );
      }
    );
  }
}