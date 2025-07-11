import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:school_home/flutter_flow/backend/app_state.dart';
import 'package:school_home/flutter_flow/flutter_flow_util.dart';
import 'package:school_home/flutter_flow/flutter_flow_widgets.dart';
import 'package:school_home/pages/add_to_card/AddToCartResponse.dart';
import 'package:http/http.dart' as http;
import 'package:school_home/pages/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../flutter_flow/backend/api_requests/api_constants.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;


import 'dart:typed_data';
import 'package:flutter/material.dart';

import '../add_to_card/GenEstiamateModel.dart' as est;

class EnquiryFormDialog extends StatefulWidget {
  List<Data>? data;
  double totalmrp;

   EnquiryFormDialog(
      this.data,this.totalmrp,{super.key});

  @override
  State<EnquiryFormDialog> createState() => _EnquiryFormDialogState();
}

class _EnquiryFormDialogState extends State<EnquiryFormDialog> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? words;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: FlutterFlowTheme.of(context).secondaryBackground,

      ),

      height: MediaQuery.of(context).size.height * 0.9, // 90% of the screen height
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Generated code for this Row Widget...
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Enquiry Form',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        context.pop();
                      },
                      child: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24,
                      ),
                    ),
                  ].divide(SizedBox(width: 10)),
                ),

                SizedBox(height: 15),

                TextFormField(
                  controller: nameController,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                    hintText: 'Enter Your Name/ School Name',
                    hintStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  FlutterFlowTheme.of(context).primaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,

                    //SvgPicture('assetsimages/Search.svg')
                  ),
                  style: FlutterFlowTheme.of(context)
                      .bodyMedium
                      .override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
                  cursorColor:
                  FlutterFlowTheme.of(context).primaryText,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name/ School Name is required';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: mobileController,
                  maxLength: 10,
                  autofocus: false,
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                    hintText: 'Enter Mobile Number',
                    hintStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  FlutterFlowTheme.of(context).primaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    //SvgPicture('assetsimages/Search.svg')
                  ),
                  style: FlutterFlowTheme.of(context)
                      .bodyMedium
                      .override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
                  cursorColor:
                  FlutterFlowTheme.of(context).primaryText,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Mobile number is required';
                    }
                    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Enter a valid 10-digit mobile number';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: emailController,
                  autofocus: false,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                    hintText: 'Enter Your City',
                    hintStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  FlutterFlowTheme.of(context).primaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context)
                      .bodyMedium
                      .override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
                  cursorColor:
                  FlutterFlowTheme.of(context).primaryText,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'City is required';
                    }
                   /* if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return 'Enter a valid email address';
                    }*/
                    return null;
                  },
                ),

                SizedBox(height: 40),
                FFButtonWidget(
                  onPressed: () async {
                    // Collect form input
                   // generatePDF(FFAppState().UserId,[],context,'mobileNumber');
                     generate_estimation(context,widget.data);
                  },
                  text: 'SUBMIT',
                  options: FFButtonOptions(
                    width:double.infinity,
                    height: 45,
                    padding: EdgeInsetsDirectional.zero,
                    iconPadding: EdgeInsetsDirectional.zero,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context)
                        .titleSmall
                        .override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 14,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }
  void generate_estimation(BuildContext context, List<Data>? data) async{
    if (_formKey.currentState!.validate()) {
      String name = nameController.text.trim();
      String mobileNumber = mobileController.text.trim();
      String email = emailController.text.trim();

      // Convert `data` into the required format
      List<Map<String, dynamic>> products = data!.map((item) {
        return {
          "product_name": item.title.toString(),
          "product_id": item.productId,
          "product_price": int.parse(item.priceMsp.toString()??"0"),
          "quantity": item.quantity,
          "category_id": item.categoryId,
          "category_name": item.categoryname,
        };
      }).toList();

      // Build the request body
      Map<String, dynamic> requestBody = {
        "estimation_id": int.parse(FFAppState().UserId),
        // Update with dynamic value if needed
        "name": name,
        "mobile_number": mobileNumber,
        "email":email, //email,
        "products": products,
      };
      print("Request Data: ${jsonEncode(requestBody)}");

      // API endpoint
      String url =
          BaseURl.basUrl+"api/add-estimation";

      try {
        // Send POST request
        http.Response response = await http.post(
          Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(requestBody),
        );
        print("response Data: ${response.statusCode}");
        print("response Data: ${response.body}");
        if (response.statusCode == 200) {
          var responseBody = jsonDecode(response.body);
          // ✅ Parse into model
          est.GenEstiamateModel estimateModel = est.GenEstiamateModel.fromJson(responseBody);
          print("userId in API===>${FFAppState().UserId}");

        //  await generatePDF(estimateModel.data!.estimationId.toString(),products,context,estimateModel.data!.mobileNumber.toString(), estimateModel.data!.name.toString(),estimateModel.data!.city.toString());
          //pancode
          downloadPDF(estimateModel.url.toString(),estimateModel.data!.estimationId.toString() );
          //pancode end

          FFAppState().deleteUserId();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Submission Successful')),
          );

         context.pushNamed('HomePage');
        } else {
          // FFAppState().deleteUserId();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Failed to submit. Error: ${response.statusCode}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $e')),
        );
      }
    }

  }


