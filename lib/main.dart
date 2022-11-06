// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './widgets/islemler_list.dart';
import '../widgets/new_islemler.dart';
import './models/islemler.dart';
import '../widgets/kart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harcama Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.white,
        fontFamily: 'Quicsand',
        textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //String tittleinput;

  final List<islemler> _userislemler = [
    // islemler(
    //   id: 't1',
    //   title: 'Yeni Ayakkabı',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
  ];

  List<islemler> get _recentTransactions {
    return _userislemler.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewislemler(String ixtitle, double ixamount) {
    final newix = islemler(
      title: ixtitle,
      amount: ixamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userislemler.add(newix);
    });
  }

  void _startAddNewislemler(BuildContext tx) {
    showModalBottomSheet(
      context: tx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Newislemler(_addNewislemler),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Harcama Kaydı',
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewislemler(context),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Kart(_recentTransactions),

              // Container(
              //   width: double.infinity,
              //   child: Card(
              //     color: Colors.green,
              //     child: Text('Kartlar!'),
              //     elevation: 100,
              //   ),
              // ),
              islemlerList(_userislemler)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewislemler(context),
        ));
  }
}
