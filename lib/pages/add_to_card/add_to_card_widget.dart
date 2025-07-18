
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:school_home/flutter_flow/backend/app_state.dart';
import 'package:school_home/pages/add_to_card/AddToCartResponse.dart';
import 'package:school_home/pages/enquery_form/enquery_form_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../cotroller/price_controller.dart';
import '../../flutter_flow/backend/api_requests/api_calls.dart';
import '../../flutter_flow/backend/api_requests/api_constants.dart';
import '../constant.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_to_card_model.dart';
export 'add_to_card_model.dart';

class AddToCardWidget extends StatefulWidget {
  const AddToCardWidget({super.key});

  @override
  State<AddToCardWidget> createState() => _AddToCardWidgetState();
}

class _AddToCardWidgetState extends State<AddToCardWidget> {
  late AddToCardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  double totalMrp = 0.0;
  PriceController priceController=Get.put(PriceController());

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddToCardModel());
    getall_addtocart_list();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
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
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).transparent,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).transparent,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Cart',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter Tight',
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: _model.addToCartResponse?.data?.length==null || _model.addToCartResponse?.data?.length==0?SizedBox(
              child: Center(
                child: Column(
                  children: [
                    Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Lottie.asset(
                            'assets/lottie/cart.json',
                            repeat: false
                        )),
                    Text(
                    'No Items in the Cart',
                        style: TextStyle(
                      color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 20
                                  ),
                                  ),
                  ],
                ),),
            ):

            Stack(
              children: [
                // Scrollable content
                Positioned.fill(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 90), // Padding to avoid hiding behind total bar
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [


                          // Cart List
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _model.addToCartResponse?.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Card(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context).alternate,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child:  _model.addToCartResponse
                                              ?.data?[
                                          index].productThumimage!=
                                              null
                                              ? Image.network(
                                            // 'assets/images/football.png',
                                            BaseURl.basUrl+(_model.addToCartResponse?.data![index].productThumimage ?? ''),
                                            width: 69.0,
                                            height: 86.0,
                                            fit: BoxFit
                                                .fill,
                                          ):Image.asset(
                                            'assets/images/image_5-removebg-preview.png',
                                            width: 69.0,
                                            height: 86.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _model.addToCartResponse?.data?[index]?.title.toString()??'',
                                              //  'Premium cricket bats—hit your best runs with every swing',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Obx((){
                                              return Visibility(
                                                visible: priceController.showPriceModel.value!.data![0].status==0?false:true,
                                                maintainState: false,
                                                maintainSize: false,
                                                maintainAnimation: false,
                                                child: Text(
                                                  //'₹45 (-₹4.00 Tax)',
                                                  '₹ ${_model.addToCartResponse?.data?[index]?.priceMsp.toString()??''}',
                                                  style: FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                              );
                                            }),

                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Quantity :',
                                                      style:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      _model.addToCartResponse?.data?[index]?.quantity.toString()??'',
                                                      style:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                InkWell(
                                                  onTap: () {
                                                    _showLogoutDialog(context,index);
                                                  },
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 20),


                          // Title


                          Obx((){
                            return Visibility(
                              visible: priceController.showPriceModel.value!.data![0].status==0?false:true,
                              maintainState: false,
                              maintainSize: false,
                              maintainAnimation: false,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order Info',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Inter',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.red
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: _model.addToCartResponse?.data?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      final item = _model.addToCartResponse?.data?[index];
                                      final quantity = int.tryParse(item?.quantity.toString() ?? '0') ?? 0;
                                      final price = double.tryParse(item?.priceMsp.toString() ?? '0') ?? 0;
                                      final total = price * quantity;

                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${item?.title ?? ''}',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '₹${price.toStringAsFixed(2)} x $quantity',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                  ),
                                                ),
                                                Text(
                                                  '₹${total.toStringAsFixed(2)}',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(thickness: 0.5),
                                          ],
                                        ),
                                      );
                                    },
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '₹${totalMrp.toStringAsFixed(2)}',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'Inter',
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),

                // Fixed bottom bar
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: () async{


                      ///new code
                    //  final status = await requestFilePermission();
                     // print("status===here==>${status}");

                    //  if (status.isGranted) {
                        if ((_model.addToCartResponse?.data?.isNotEmpty ?? false)) {
                          _showBottomSheet(context, _model.addToCartResponse?.data, totalMrp);
                     //   }
                      }
                        //else if (status.isPermanentlyDenied) {
                        // Permission permanently denied, guide user to settings
                       // final opened = await openAppSettings();
                     //    if (!opened) {
                     //      ScaffoldMessenger.of(context).showSnackBar(
                     //        const SnackBar(
                     //          content: Text('Please enable file access permission from settings to download the estimation.'),
                     //        ),
                     //      );
                     // //   }
                     //  }
                     //    else {
                     //    // Denied but not permanently
                     //    ScaffoldMessenger.of(context).showSnackBar(
                     //      const SnackBar(
                     //        content: Text('File permission is required to download the estimation.'),
                     //      ),
                     //    );
                     //  }
                      /*final status = await requestFilePermission();
                      if (status.isPermanentlyDenied || status.isDenied) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Permission Required"),
                            content: Text("To save your estimation, please allow file access from Settings."),
                            actions: [
                              TextButton(
                                child: Text("Open Settings"),
                                onPressed: () {
                                  openAppSettings();
                                },
                              ),
                              TextButton(
                                child: Text("Cancel"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      }*/
                    },
                    child: Container(
                      height: 75,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Download Estimation',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),



          ),
        ),
      ),
    );
  }



