import 'dart:io';

import "package:http/http.dart";
import "package:ai4e_mobileapp/utils/CustomSP.dart";
import "dart:convert";

Future<String> generateToken() async {
  var token = await CustomSP.getString("tokenDialog");
  if (token == null) {
    token = (await get(
            "https://us-central1-ainlp-249715.cloudfunctions.net/dialogmessage/token"))
        .body;
  }
  return token;
}

Future<String> getAnwser(String message) async {
  var token = await generateToken();
  Response response = await post(
      "https://asia-east2-ainlp-249715.cloudfunctions.net/dialogmessage/send",
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode({'session': '$token', 'message': '$message'}));
  if (response.statusCode == 200) {
  
    return json.decode(response.body)["response"];
  }
  return "";
}
