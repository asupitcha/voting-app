import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:voting_app/modules/shared/box_container.dart';
import 'package:voting_app/modules/vote/screen/ticket_button.dart';

class VoteScreen extends StatelessWidget {
  Widget memeList() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            leading: Image.network(
                'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'),
            trailing: ElevatedButton(
              child: Text('Vote'),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SlideCountdownClock(
              duration: Duration(minutes: 5),
              slideDirection: SlideDirection.Up,
              separator: ":",
              textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              onDone: () {
                print('Done');
              },
              tightLabel: true,
            ),
          ),
          TicketButton(),
          SizedBox(height: 15),
          memeList(),
          SizedBox(height: 15)
        ],
      ),
    );
  }
}
