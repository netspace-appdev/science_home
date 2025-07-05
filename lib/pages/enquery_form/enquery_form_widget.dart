import 'dart:io';

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
          //  Navigator.of(context).pop();
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

  Future<void> downloadPDF(String url, est_id) async {
    print("downloadPDF==>");
    try {
      // Request storage permission
      var status = await Permission.storage.request();

      print("status ==> $status");
      if (!status.isGranted) {
        print("Storage permission denied");
        ToastMessage.msg("Storage permission denied!");
        return;
      }

      // Determine the directory
      Directory? directory;
      if (Platform.isAndroid) {
        // Try to get the public Downloads directory
        directory = Directory("/storage/emulated/0/Download");

        // If it doesn't exist or can't be accessed, fallback
        if (!await directory.exists()) {
          print("Downloads folder not found. Falling back.");
          directory = await getExternalStorageDirectory();
        }
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      if (directory == null) {
        throw Exception("Unable to find a suitable directory to save file.");
      }

      final filePath = "${directory.path}/${est_id}.pdf";
      Dio dio = Dio();
      await dio.download(url, filePath);

      print("PDF downloaded to: $filePath");
      OpenFile.open(filePath);

      ToastMessage.msg("PDF downloaded successfully!");

    } catch (e) {
      print("Download error: $e");
      ToastMessage.msg("Failed to download PDF");
    }
  }


  Future<void> generatePDF(
      String estimationId,
      List<Map<String, dynamic>> products,
      BuildContext context,
      String mobileNumber,
      String name,
      String city,
      ) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);

    final int totalQuantity = products.fold<int>(0, (sum, product) => sum + product['quantity'] as int);
    final totalAmount = products.fold(0.0, (sum, product) => sum + (product['quantity'] * product['product_price']));
    final double gstRate = 0.18;
    final double cgstRate = 0.09;
    final double sgstRate = 0.09;
    final double gstAmount = products.fold(0.0, (sum, product) {
      final price = product['product_price'];
      final qty = product['quantity'];
      return sum + ((price * qty) * gstRate);
    });
    final double finalAmountWithGST = totalAmount + gstAmount;
    final amountInWords = NumberToWord().convert('en-in', finalAmountWithGST.round()).toUpperCase();

    final pdf = pw.Document();

    final logo = pw.MemoryImage(
      (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List(),
    );
    final stamp = pw.MemoryImage(
      (await rootBundle.load('assets/images/stamp.png')).buffer.asUint8List(),
    );
    var baseTextStyle = pw.TextStyle(fontSize: 9);
    var headerTextStyle = pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold, );
    var boldTextStyle = pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold);
    var titleTextStyle = pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold);

    pdf.addPage(
      pw.Page(
       // pageFormat: PdfPageFormat.a4,
        pageFormat: PdfPageFormat(8.26 * PdfPageFormat.inch, 11.69 * PdfPageFormat.inch),
        // margin: pw.EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        margin: pw.EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header Section with Logo and Company Info
            /*  pw.Container(
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black, width: 1),
                ),
                child: pw.Row(
                  children: [
                    // Logo Section
                    pw.Container(
                      width: 100,
                      height: 100,
                      padding: pw.EdgeInsets.all(8),
                      child: pw.Image(logo, fit: pw.BoxFit.contain),
                    ),
                    // Company Info Section
                    pw.Expanded(
                      child: pw.Container(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Text('SCIENCE HOME', style: titleTextStyle),
                            pw.SizedBox(height: 2),
                            //pw.Text('LAB INSTRUMENT CHEMICALS,GLASS,SPORTS,GREEN/WHITE, BOARD,DRINKING MODELS,FIRE EXTINGUISHER,STATIONARY,LAB/SCHOOL FURNITURE,SMART CLASS,ELECTRONICS,& GENERAL', style: headerTextStyle,textAlign: pw.TextAlign.justify),
                            pw.Text('LAB INSTRUMENT CHEMICALS,GLASS,SPORTS,GREEN/WHITE', style: headerTextStyle,textAlign: pw.TextAlign.center),
                            pw.Text('BOARD,DRINKING MODELS,FIRE EXTINGUISHER,STATIONARY,LAB', style: headerTextStyle, textAlign: pw.TextAlign.center),
                            pw.Text('/SCHOOL FURNITURE,SMART CLASS,ELECTRONICS,& GENERAL', style: headerTextStyle,textAlign: pw.TextAlign.center),
                            pw.Text('222,SHRI BALAJI TOWER,214 KHAJURI BAJAR , BIHAIND RAJWADA,', style: headerTextStyle,textAlign: pw.TextAlign.center),
                            pw.Text('INDORE (MP) - 452001', style: headerTextStyle,textAlign: pw.TextAlign.center),
                            pw.SizedBox(height: 2),
                            pw.Text('Email : SCIENCE_HOME@YAHOO.IN', style: headerTextStyle,textAlign: pw.TextAlign.center),
                            pw.Text('GSTIN : 23AZIPN8778K1ZL        STATE CODE : 23 - MP', style: headerTextStyle,textAlign: pw.TextAlign.center),
                           // pw.Text('MOB : 9111424922', style: headerTextStyle,textAlign: pw.TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                    // Mobile Number Section
                    pw.Container(
                      width: 100,
                      padding: pw.EdgeInsets.all(8),
                      decoration: pw.BoxDecoration(
                        //border: pw.Border(left: pw.BorderSide(color: PdfColors.black, width: 1)),
                      ),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.Text('MOB: 9111424922', style: boldTextStyle),
                          //pw.Text("9111424922", style: boldTextStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),*/

              pw.Container(
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black, width: 1),
                ),
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start, // Ensure top alignment
                  children: [
                    // Logo Section
                    pw.Container(
                      width: 100,
                      height: 100,
                      padding: pw.EdgeInsets.all(8),
                      child: pw.Image(logo, fit: pw.BoxFit.contain),
                    ),

                    // Company Info Section
                    pw.Expanded(
                      child: pw.Container(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Text('SCIENCE HOME', style: titleTextStyle),
                            pw.SizedBox(height: 2),
                            pw.Text('LAB INSTRUMENT CHEMICALS,GLASS,SPORTS,GREEN/WHITE', style: headerTextStyle, textAlign: pw.TextAlign.justify),
                            pw.Text('BOARD,DRINKING MODELS,FIRE EXTINGUISHER,STATIONARY,LAB', style: headerTextStyle, textAlign: pw.TextAlign.justify),
                            pw.Text('/SCHOOL FURNITURE,SMART CLASS,ELECTRONICS,& GENERAL', style: headerTextStyle, textAlign: pw.TextAlign.justify),
                            pw.Text('222,SHRI BALAJI TOWER,214 KHAJURI BAJAR , BIHAIND RAJWADA,', style: headerTextStyle, textAlign: pw.TextAlign.center),
                            pw.Text('INDORE (MP) - 452001', style: headerTextStyle, textAlign: pw.TextAlign.center),
                            pw.SizedBox(height: 2),
                            pw.Text('Email : SCIENCE_HOME@YAHOO.IN', style: headerTextStyle, textAlign: pw.TextAlign.center),
                            pw.Text('GSTIN : 23AZIPN8778K1ZL        STATE CODE : 23 - MP', style: headerTextStyle, textAlign: pw.TextAlign.center),
                          ],
                        ),
                      ),
                    ),

                    // Mobile Number Section (Top-Right)
                    pw.Container(
                      width: 100,
                      padding: pw.EdgeInsets.all(8),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        mainAxisAlignment: pw.MainAxisAlignment.start, // Keep it at top
                        children: [
                          pw.Text('MOB: 9111424922', style: boldTextStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


              //   pw.SizedBox(height: 5),

              // Customer Details and Quotation Info
              pw.Container(
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  border: pw.Border(
                    left: pw.BorderSide(color: PdfColors.black, width: 1),
                    right: pw.BorderSide(color: PdfColors.black, width: 1),
                  ),
                ),
                child: pw.Row(
                  children: [
                    // Customer Details
                    pw.Expanded(
                      flex: 2,
                      child: pw.Container(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('TO ${name}', style: boldTextStyle),
                           // pw.Text(name, style: baseTextStyle),
                            pw.Text(city, style: baseTextStyle),
                            pw.Text('', style: baseTextStyle),
                          ],
                        ),
                      ),
                    ),
                    // Quotation Details
                    pw.Container(
                      width: 120,
                      padding: pw.EdgeInsets.all(8),
                      decoration: pw.BoxDecoration(
                        border: pw.Border(left: pw.BorderSide(color: PdfColors.black, width: 1)),
                      ),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('Quotation.', style: boldTextStyle),
                          pw.Text('No.  : $estimationId', style: baseTextStyle),
                          pw.Text('Date : $formattedDate', style: baseTextStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            //  pw.SizedBox(height: 5),

              // Product Table
              pw.Container(
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  border: pw.Border(
                    left: pw.BorderSide(color: PdfColors.black, width: 1),
                    right: pw.BorderSide(color: PdfColors.black, width: 1),
                  ),
                ),
                child: pw.Table(
                  border: pw.TableBorder.all(color: PdfColors.black, width: 0.5),
                  columnWidths: {
                    0: pw.FixedColumnWidth(25), // S.No
                    1: pw.FlexColumnWidth(3),   // Description
                    2: pw.FixedColumnWidth(60), // Make

                    3: pw.FixedColumnWidth(50), // Quantity
                    4: pw.FixedColumnWidth(45), // Rate

                    5: pw.FixedColumnWidth(35), // GST %
                    6: pw.FixedColumnWidth(55), // Amount
                  },
                  children: [
                    // Header Row
                    pw.TableRow(
                      children: [
                        pw.Container(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text('S.\nNo', style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold), textAlign: pw.TextAlign.center),
                        ),
                        pw.Container(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text('Description', style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold), textAlign: pw.TextAlign.center),
                        ),
                        pw.Container(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text('Category', style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold), textAlign: pw.TextAlign.center),
                        ),

                        pw.Container(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text('Quantity', style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold), textAlign: pw.TextAlign.center),
                        ),
                        pw.Container(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text('Rate', style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold), textAlign: pw.TextAlign.center),
                        ),

                        pw.Container(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text('GST\n%', style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold), textAlign: pw.TextAlign.center),
                        ),
                        pw.Container(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text('Amount', style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold), textAlign: pw.TextAlign.center),
                        ),
                      ],
                    ),
                    // Product Rows
                    ...products.asMap().entries.map((entry) {
                      int index = entry.key;
                      var product = entry.value;
                      return pw.TableRow(
                        children: [
                          pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Text('${index + 1}', style: pw.TextStyle(fontSize: 8), textAlign: pw.TextAlign.center),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Text(product['product_name'], style: pw.TextStyle(fontSize: 8)),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Text(product['category_name'].toString().toUpperCase(), style: pw.TextStyle(fontSize: 8), textAlign: pw.TextAlign.center),
                          ),

                          pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Text('${product['quantity']}.00 PCS', style: pw.TextStyle(fontSize: 8), textAlign: pw.TextAlign.center),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Text('${product['product_price'].toStringAsFixed(2)}', style: pw.TextStyle(fontSize: 8), textAlign: pw.TextAlign.right),
                          ),

                          pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Text('18', style: pw.TextStyle(fontSize: 8), textAlign: pw.TextAlign.center),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Text('${(product['quantity'] * product['product_price']).toStringAsFixed(2)}', style: pw.TextStyle(fontSize: 8), textAlign: pw.TextAlign.right),
                          ),
                        ],
                      );
                    }).toList(),
                    // Sub Total Row
                    pw.TableRow(
                      children: [
                        pw.Container(padding: pw.EdgeInsets.all(4)),
                        pw.Container(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text('Sub Total', style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
                        ),
                        pw.Container(padding: pw.EdgeInsets.all(4)),
                        //pw.Container(padding: pw.EdgeInsets.all(4)),
                        pw.Container(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text('${totalQuantity.toStringAsFixed(2)}', style: pw.TextStyle(fontSize: 8), textAlign: pw.TextAlign.center),
                        ),
                        pw.Container(padding: pw.EdgeInsets.all(4)),
                      //  pw.Container(padding: pw.EdgeInsets.all(4)),
                        pw.Container(padding: pw.EdgeInsets.all(4)),
                        pw.Container(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text('${totalAmount.toStringAsFixed(2)}', style: pw.TextStyle(fontSize: 8), textAlign: pw.TextAlign.right),
                        ),
                      ],
                    ),
                    // CGST Row
                    pw.TableRow(
                      children: [
                        pw.Container(padding: pw.EdgeInsets.all(4)),
                        pw.Container(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text('GST 18% (ADD)', style: pw.TextStyle(fontSize: 8)),
                        ),
                        pw.Container(padding: pw.EdgeInsets.all(4)),
                        //pw.Container(padding: pw.EdgeInsets.all(4)),
                        pw.Container(padding: pw.EdgeInsets.all(4)),
                        pw.Container(padding: pw.EdgeInsets.all(4)),
                        //pw.Container(padding: pw.EdgeInsets.all(4)),
                        pw.Container(padding: pw.EdgeInsets.all(4)),
                        pw.Container(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text('${(gstAmount).toStringAsFixed(2)}', style: pw.TextStyle(fontSize: 8), textAlign: pw.TextAlign.right),
                        ),
                      ],
                    ),

                  ],
                ),
              ),

            //  pw.SizedBox(height: 5),

              // Grand Total Section
              pw.Container(
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  border: pw.Border(
                    left: pw.BorderSide(color: PdfColors.black, width: 1),
                    right: pw.BorderSide(color: PdfColors.black, width: 1),
                    bottom: pw.BorderSide(color: PdfColors.black, width: 1),
                  ),
                ),
                padding: pw.EdgeInsets.all(8),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('In Words : RUPEES $amountInWords ONLY', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold)),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text('G. Total', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text('${finalAmountWithGST.toStringAsFixed(2)}', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),

              //pw.SizedBox(height: 5),

              // Footer Section
              pw.Container(
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  border: pw.Border(
                    left: pw.BorderSide(color: PdfColors.black, width: 1),
                    right: pw.BorderSide(color: PdfColors.black, width: 1),
                    bottom: pw.BorderSide(color: PdfColors.black, width: 1),
                  ),
                ),
                padding: pw.EdgeInsets.all(8),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Subject To INDORE Jurisdiction', style: pw.TextStyle(fontSize: 8)),
                        pw.Text("For : SCIENCE HOME", style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
                      ],
                    ),


                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text("", style: baseTextStyle),
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: [
                            pw.Container(
                              width: 50,
                              height: 50,


                            ),
                            pw.Text("Customer's Signatory", style: baseTextStyle),
                          ],
                        ),
                      //  pw.Text("Customer's Signatory", style: baseTextStyle),
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: [
                            pw.Container(
                              width: 50,
                              height: 50,

                              child: pw.Image(stamp, fit: pw.BoxFit.contain),
                            ),
                            pw.Text("Authorised Signatory", style: baseTextStyle),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );

    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/estimation_$estimationId.pdf';
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      print('PDF generated at: $filePath');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('PDF saved at $filePath')));
      OpenFile.open(filePath);
    } catch (e) {
      print('Error saving PDF: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to generate PDF')));
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



