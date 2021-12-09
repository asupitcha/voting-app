import 'package:flutter/material.dart';
import 'package:voting_app/modules/shared/box_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Voting Meme'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF79491),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6778B),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: BoxContainer()),
          ],
        ),
      ),
    );
  }
}
