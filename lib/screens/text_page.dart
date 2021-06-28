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
            flex: 3,
            child: ReusableCard(
              color: Colors.white70,
              cardChild: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 20.0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'ITEMS',
                            style: kReceiptHeaderStyle,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          for (var item in textArgs['items'])
                            Text(
                              item,
                              style: kReceiptTextStyle,
                            ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Subtotal',
                            style: kReceiptTextStyle,
                          ),
                          Text(
                            'Tax',
                            style: kReceiptTextStyle,
                          ),
                          Text(
                            'Total',
                            style: kReceiptTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 40.0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'PRICES',
                            style: kReceiptHeaderStyle,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          for (var price in textArgs['prices'])
                            Text(
                              "\$" + price,
                              style: kReceiptTextStyle,
                            ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "\$" + textArgs['sub'],
                            style: kReceiptTextStyle,
                          ),
                          Text(
                            "\$" + textArgs['tax'],
                            style: kReceiptTextStyle,
                          ),
                          Text(
                            "\$" + textArgs['total'],
                            style: kReceiptTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: Color(0xFF953D97),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'TIP',
                          style: kCardHeaderStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          tip.toString() + '\%',
                          style: kCardValueStyle,
                        ),
                        SizedBox(
                          height: 20.0,
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
                              color: Colors.white70,
                            ),
                            SizedBox(width: 40.0),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  tip++;
                                });
                              },
                              color: Colors.white70,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: Color(0xFF953D97),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'PEOPLE',
                          style: kCardHeaderStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          people.toString(),
                          style: kCardValueStyle,
                        ),
                        SizedBox(
                          height: 20.0,
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
                              color: Colors.white70,
                            ),
                            SizedBox(width: 40.0),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  people++;
                                });
                              },
                              color: Colors.white70,
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
                    color: Color(0xFF008A84),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              'SPLIT TAX/TIP',
                              style: kCardHeaderStyle,
                            ),
                            SizedBox(
                              height: 10.0,
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
                sub: num.parse(textArgs['sub']),
                tax: num.parse(textArgs['tax']),
                tipPercent: tip,
                people: people,
                splitType: splitSelection,
              );
              print('I was pressed');
              Navigator.pushNamed(context, '/results', arguments: {
                'tipTotal': calc.calculateTip(),
                'tax': calc.returnTax(),
                'taxTipPP': calc.taxTipPer(),
                'itemTotalPP': calc.itemTotalPer(),
                'totalPP': calc.totalPer(),
                'bill': calc.totalBill(),
              });
            },
            buttonTitle: 'HACK MY RECEIPT!',
          ),
        ],
      ),
    );
  }
}
