import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting_app/modules/shared/meme_controller.dart';
import 'package:voting_app/modules/shared/screen_controller.dart';
import 'package:voting_app/modules/vote/screens/vote_screen.dart';
import 'modules/results/screens/result_screen.dart';

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
  final ScreenController screenController = Get.put(ScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBD1DB),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6778B),
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (screenController.isEnd.value) {
                  return ResultScreen();
                }
                return VoteScreen();
              }),
            ),
            Obx(() {
              if (screenController.isEnd.value) {
                return GestureDetector(
                  onTap: () {
                    screenController.isEnd(false);
                    Get.delete<MemeController>();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.replay),
                      Text('Restart'),
                    ],
                  ),
                );
              }
              return SizedBox();
            })
          ],
        ),
      ),
    );
  }
}
