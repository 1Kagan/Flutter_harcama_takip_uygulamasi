import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/islemler.dart';

class Kart extends StatelessWidget {
  final List<islemler> recentTransactions;

  Kart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      // ignore: missing_return
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        var totalSum = 0.0;

        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.year == weekDay.year) {
            totalSum += recentTransactions[i].amount;
          }
        }
        print(DateFormat.E().format(weekDay));
        print(totalSum);

        return {
          'day': DateFormat.E().format(weekDay),
          'amount': totalSum,
        };
      },
    );
  }

  @override
  Widget build(BuildContext) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}