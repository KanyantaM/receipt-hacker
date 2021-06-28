import 'package:flutter/material.dart';
import 'package:receipt_splitathon/components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map resultArgs = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt Hacker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Results'),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: Colors.blue,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Total Owed Per Person:'),
                  Text(
                    resultArgs['totalPP'],
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
