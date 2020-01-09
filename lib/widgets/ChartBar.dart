import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double percentageAmount;
  ChartBar(this.label, this.amount, this.percentageAmount);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (cnx, consatrains) {
        return Column(children: <Widget>[
          Container( height: consatrains.maxHeight * 0.15,
              child: FittedBox(child: Text('\$${amount.toStringAsFixed(0)}'))),
          SizedBox(
            height: consatrains.maxHeight * 0.05,
          ),
          Container(
            height: consatrains.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(1, 220, 220, 220)),
                ),
                FractionallySizedBox(
                  heightFactor: percentageAmount,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(height: consatrains.maxHeight * 0.15,child: FittedBox(child: Text(label))),
        ]);
      },
    );
  }
}
