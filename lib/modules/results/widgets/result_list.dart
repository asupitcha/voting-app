import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:voting_app/modules/shared/meme_controller.dart';
import 'package:voting_app/modules/vote/shared/meme_model.dart';

class ResultList extends StatelessWidget {
  final MemeController memeController = Get.put(MemeController());
  int rank = 1;

  void sortedRank() {
    memeController.memes.sort((a, b) => b.count.compareTo(a.count));
  }

  int get totalVote {
    return memeController.memes
        .map((element) => element.count)
        .reduce((value, element) => value + element);
  }

  double getVotePercent(int count) {
    final double value = count / totalVote;
    return value.isNaN ? 0 : value;
  }

  int rankNumber(int index) {
    if (index == 0) {
      return rank;
    }
    return memeController.memes[index].count <
            memeController.memes[index - 1].count
        ? ++rank
        : rank;
  }

  @override
  Widget build(BuildContext context) {
    sortedRank();
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: memeController.memes.length,
        itemBuilder: (BuildContext context, int index) {
          final Meme meme = memeController.memes[index];
          return Column(
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                leading: Image.network(meme.url),
                title: Text('${meme.name}'),
                trailing: Text(
                  '${rankNumber(index)}',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: LinearPercentIndicator(
                  lineHeight: 12,
                  percent: getVotePercent(meme.count),
                  center: Text(
                    '${(getVotePercent(meme.count) * 100).toStringAsFixed(2)}%',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              )
            ],
          );
        },
      ),
    );
  }
}
