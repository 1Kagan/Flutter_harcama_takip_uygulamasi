import 'package:flutter/material.dart';
import './widgets/islemler_list.dart';
import '../widgets/new_islemler.dart';
import './models/islemler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harcama Uygulaması',
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
    islemler(
      id: 't1',
      title: 'Yeni Ayakkabı',
      amount: 69.99,
      date: DateTime.now(),
    ),
  ];

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

  void _startAddNewislemler(BuildContext cix) {
    showModalBottomSheet(
      context: cix,
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
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          title: Text('Harcama Kaydı'),
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
              Container(
                width: double.infinity,
                child: Card(
                  color: Color.fromARGB(255, 0, 0, 0),
                  child: Text('Kartlar!'),
                  elevation: 100,
                ),
              ),
              islemlerList(_userislemler)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          onPressed: () => _startAddNewislemler(context),
        ));
  }
}
