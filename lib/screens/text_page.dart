import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/round_button.dart';
import '../components/compute_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../calculator_brain.dart';

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  int tip = 18;
  int people = 2;

  //for tax/tip
  String splitSelection = 'evenly';

  void showSelection(splitType) {
    splitType == splitSelection
        ? splitSelection = ''
        : splitSelection = splitType;
  }

  Widget build(BuildContext context) {
    Map textArgs = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt Hacker'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text('Items'),
                      for (var item in textArgs['items']) Text(item),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Subtotal'),
                      Text('Tax'),
                      Text('Total'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Prices',
                      ),
                      for (var price in textArgs['prices']) Text(price),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        textArgs['sub'],
                      ),
                      Text(
                        textArgs['tax'],
                      ),
                      Text(
                        textArgs['total'],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: Colors.green,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Tip %',
                        ),
                        Text(
                          tip.toString(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (tip > 0) {
                                    tip--;
                                  }
                                });
                              },
                              color: Colors.red,
                            ),
                            SizedBox(width: 10.0),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  tip++;
                                });
                              },
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: Colors.yellow,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'People',
                        ),
                        Text(
                          people.toString(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (people > 2) {
                                    people--;
                                  }
                                });
                              },
                              color: Colors.red,
                            ),
                            SizedBox(width: 10.0),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  people++;
                                });
                              },
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: Colors.blue,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              'Split Tax/Tip',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (splitSelection == 'percent') {
                                      setState(() {
                                        showSelection('evenly');
                                      });
                                    }
                                  },
                                  child: Text(
                                    'EVENLY',
                                    style: splitSelection == 'evenly'
                                        ? kChosenTextStyle
                                        : kLDefaultTextStyle,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (splitSelection == 'evenly') {
                                      setState(() {
                                        showSelection('percent');
                                      });
                                    }
                                  },
                                  child: Text(
                                    'BASED ON %',
                                    style: splitSelection == 'percent'
                                        ? kChosenTextStyle
                                        : kLDefaultTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ComputeButton(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                //really cheesy way of finding subtotal and tax values here; need to refine the regex better
                sub: num.parse(
                    textArgs['prices'][textArgs['prices'].length - 3]),
                tax: num.parse(
                    textArgs['prices'][textArgs['prices'].length - 2]),
                tipPercent: tip,
                people: people,
                splitType: splitSelection,
              );
              print('I was pressed');
              Navigator.pushNamed(context, '/results', arguments: {
                'tipTotal': calc.calculateTip(),
                'taxTipPP': calc.taxTipPer(),
                'itemTotalPP': calc.itemTotalPer(),
                'totalPP': calc.totalPer(),
              });
            },
            buttonTitle: 'HACK MY RECEIPT!',
          ),
        ],
      ),
    );
  }
}
