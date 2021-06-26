import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);
  Future getData() async {
    var temp = Uri.parse(url);
    http.Response response = await http.get(temp);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      var xx = response.statusCode;
      print('fucked up: $xx');
    }
  }
}
