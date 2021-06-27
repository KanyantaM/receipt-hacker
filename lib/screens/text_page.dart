import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map textArgs = ModalRoute.of(context)!.settings.arguments as Map;
    print('textArgs');
    print(textArgs);
    //just copying over function to see how it worked prior to moving it to text brain
    // Future imageToText(inputImage) async {
    //   result = '';
    //   final textDetector = GoogleMlKit.vision.textDetector();
    //   final RecognisedText recognisedText =
    //   await textDetector.processImage(inputImage);
    //
    //   setState(() {
    //     String text = recognisedText.text;
    //     print("whole text: ");
    //     print(text);
    //     for (TextBlock block in recognisedText.blocks) {
    //       //blocks (paragraph sections)
    //       final String text = block.text;
    //       for (TextLine line in block.lines) {
    //         //lines
    //         // print("Text line: ");
    //         // print(text);
    //         for (TextElement element in line.elements) {
    //           //words
    //           result += element.text + " ";
    //         }
    //       }
    //     }
    //     result += "\n\n";
    //   });
    //
    return Container(
      child: Text(
        'sample',
      ),
    );
  }
}
