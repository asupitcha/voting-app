import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:voting_app/config/config.dart';

class MemeService {
  Future<Response> getMemes() {
    Uri uri = Uri.https(baseUrl, ApiUrl.meme);
    return http.get(uri);
  }
}
