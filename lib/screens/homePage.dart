import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:google_ml_kit/google_ml_kit.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String result = '';
  File? _image;
  InputImage? inputImage;
  final picker = ImagePicker();

  Future pickImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        inputImage = InputImage.fromFilePath(pickedFile.path);
        imageToText(inputImage);
      } else {
        print('No image selected.');
      }
    });
  }

  Future captureImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        inputImage = InputImage.fromFilePath(pickedFile.path);
        imageToText(inputImage);
      } else {
        print('No image selected.');
      }
    });
  }

  Future imageToText(inputImage) async {
    final textDetector = GoogleMlKit.vision.textDetector();
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);

    setState(() {
      String text = recognisedText.text;
      for (TextBlock block in recognisedText.blocks) {
        final String text = block.text;
        for (TextLine line in block.lines) {
          for (TextElement element in line.elements) {
            result += element.text + " ";
          }
        }
      }
      result += "\n\n";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt Hacker'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            child: SingleChildScrollView(
              child: _image == null
                  ? Text('No image selected.')
                  : Image.file(_image!),
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  result,
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: FloatingActionButton(
                  onPressed: () {
                    print('Pick Image');
                    pickImageFromGallery();
                  },
                  child: Icon(Icons.attach_file),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: () {
                    print('Take a photo');
                    captureImageFromCamera();
                  },
                  child: Icon(Icons.add_a_photo),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// <div>Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