/*  Future<void> downloadPDF(String url) async {
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

      final filePath = "${directory.path}/receipt.pdf";
      Dio dio = Dio();
      await dio.download(url, filePath);

      print("PDF downloaded to: $filePath");
      OpenFile.open(filePath);

      ToastMessage.msg("PDF downloaded successfully!");

    } catch (e) {
      print("Download error: $e");
      ToastMessage.msg("Failed to download PDF");
    }
  }*/



  void getall_addtocart_list() async{

    _model.isLoaderActive= false;
    setState(() {
    });
    _model.addToCartResponse = await BaseUrlGroup.getAddtocartApi.call(
      orderid: FFAppState().UserId
    );
    _model.isLoaderActive= true;
  //  counters = List.generate( _model.productList?.data?.length ?? 0, (index) => 1);
    // Calculate the overall MRP sum
    totalMrp = _model.addToCartResponse?.data
        ?.fold(0, (previousValue, element) => previousValue! + (element.itemtotal ?? 0)) ??
        0;

    final cartItems = _model.addToCartResponse?.data ?? [];
  totalMrp = cartItems.fold<double>(0.0, (sum, item) {
      final quantity = int.tryParse(item?.quantity.toString() ?? '0') ?? 0;
      final price = double.tryParse(item?.priceMsp.toString() ?? '0') ?? 0;
      return sum + (price * quantity);
    });
    setState(() {
    });
    print("totalMrp=====>${totalMrp}");
    priceController.showPriceApi();
  }

  void openAlertDialog() {

  }

  void _showLogoutDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        double _currentRating = 0.0; // Default rating value
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Are you sure,you want to Delete",
                  style: TextStyle(fontSize: 18.0),textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/4,
                      child: FFButtonWidget(
                        showLoadingIndicator: true,
                        onPressed: () async {
                          Helper.popScreen(context);
                        },
                        text: 'Cancel',
                        options: FFButtonOptions(
                          width: 150,
                          height: 37,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24, 0, 24, 0),
                          iconPadding:
                          EdgeInsetsDirectional.fromSTEB(
                              0, 0, 0, 0),
                          color: Colors.grey,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                            fontFamily: 'Readex Pro',
                            color:
                            FlutterFlowTheme.of(context)
                                .primaryBackground,
                            letterSpacing: 0,
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/4,
                      child: FFButtonWidget(
                        showLoadingIndicator: true,
                        onPressed: () async {

                          await BaseUrlGroup.deleteAddtocartApi.call(
                              orderid: FFAppState().UserId.toString(),
                            product_id: _model.addToCartResponse?.data?[index].productId.toString()??'',
                            id: _model.addToCartResponse?.data?[index].id.toString()??''
                          );
                          getall_addtocart_list();

                          Helper.popScreen(context);

                        },
                        text: 'Delete',
                        options: FFButtonOptions(
                          width: 150,
                          height: 37,
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          iconPadding:
                          EdgeInsetsDirectional.zero,
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).primaryBackground,
                            letterSpacing: 0,
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                  ],
                ),


              ],
            ),
          ),
        );
      },
    );
  }
  void _showBottomSheet(BuildContext context, List<Data>? data, double totalMrp) {
    showModalBottomSheet(
      isScrollControlled: true,  // Allows the bottom sheet to be scrollable with the keyboard
      backgroundColor: Colors.transparent,  // Transparent background for the bottom sheet
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            if (FocusScope.of(context).hasFocus) {
              FocusScope.of(context).unfocus();  // Unfocuses any active input field
            }
          },
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,  // Padding to avoid keyboard overlap
            child: DraggableScrollableSheet(
              initialChildSize: 0.5,  // The initial size of the bottom sheet as a percentage of the screen
              minChildSize: 0.4,      // The minimum size the bottom sheet can be
              maxChildSize: 0.5,      // The maximum size the bottom sheet can be
              expand: false,          // Avoids full expansion of the bottom sheet
              builder: (context, scrollController) {
                return EnquiryFormDialog(data,totalMrp);
              },
            ),
          ),
        );
      },
    ).then((value) {
      // Any actions to be taken after closing the bottom sheet
      setState(() {});
    });
  }

  /// Ask for the right “file” permission depending on the OS / API level.
  /// Returns the final PermissionStatus so you can check `.isGranted`.