/*  Future<void> downloadPDF(String url, String estId) async {
    print("📥 Starting PDF download...");

    try {
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      PermissionStatus status;

      // 🔐 Request appropriate permissions based on Android version
      if (androidInfo.version.sdkInt >= 33) {
        // Android 13+ requires media-specific permissions
        status = await Permission.mediaLibrary.request(); // Optional
        status = await Permission.photos.request(); // Works for PDF/media files
      } else {
        status = await Permission.storage.request();
      }

      if (!status.isGranted) {
        print("❌ Permission denied");
        ToastMessage.msg("Storage permission denied!");
        return;
      }

      // 📁 Determine the best directory
      Directory? directory;

      if (Platform.isAndroid) {
        directory = Directory("/storage/emulated/0/Download");

        if (!await directory.exists()) {
          print("⚠️ Downloads not available. Using app directory.");
          directory = await getExternalStorageDirectory();
        }
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      if (directory == null) {
        throw Exception("❌ Unable to find a valid directory to save the file.");
      }

      final filePath = "${directory.path}/$estId.pdf";

      print("📍 Saving to: $filePath");

      Dio dio = Dio();
      await dio.download(url, filePath);

      print("✅ PDF downloaded!");
      ToastMessage.msg("PDF downloaded successfully!");

      await OpenFile.open(filePath);
    } catch (e) {
      print("💥 Download error: $e");
      ToastMessage.msg("Failed to download PDF");
    }
  }*/

  Future<void> downloadPDF(String url, String estId) async {
    print("📥 Starting PDF download...");

    try {
      final prefs = await SharedPreferences.getInstance();
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      final sdkInt = androidInfo.version.sdkInt;

/*      PermissionStatus status;

      if (Platform.isAndroid) {
        // Android 13+ (SDK 33+)
        if (sdkInt >= 33) {
          status = await Permission.manageExternalStorage.status;
          if (status.isDenied || status.isRestricted || status.isLimited) {
            status = await Permission.manageExternalStorage.request();
          }
        }
        // Android 11–12
        else if (sdkInt >= 30) {
          status = await Permission.manageExternalStorage.status;
          if (status.isDenied || status.isRestricted || status.isLimited) {
            status = await Permission.manageExternalStorage.request();
          }
        }
        // Android 6–10
        else {
          status = await Permission.storage.status;
          if (status.isDenied || status.isRestricted || status.isLimited || status.isPermanentlyDenied) {
            status = await Permission.storage.request();
          }
        }
      } else {
        // iOS or other platforms
        status = await Permission.photos.status;
        if (status.isDenied || status.isRestricted) {
          status = await Permission.photos.request();
        }
      }

      // ✅ Check permission result
      print("📂 Storage Permission Status: $status");

      if (!status.isGranted) {
        if (status.isPermanentlyDenied) {
          openAppSettings();
          ToastMessage.msg("Please enable storage permission from settings.");
        } else {
          ToastMessage.msg("Storage permission denied!");
        }
        return;
      }

      // ✅ Save status
      await prefs.setBool('storage_permission_granted', true);*/

      // 📁 Get target directory
      Directory? directory;

      if (Platform.isAndroid) {
        directory = Directory("/storage/emulated/0/Download");

        if (!await directory.exists()) {
          print("⚠️ Downloads not available. Using external storage directory.");
          directory = await getExternalStorageDirectory();
        }
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      if (directory == null) {
        throw Exception("❌ Unable to find a valid directory to save the file.");
      }

      final filePath = "${directory.path}/$estId.pdf";
      print("📍 Saving to: $filePath");

      Dio dio = Dio();
      await dio.download(url, filePath);

      print("✅ PDF downloaded!");
      ToastMessage.msg("PDF downloaded successfully!");

      await OpenFile.open(filePath);
    } catch (e) {
      print("💥 Download error: $e");
      ToastMessage.msg("Failed to download PDF");
    }
  }





  String convertNumberToWords(int totalmrp) {
    // Use the package to convert the number to words
  //  return  NumberToWord().convert(AutofillHints.language, totalmrp).toUpperCase();
 //   return NumberToWord().convert(Language.EN, totalmrp).toUpperCase();
  //  return NumberToWords.convert(totalmrp, Language.EN).toUpperCase();

    return NumberToWord().convert('en', totalmrp).toUpperCase();

  }


}



