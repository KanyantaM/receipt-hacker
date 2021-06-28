import 'package:flutter/material.dart';
import 'package:receipt_splitathon/components/reusable_card.dart';
import 'package:receipt_splitathon/constants.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map resultArgs = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt Hacker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              color: Color(0xFF008A84),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('TOTAL PER PERSON', style: kResultHeaderStyle),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(resultArgs['totalPP'],
                              style: kResultHeaderStyle),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Column(
                        children: [
                          Text(
                            'TAX AND TIP',
                            style: kResultOtherInfo,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            resultArgs['taxTipPP'],
                            style: kResultOtherInfo,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Column(
                        children: [
                          Text(
                            'ITEM PRICE',
                            style: kResultOtherInfo,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            resultArgs['itemTotalPP'],
                            style: kResultOtherInfo,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: Colors.blueGrey,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'TOTAL BILL',
                            style: kResultOtherInfo,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            resultArgs['bill'],
                            style: kResultOtherInfo,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Column(
                        children: [
                          Text(
                            'TOTAL TIP',
                            style: kResultOtherInfo,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            resultArgs['tipTotal'],
                            style: kResultOtherInfo,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Column(
                        children: [
                          Text(
                            'TOTAL TAX',
                            style: kResultOtherInfo,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            resultArgs['tax'],
                            style: kResultOtherInfo,
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
    );
  }
}
