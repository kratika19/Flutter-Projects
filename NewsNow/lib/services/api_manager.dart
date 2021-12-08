import 'package:http/http.dart' as http;
import '../constants/strings.dart';

class ApiManager{

  void getNews()
  {
    var client = http.Client();
    client.get(StringConstants.url);
  }
}