///old working code
  ///
/*  Future<PermissionStatus> requestFilePermission() async {
    final prefs = await SharedPreferences.getInstance();
    final alreadyRequested = prefs.getBool('storage_permission_granted') ?? false;

    // ✅ Skip if already granted
    if (alreadyRequested) {
      print("✅ Storage permission already granted or handled.");
      return PermissionStatus.granted;
    }

    final deviceInfo = DeviceInfoPlugin();
    PermissionStatus status;

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      final sdkInt = androidInfo.version.sdkInt;

      // 🔒 Android 13+ (SDK 33+)
      if (sdkInt >= 33) {
        status = await Permission.manageExternalStorage.status;

        if (status.isDenied || status.isRestricted || status.isLimited) {
          status = await Permission.manageExternalStorage.request();
        }
      }
      // 📁 Android 11 & 12 (SDK 30–32)
      else if (sdkInt >= 30) {
        status = await Permission.manageExternalStorage.status;

        if (status.isDenied || status.isRestricted || status.isLimited) {
          status = await Permission.manageExternalStorage.request();
        }
      }
      // 📂 Android 6–10 (SDK 23–29)
      else {
        status = await Permission.storage.status;

        if (status.isDenied || status.isRestricted || status.isLimited || status.isPermanentlyDenied) {
          status = await Permission.storage.request();
        }
      }
    } else {
      // 🍎 iOS — not usually needed but here for completeness
      status = await Permission.photos.status;

      if (status.isDenied || status.isRestricted) {
        status = await Permission.photos.request();
      }
    }

    // ✅ Save granted status for next time
    if (status.isGranted) {
      await prefs.setBool('storage_permission_granted', true);
      print("✅ Storage permission granted and saved.");
    } else {
      print("❌ Storage permission denied: $status");
    }

    return status;
  }*/

///new code for making app live
/*
  Future<PermissionStatus> requestFilePermission() async {
    final prefs = await SharedPreferences.getInstance();
    final alreadyRequested = prefs.getBool('storage_permission_granted') ?? false;

    if (alreadyRequested) {
      print("✅ Storage permission already granted or handled.");
      return PermissionStatus.granted;
    }

    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    final sdkInt = androidInfo.version.sdkInt;

    PermissionStatus status;

    if (Platform.isAndroid) {
      if (sdkInt >= 33) {
        // Android 13+ (SDK 33+) — scoped storage enforced
        // PDF is not a media file => don't use Permission.photos
        // Optionally: Use SAF instead of requesting permission

        // Check if you really need MANAGE_EXTERNAL_STORAGE
        status = await Permission.manageExternalStorage.status;

        if (status.isDenied || status.isRestricted || status.isLimited) {
          status = await Permission.manageExternalStorage.request();
        }

      } else if (sdkInt >= 30) {
        // Android 11–12 (Scoped Storage still applies, but MANAGE_EXTERNAL_STORAGE allowed if declared)
        status = await Permission.manageExternalStorage.status;

        if (status.isDenied || status.isRestricted || status.isLimited) {
          status = await Permission.manageExternalStorage.request();
        }
      } else {
        // Android 6–10
        status = await Permission.storage.status;

        if (status.isDenied || status.isRestricted || status.isLimited) {
          status = await Permission.storage.request();
        }
      }
    } else {
      // iOS — Photos access is usually enough for media, PDFs require SAF-style access
      status = await Permission.photos.status;

      if (status.isDenied || status.isRestricted) {
        status = await Permission.photos.request();
      }
    }

    // Save result
    if (status.isGranted) {
      await prefs.setBool('storage_permission_granted', true);
      print("✅ Storage permission granted and saved.");
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      print("⚠️ Permission permanently denied. Prompting user to open settings.");
    } else {
      print("❌ Storage permission denied: $status");
    }

    return status;
  }
*/


}
