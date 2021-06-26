import 'dart:math';
import 'package:google_ml_kit/google_ml_kit.dart';

class TextBrain {
  //needs to take in the input image and use the image to text function
  //needs to parse through the text and return strings

  String result = '';

  TextBrain({
    required this.inputImage,
  });

  InputImage? inputImage;

  Future imageToText(inputImage) async {
    result = '';
    final textDetector = GoogleMlKit.vision.textDetector();
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);

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
  }
}
