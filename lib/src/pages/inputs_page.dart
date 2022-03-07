import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _name= '';
  String _email= '';
  String _password = '';
  String _date = '';
  String _selectedOpt = 'Jojo';
  List _dropdownList = ['Jojo', 'Bojji', 'Saitama', 'Gugu', 'Vash', 'Ein'];

  //To assign a date input value to its textfield and display it on screen
  TextEditingController _inputFieldDateController= new TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Section')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0 ),
        children: [
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropDown(),
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
        counter: Text('n° characters: ${_name.length}'),
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
      subtitle: Text('You email is: ${_email}'),
      trailing: Text(_selectedOpt),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        labelText: 'Email',
        hintText: 'Enter your email',
        prefixIcon: Icon(Icons.email),
        suffixIcon: Icon(Icons.alternate_email)
      ),
      onChanged: (value) => setState(() {
        _email = value;
        print('EMAIL:' + _email);
      }),
    );
  }

  Widget _createPassword() {
    return TextField(
      // keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter password',
        // helperText: 'Password',
        prefixIcon: Icon(Icons.lock_open),
        suffixIcon: Icon(Icons.lock),
        // counter: Text('password length: ${_password.length}'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)),    
      ),
      onChanged: (value) => setState(() {
        _password= value;
        print('PASSWORD: ' + value);
      }),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0) 
        ),
        labelText: 'Date',
        hintText: 'Enter Date',
        prefixIcon: Icon(Icons.calendar_month),
        suffixIcon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());

        //method to open datepicker dialog:
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2018),
    lastDate: DateTime(2023),
    locale: Locale('es','ES')
  );

  if(picked != null){
    setState(() {
      _date = picked.toString();
      _inputFieldDateController.text = _date;
    });
  }
  
}


  List<DropdownMenuItem<String>> getDropDownOptions() {
    List<DropdownMenuItem<String>> myList= [];
    _dropdownList.forEach((opt) { 
      myList.add(DropdownMenuItem(
        child: Text(opt),
        value: opt,
      ));
    });
    return myList;
  }

  Widget _createDropDown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        DropdownButton(
          value: _selectedOpt,
          items: getDropDownOptions(), 
          onChanged: (opt){
            setState(() {
              _selectedOpt = opt as String;
            });
          }
        ),
      ],
    );
  }

}