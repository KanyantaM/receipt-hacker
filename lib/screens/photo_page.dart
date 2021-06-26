import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'dart:io';
import 'dart:async';
import '../components/compute_button.dart';
import 'text_page.dart';

class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  String result = '';
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

  Future imageToText(inputImage) async {
    result = '';
    final textDetector = GoogleMlKit.vision.textDetector();
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);

    setState(() {
      String text = recognisedText.text;
      print("whole text: ");
      print(text);
      for (TextBlock block in recognisedText.blocks) {
        //blocks (paragraph sections)
        final String text = block.text;
        for (TextLine line in block.lines) {
          //lines
          // print("Text line: ");
          // print(text);
          for (TextElement element in line.elements) {
            //words
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              TextParseBrain parse = TextParseBrain();
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
