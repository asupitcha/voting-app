import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:voting_app/config/constant.dart';
import 'package:voting_app/modules/shared/meme_controller.dart';

class TicketButton extends StatefulWidget {
  @override
  _TicketButtonState createState() => _TicketButtonState();
}

class _TicketButtonState extends State<TicketButton> {
  final MemeController memeController = Get.put(MemeController());
  bool clicked = false;
  int start = Constant.interval;
  Timer _timer;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Vote Ticket: ${memeController.tokens.value}',
          style: TextStyle(fontSize: 20),
        ),
        ElevatedButton(
          onPressed: () => !clicked
              ? setState(() {
                  memeController.tokens++;
                  clicked = true;
                  startTimer();
                })
              : null,
          child: !clicked ? Text('Collect Ticket') : Text('${start}s'),
          style: ElevatedButton.styleFrom(
              primary: !clicked ? Colors.red : Colors.grey),
        ),
      ],
    );
  }

  startTimer() {
    _timer = new Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start == 0) {
        _timer.cancel();
        if (mounted) {
          setState(() {
            memeController.tokens(0);
            clicked = false;
            start = Constant.interval;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            start--;
          });
        }
      }
    });
  }
}
