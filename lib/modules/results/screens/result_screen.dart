import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voting_app/modules/results/widgets/result_list.dart';
import 'package:voting_app/modules/shared/box_container.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              'Ranking',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 15),
          ResultList(),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
