import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'dart:io';
import 'dart:async';
import '../components/compute_button.dart';
import '../text_brain.dart';

class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  File? _image;
  InputImage? inputImage;
  final picker = ImagePicker();

  //function picks image from gallery and displays on photo page
  Future pickImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        inputImage = InputImage.fromFilePath(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  //function triggers camera to take picture and then displays photo page
  Future captureImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        inputImage = InputImage.fromFilePath(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt Hacker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 550,
              child: Center(
                child: SingleChildScrollView(
                  child: _image == null
                      ? Text('Upload receipt')
                      : Image.file(_image!),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  print('Pick Image');
                  pickImageFromGallery();
                },
                child: Icon(Icons.attach_file),
              ),
              FloatingActionButton(
                onPressed: () {
                  print('Take a photo');
                  captureImageFromCamera();
                },
                child: Icon(Icons.add_a_photo),
              ),
            ],
          ),
          ComputeButton(
            onTap: () {
              TextBrain parse = TextBrain(
                inputImage: inputImage,
              );
              Navigator.pushNamed(context, '/textified', arguments: {});
            },
            buttonTitle: 'TEXTIFY!',
          ),
        ],
      ),
    );
  }
}

// <div>Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
