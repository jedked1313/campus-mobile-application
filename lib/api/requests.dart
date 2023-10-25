import 'package:http/http.dart' as http;
import 'dart:convert';

class Requests {
  Future getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        return "Error ${response.statusCode}";
      }
    } catch (e) {
      return "Error Catch $e";
    }
  }

  postRequest(String url, Map data) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        return "Error ${response.statusCode}";
      }
    } catch (e) {
      return "Error Catch $e";
    }
  }
}
