import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TicketButton extends StatefulWidget {
  @override
  _TicketButtonState createState() => _TicketButtonState();
}

class _TicketButtonState extends State<TicketButton> {
  bool clicked = false;
  int start = 10;
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => !clicked
          ? setState(() {
              clicked = true;
              startTimer();
            })
          : null,
      child: !clicked ? Text('Collect Ticket') : Text('${start}s'),
      style: ElevatedButton.styleFrom(
          primary: !clicked ? Colors.red : Colors.grey),
    );
  }

  startTimer() {
    _timer = new Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start == 0) {
        _timer.cancel();
        setState(() {
          clicked = false;
          start = 60;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }
}
