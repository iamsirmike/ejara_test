import 'dart:convert';

import 'package:http/http.dart' as http;

class CustomHttpClient {
  //perform post requests
  Future<http.Response> post(String url, Map<String, Object> body) async {
    return http.post(Uri.parse(url), body: jsonEncode(body));
  }

//perforn get requests
  Future<http.Response> get(String url) async {
    return http.get(Uri.parse(url));
  }

//check if response is successful
  bool isSuccessful(http.Response r) => r.statusCode >= 200 && r.statusCode < 400;

  //get response body and decode
  getResponseBody(http.Response response){
    try {
      return json.decode(response.body);
    } on FormatException catch(_){
      return response.body;
    }
  }
}
