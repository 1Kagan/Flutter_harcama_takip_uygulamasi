import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/islemler.dart';

class islemlerList extends StatelessWidget {
  final List<islemler> islemlers;

  islemlerList(this.islemlers);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750,
      child: ListView.builder(
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
                        color: Color.fromARGB(255, 255, 60, 0),
                        width: 3,
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      '\$${islemlers[index].amount}',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
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
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMMd("en_Us")
                              .format(islemlers[index].date),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.grey,
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
