import 'dart:convert';

import 'package:get/get.dart';
import 'package:voting_app/modules/shared/meme_service.dart';
import 'package:voting_app/modules/vote/shared/meme_model.dart';

class MemeController extends GetxController {
  var memes = <Meme>[].obs;
  var isLoading = true.obs;
  var tokens = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getMemes();
  }

  void getMemes() {
    MemeService memeService = MemeService();
    memeService.getMemes().then((response) {
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        memes(ResponseBody.fromJson(result).data.memes);
        isLoading(false);
      }
    });
  }
}
