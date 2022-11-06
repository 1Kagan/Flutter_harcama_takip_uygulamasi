import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/islemler.dart';

class islemlerList extends StatelessWidget {
  final List<islemler> islemlers;

  islemlerList(this.islemlers);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: islemlers.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'Henüz herhangi bir işlem eklenmedi !',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 10),
                Container(
                  height: 130,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (tx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 33,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: FittedBox(
                              child: Text('\$${islemlers[index].amount}'))),
                    ),
                    title: Text(
                      islemlers[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle:
                        Text(DateFormat.yMMMd().format(islemlers[index].date)),
                  ),
                );
              },
              itemCount: islemlers.length),
    );
  }
}
