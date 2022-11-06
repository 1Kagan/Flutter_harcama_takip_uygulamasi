import 'package:flutter/material.dart';

class Newislemler extends StatefulWidget {
  final Function addix;

  Newislemler(this.addix);

  @override
  State<Newislemler> createState() => _NewislemlerState();
}

class _NewislemlerState extends State<Newislemler> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addix(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'İsim'),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Fiyat'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  Text('Tarih Seçimi Yapılmadı !'),
                  TextButton(
                    child: Text(
                      'Tarih Seçin',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            ElevatedButton(
              child: Text('İşlem Ekleyiniz !'),
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
