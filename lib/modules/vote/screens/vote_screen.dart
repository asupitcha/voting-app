import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:voting_app/config/constant.dart';
import 'package:voting_app/modules/shared/box_container.dart';
import 'package:voting_app/modules/shared/screen_controller.dart';
import 'package:voting_app/modules/vote/widgets/show_memes.dart';
import 'package:voting_app/modules/vote/widgets/ticket_button.dart';

class VoteScreen extends StatelessWidget {
  final ScreenController screenController = Get.put(ScreenController());

  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SlideCountdownClock(
              duration: Duration(minutes: Constant.campaignDuration),
              slideDirection: SlideDirection.Up,
              separator: ":",
              textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              onDone: () {
                screenController.isEnd(true);
              },
              tightLabel: true,
            ),
          ),
          TicketButton(),
          SizedBox(height: 15),
          MemeList(),
          SizedBox(height: 15)
        ],
      ),
    );
  }
}
