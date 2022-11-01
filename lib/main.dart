import 'package:flutter/material.dart';
//Kağan Kılıç'ın ilk projesidir.
//başlangıç Tarihi:07.10.2022

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var questionIndex = 0;

  void answerQuestions() {
    questionIndex = questionIndex + 1;
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'En sevdiğin renk nedir?',
      'En sevdiğin hayvan nedir?',
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Text(
        'Benim İlk Uygulamam',
      )),
      body: Column(
        children: [
          Text(
            questions[questionIndex],
          ),
          ElevatedButton(
            child: Text('Cevap 1'),
            onPressed: answerQuestions,
          ),
          ElevatedButton(
            child: Text('Cevap 2'),
            onPressed: () => print('Cevap 2 Seçildi'),
          ),
          ElevatedButton(
            child: Text('Cevap 3'),
            onPressed: () => print('Cevap 3 Seçildi'),
          ),
        ],
      ),
    ));
  }
}
