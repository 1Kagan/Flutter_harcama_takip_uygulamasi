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
              itemBuilder: (cix, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 3,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          '\$${islemlers[index].amount}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              islemlers[index].title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              DateFormat.yMMMMd("en_Us")
                                  .format(islemlers[index].date),
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            )
                          ])
                    ],
                  ),
                );
              },
              itemCount: islemlers.length),
    );
  }
}
