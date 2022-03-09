import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliders')),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _createSlider(),
            Expanded(child: _createImage()),
          ],
        )
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
        label: 'Image size',
        activeColor: Colors.amber,
        // divisions: 10,
        value: _sliderValue,
        min: 10.0,
        max: 400.0,
        onChanged: (value) {
          print(value);
          setState(() {
            _sliderValue = value;
          });
        });
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://images.unsplash.com/photo-1530092285049-1c42085fd395?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d2hpdGUlMjBmbG93ZXJ8ZW58MHx8MHx8&w=1000&q=80'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }
}
