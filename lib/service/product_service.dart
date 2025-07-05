
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../flutter_flow/backend/api_requests/api_constants.dart';

class ProductService {


  static const String showPrice =BaseURl.url + 'show-price';






  static Future<Map<String, dynamic>> showPriceApi({

    String? zipcode,
    String? bankId,

  }) async {
    print("inside--->showPriceApi");
    final url = Uri.parse(showPrice);
    try {

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },

      );

      print("Status Code showPriceApi: ${response.statusCode}");
      print("Response Body showPriceApi: ${response.body}");



      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to submit application: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
      throw Exception('Error while submitting: $e');
    }
  }



}