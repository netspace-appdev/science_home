import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:school_home/flutter_flow/backend/app_state.dart';
import 'package:school_home/flutter_flow/flutter_flow_util.dart';
import 'package:school_home/flutter_flow/flutter_flow_widgets.dart';
import 'package:school_home/pages/add_to_card/AddToCartResponse.dart';
import 'package:http/http.dart' as http;
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
          "product_price": item.priceMrp,
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
          // await generatePDF(FFAppState().UserId,products,context,mobileNumber, name,email);
          await generatePDF(estimateModel.data!.estimationId.toString(),products,context,estimateModel.data!.mobileNumber.toString(), estimateModel.data!.name.toString(),estimateModel.data!.city.toString());
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

  /*Future<void> generatePDF(String estimationId, List<Map<String, dynamic>> products, BuildContext context, String mobileNumber) async {
    // Create a new PDF document
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    print("Formatted date: $formattedDate");
    // Calculate totals
    final int totalQuantity = products.fold<int>(0, (sum, product) => sum + product['quantity'] as int);
    final totalAmount = products.fold(0.0, (sum, product) => sum + (product['quantity'] * product['product_price']));
    // final amount_in_word= NumberToWord().convert('en-in', widget.totalmrp).toUpperCase();


    final double gstRate = 0.18;
    double gstAmount = products.fold(0.0, (sum, product) {
      final price = product['product_price'];
      final qty = product['quantity'];
      return sum + ((price * qty) * gstRate);
    });
    final double finalAmountWithGST = totalAmount + gstAmount;
    final amount_in_word = NumberToWord()
        .convert('en-in', finalAmountWithGST.round())
        .toUpperCase();
    print("Total MRP: $amount_in_word");
    final pdf = pw.Document();

    // Load the logo image
    final logo = pw.MemoryImage(
      (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List(),
    );

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            mainAxisSize: pw.MainAxisSize.max,
            mainAxisAlignment: pw.MainAxisAlignment.center,
           // crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'SCIENCE HOME',
                style: pw.TextStyle(
                  fontSize: 28,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.topRight,
                child: pw.Text('MOB: ${mobileNumber}', style: pw.TextStyle(fontSize: 10)),
              ),
              // Header with logo and contact details
              pw.Container(
                padding: const pw.EdgeInsets.all(0),
                child: pw.Row(
                  mainAxisSize: pw.MainAxisSize.max,
                 // mainAxisAlignment: pw.MainAxisAlignment.end,
                 // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Image(logo, width: 80, height: 80), // Add the logo
                        pw.SizedBox(width: 10),
                        pw.Column(
                          mainAxisSize: pw.MainAxisSize.max,
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              'LAB INSTRUMENT CHEMICALS,GLASS,SPORTS,GREEN/WHITE\nBOARD,WORKING MODELS,FIRE EXTINGUISHER,STATIONARY,LAB \n /SCHOOL FURNIYURE,SMART CLASS,ELECTRONICS,& GENERAL.',
                              style: pw.TextStyle(fontSize: 10),
                            ),
                            pw.Text(
                           ' 222,SHRI BALAJI TOWER,214 KHAJURI BAJAR , BIHAIND RAJWADA,\nINDORE (MP) - 452001',
                              style: pw.TextStyle(fontSize: 10),
                            ),
                            pw.SizedBox(height: 5 ),
                            pw.Text(
                              'Email : SCIENCE_HOME@YAHOO.IN',
                              style: pw.TextStyle(fontSize: 10),
                            ),
                            pw.Text(
                              'GSTIN : 23AZIPN8778K1ZL STATE CODE : 23 - MP',
                              style: pw.TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              pw.Divider(),

              // Quotation details
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('TO: THE PRINCIPAL', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
                      pw.Text('EKLAVYA MODEL SCHOOL', style: pw.TextStyle(fontSize: 12)),
                      pw.Text('Address: KUSHI DIST. DHAR MP', style: pw.TextStyle(fontSize: 12)),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('Quotation No: 72', style: pw.TextStyle(fontSize: 12)),
                      pw.Text('Date: ${formattedDate}', style: pw.TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 10),

              // Product Table with Footer
              pw.Table.fromTextArray(

                headers: [
                  'S.No', 'Description', 'Category Name', *//*'HSN',*//* 'Qty', 'Rate', *//*'Discount',*//* 'Tax', 'Amount'
                ],
                data: [
                  // Map product data into rows
                  ...products.map((product) {
                    return [
                      products.indexOf(product) + 1, // Serial number
                      product['product_name'], // Description
                      '', // Make (empty in this case)
                     *//* '', // HSN (empty in this case)*//*
                      product['quantity'], // Quantity
                      product['product_price'].toString(), // Rate
                     *//* '', // Discount (empty in this case)*//*
                      ((product['product_price'] * product['quantity']) * gstRate).toStringAsFixed(2), // Tax (empty in this case)
                      (product['quantity'] * product['product_price']).toStringAsFixed(2), // Amount
                    ];
                  }).toList(),
                  // Add footer row for totals
                  [
                    '', // Empty for S.No
                    'Total', // "Total" label
                    '', // Empty for Make
                    *//*'', // Empty for HSN*//*
                    totalQuantity.toString(), // Total quantity
                    '', // Empty for Rate
                    *//*'', // Empty for Discount*//*
                    gstAmount.toStringAsFixed(2), // Empty for Tax
                    totalAmount.toStringAsFixed(2), // Total amount
                  ],

                  [
                    '', // Empty for S.No
                    'Grand Total', // "Total" label
                    '', // Empty for Make
                    *//*'', // Empty for HSN*//*
                    "", // Total quantity
                    '', // Empty for Rate
                    *//*'', // Empty for Discount*//*
                    "", // Empty for Tax
                    (totalAmount + gstAmount).toStringAsFixed(2), // Total amount
                  ],
                ],
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
                cellStyle: pw.TextStyle(fontSize: 10),
                border: pw.TableBorder.all(color: PdfColors.black, width: 0.5),
              ),
              pw.SizedBox(height: 10),

              // Summary and footer
              // pw.Align(
              //   alignment: pw.Alignment.centerRight,
              //   child: pw.Column(
              //     crossAxisAlignment: pw.CrossAxisAlignment.end,
              //     children: [
              //       pw.Text('Sub Total: ₹ ${widget.totalmrp}', style: pw.TextStyle(fontSize: 12)),
              //       pw.Text('Tax (18%): ₹ 0.0', style: pw.TextStyle(fontSize: 12)),
              //       pw.Text('Round Off: ₹ 0.0', style: pw.TextStyle(fontSize: 12)),
              //       pw.Text('Grand Total: ₹ ${widget.totalmrp}', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
              //     ],
              //   ),
              // ),
              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text('For: SCIENCE HOME', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                children: [
                  // In Words Section
                  pw.Container(
                    alignment: pw.Alignment.centerLeft,
                    padding: const pw.EdgeInsets.symmetric(vertical: 5),
                    child: pw.Text(
                      'In Words : RUPEES ${amount_in_word} ONLY',
                      style: pw.TextStyle(fontSize: 14,
                      fontWeight: pw.FontWeight.normal),
                    ),
                  ),
                  pw.Divider(), // Divider line

                  // Subject to Jurisdiction Note
                  pw.Container(
                    alignment: pw.Alignment.centerLeft,
                    padding: const pw.EdgeInsets.symmetric(vertical: 5),
                    child: pw.Text(
                      'Subject to INDORE Jurisdiction',
                      style: pw.TextStyle(fontSize: 10),
                    ),
                  ),

                  // Signature Section
                  pw.SizedBox(height: 30),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        "Customer's Signatory",
                        style: pw.TextStyle(fontSize: 10),
                      ),
                      pw.Text(
                        'Authorized Signatory',
                        style: pw.TextStyle(fontSize: 10),
                      ),
                    ],
                  ),

                  pw.SizedBox(height: 20), // Add spacing

                  // Footer Total
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        '',
                        style: pw.TextStyle(fontSize: 12), // Empty for alignment
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Text(
                            'G. Total: ₹ ${widget.totalmrp}',
                            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
                          ),
                          pw.Text(
                            'For : SCIENCE HOME',
                            style: pw.TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

            ],
          );
        },
      ),
    );


    // Save the PDF file locally
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/estimation_$estimationId.pdf';

      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      print('PDF generated at: $filePath');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF saved at $filePath')),
      );

      // Optionally, open the PDF
      OpenFile.open(filePath);
    } catch (e) {
      print('Error saving PDF: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to generate PDF')),
      );
    }
  }*/

  ///new code
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

    const baseTextStyle = pw.TextStyle(fontSize: 10);
    const headerColor = PdfColors.grey300;
    const lightBorder = pw.BorderSide(color: PdfColors.grey500, width: 0.5);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Container(

            margin: pw.EdgeInsets.only(top: 5, left: 16, right: 16, bottom: 16), // Minimal top margin
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header Section
                pw.Container(
                  color: headerColor,
                  padding: pw.EdgeInsets.all(10),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [

                          pw.Image(logo, width: 60, height: 60),
                          pw.SizedBox(width: 10),
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('SCIENCE HOME', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
                              pw.Text('LAB INSTRUMENTS | CHEMICALS | STATIONERY', style: baseTextStyle),
                              pw.Text('222, Shri Balaji Tower, Khajuri Bajar, Indore (MP) - 452001', style: baseTextStyle),
                              pw.Text('MOB: $mobileNumber | GSTIN: 23AZIPN8778K1ZL | Email: science_home@yahoo.in', style: baseTextStyle),
                            ],
                          ),
                        ],
                      ),
                    //  pw.Text('MOB: $mobileNumber', style: baseTextStyle),
                    ],
                  ),
                ),
                pw.SizedBox(height: 10),

                // Quotation Info
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('TO: The Principal', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
                        pw.Text(name, style: baseTextStyle),
                        pw.Text('Address: $city', style: baseTextStyle),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text('Quotation No: ${estimationId}', style: baseTextStyle),
                        pw.Text('Date: $formattedDate', style: baseTextStyle),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),

                // Product Table
                pw.TableHelper.fromTextArray(
                  headers: ['S.No', 'Description', 'Category', 'Qty', 'Rate', 'Tax', 'Amount'],
                  data: products
                      .asMap()
                      .entries
                      .map((entry) {
                    int index = entry.key;
                    var product = entry.value;
                    return [
                      '${index + 1}',
                      product['product_name'],
                      product['category_name'],
                      '${product['quantity']}',
                      product['product_price'].toStringAsFixed(2),
                      ((product['product_price'] * product['quantity']) * gstRate).toStringAsFixed(2),
                      (product['quantity'] * product['product_price']).toStringAsFixed(2),
                    ];
                  })
                      .toList()
                    ..addAll([
                      ['', 'Total', '', '$totalQuantity', '', gstAmount.toStringAsFixed(2), totalAmount.toStringAsFixed(2)],
                      ['', 'Grand Total', '', '', '', '', finalAmountWithGST.toStringAsFixed(2)],
                    ]),
                  border: pw.TableBorder.all(color: PdfColors.grey600, width: 0.5),
                  headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
                  cellStyle: baseTextStyle,
                  rowDecoration: pw.BoxDecoration(color: PdfColors.grey100),
                  oddRowDecoration: pw.BoxDecoration(color: PdfColors.white),
                ),
                pw.SizedBox(height: 20),

                // Amount in Words
                pw.Text('In Words: RUPEES $amountInWords ONLY', style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 10),

                pw.Text('Subject to INDORE Jurisdiction', style: pw.TextStyle(fontSize: 9, color: PdfColors.grey600)),

                pw.SizedBox(height: 30),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Customer's Signatory", style: baseTextStyle),
                    pw.Text("Authorized Signatory", style: baseTextStyle),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Align(
                  alignment: pw.Alignment.centerRight,
                  child: pw.Text('For: SCIENCE HOME', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
                ),
              ],
            ),
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



