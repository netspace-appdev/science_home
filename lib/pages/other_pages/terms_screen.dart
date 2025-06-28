import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:school_home/flutter_flow/backend/api_requests/api_constants.dart';

import '../../flutter_flow/flutter_flow_theme.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  late Future<TermsResponse> futureTerms;

  @override
  void initState() {
    super.initState();
    futureTerms = fetchTerms();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){},
      child:
      Container(
        height: MediaQuery.of(context).size.height * 0.9, // 90% of the screen height
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/bg.png',
            ).image,
          ),
        ),
        child: Scaffold(
          backgroundColor: FlutterFlowTheme.of(context).transparent,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).transparent,
            leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_outlined, color: Colors.black87,)),

            title: Text(
              'Terms & Condition',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Inter Tight',
                color: FlutterFlowTheme.of(context).primary,
                fontSize: 18.0,
                letterSpacing: 0.0,
              ),
            ),

            actions: [

              // Generated code for this Image Widget...
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SvgPicture.asset(
                  'assets/images/notification.svg',
                  width: 45,
                  height: 45,
                  fit: BoxFit.none,
                  color: Colors.black,

                ),
              )
            ],
            centerTitle: true,
            elevation: 0.0,

          ),

          body: FutureBuilder<TermsResponse>(
            future: futureTerms,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('❌ Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.termAndCondition.isEmpty) {
                return const Center(child: Text('No terms found.'));
              }

              final message = snapshot.data!.termAndCondition.first.message;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Text(
                  message.replaceAll(r'\r\n', '\n'),
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
              );
            },
          ),
        ),
      ),
    );

  }
  Future<TermsResponse> fetchTerms() async {
    final response = await http.post(
      Uri.parse(BaseURl.url+"Company-info"), // 🔁 Replace with your real URL
    );

    print("response.statusCode===>${response.statusCode}");
    print("response.body===>${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return TermsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Terms and Conditions');
    }
  }
}
class TermsResponse {
  final List<TermItem> termAndCondition;

  TermsResponse({required this.termAndCondition});

  factory TermsResponse.fromJson(Map<String, dynamic> json) {
    var list = json['term_and_condition'] as List;
    List<TermItem> terms = list.map((e) => TermItem.fromJson(e)).toList();

    return TermsResponse(termAndCondition: terms);
  }
}

class TermItem {
  final String message;

  TermItem({required this.message});

  factory TermItem.fromJson(Map<String, dynamic> json) {
    return TermItem(message: json['message']);
  }
}
