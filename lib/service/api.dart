import 'dart:convert';

import 'package:http/http.dart' as http;

sendRequest(String urlExtension) async {
  var response = await http
      .post(Uri.http('139.59.71.156:8000', "user/" + urlExtension), headers: {
    "Accept": "application/json",
    "content-type": "application/json",
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMGNkYjE5ZjAwNjkwZTMxOTcxYTZhNCIsImlhdCI6MTY0NjYyNTI2MSwiZXhwIjoxNjQ5MjE3MjYxfQ.c39dKT2OdFEuyp3bptWxXzI9m8Y_hf12c8L0XjeUmAA"
  });
  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    return null;
  }
}
