import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting_app/modules/shared/meme_controller.dart';
import 'package:voting_app/modules/vote/shared/meme_model.dart';

class MemeList extends StatelessWidget {
  final MemeController memeController = Get.put(MemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!memeController.isLoading.value) {
        return Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: memeController.memes.length,
            itemBuilder: (BuildContext context, int index) {
              final Meme meme = memeController.memes[index];
              return Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    leading: Image.network(meme.url),
                    trailing: ElevatedButton(
                      child: Text('Vote'),
                      onPressed: () {
                        if (memeController.tokens.value != 0) {
                          memeController.tokens--;
                          meme.count++;
                          memeController.update();
                        }
                      },
                    ),
                    title: Text('${meme.name}'),
                    subtitle: GetBuilder<MemeController>(
                      builder: (c) => Text(
                          '${meme.count > 0 ? meme.count : 'no'} vote${meme.count > 1 ? 's' : ''}'),
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
      return Text('Loading...');
    });
  }
}
