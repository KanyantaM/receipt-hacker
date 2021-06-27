import 'dart:math';
import 'dart:ui';

class TextBrain {
  //needs to take in list of lines of text

  TextBrain({
    required this.textLines,
  });

  final List<String> textLines;
  //needs to parse through the text to split into word list and cost list
  List<String> wordList = [];
  List<String> costList = [];

  dynamic parseText(List textLines) {
    //need to use regular expressions to differentiate between money, tax, tip, subtotal or total, item names, item quantities
    RegExp isMoney = RegExp(r'([0-9]{1,3}\.[0-9][0-9])');
    // RegExp isTax = RegExp(r'([Tt][Aa][Xx])');
    // RegExp isTip = RegExp(r'([Tt][Ii][Pp])');
    // RegExp totalOrSub = RegExp(r'([Tt][Oo][Tt][Aa][Ll])');
    // RegExp qty = RegExp(r'(^[0-9]{1-3}\s|[0-9]{1,3})');

    //break into costs vs words
    for (int i = 0; i < textLines.length; i++) {
      if (isMoney.hasMatch(textLines[i])) {
        costList.add(textLines[i]);
      } else {
        wordList.add(textLines[i]);
      }
    }
    print('cost list: ');
    print(costList);
    //values to find
    num total = 0;
    num subtotal = 0;
    num tax = 0;
    num tip = 0;

    //can search for the largest number to find the total value, then remove that line from the list
    int indexToRemove = 0;

    for (int i = 0; i < costList.length; i++) {
      num foundPrice = num.parse(isMoney.stringMatch(costList[i])!);
      //have to use regex stringMatch to remove any possible letters attached to costs
      print('found price: ');
      print(foundPrice);
      if (foundPrice > total) {
        total = foundPrice;
        indexToRemove = i;
      }
    }

    textLines.removeAt(indexToRemove);
    print('total value found: ');
    return total;
  }
}
