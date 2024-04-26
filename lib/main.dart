import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pechay Disease Detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State{
  File _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
  final pickedFile = await picker.getImage(source: ImageSource.camera);

  setState(() {
  if (pickedFile != null) {
    _image = File(pickedFile.path);
  } else {
    print('No image selected.');
  }
  });

  }
   predictResult() {
    showDialog(
              context: context,
              builder: (BuildContext context) {
              return AlertDialog(
              title: Text('Prediction Result'),
              content: Text('Placeholder for prediction result'),
              actions: [
                TextButton(
                onPressed: () {
                Navigator.of(context).pop();
                },
                child: Text('OK'),
                ),
              ],
              );
              },
              );
              }
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Pechay Disease Detector'),
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
_image == null
? Text('No image selected.')
: Image.file(_image),
SizedBox(height: 20),
Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
ElevatedButton(
onPressed: getImageFromCamera,
child: Text('Capture from Camera'),
),
ElevatedButton(
onPressed: getImageFromGallery,
child: Text('Select from Gallery'),
),
],
),
SizedBox(height: 20),
ElevatedButton(
onPressed: predictResult,
child: Text('Predict Result'),
),
],
),
),
);
}

}

