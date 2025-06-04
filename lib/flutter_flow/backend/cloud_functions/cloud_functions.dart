import 'dart:convert';

import 'package:http/http.dart' as http;
import '../api_requests/api_constants.dart';

Future<Map<String, dynamic>> makeCloudCallApis(
  String callName,
  Map<String, dynamic> input,
) async {
  String url = BaseURl.url + callName;
  var request = http.MultipartRequest('POST', Uri.parse(url));

  if (input is Map) {
    input.forEach((key, value) {
      request.fields[key] = value;
    });
  }
  request.fields[ApiConstantsKey.kcode] = '';
  print(' request parameter :- ${request.fields}');
  print(' url :- ${url}');
  var response = await request.send();

  final result = await http.Response.fromStream(response);
  print("status code===?${result.statusCode}");
  print("status body now===?${result.body}");
  if (result.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print(result.body);
    final jsonData = jsonDecode(result.body);
    print(' request response :- ${jsonData}');
    return jsonData;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print(result.body);
    throw Exception('Failed to create album.');
  }
}
