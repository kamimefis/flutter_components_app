import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _name= '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Section')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0 ),
        children: [
          _createInput(),
          Divider(),
          _createPerson(),
        ],
      )
    );
  }

  Widget _createInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0) 
        ),
        counter: Text('n° caracteres: ${_name.length}'),
        hintText: 'Enter name',
        labelText: 'Name',
        helperText: 'Please, enter your real name',
        suffixIcon: Icon(Icons.accessibility_new),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (value) {
        
        setState(() => _name= value);
        print('NOMBRE:' + _name);
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Your name is: ${_name}'),
    );
  }

}