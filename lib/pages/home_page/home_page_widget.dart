import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:school_home/cotroller/price_controller.dart';
import 'package:school_home/flutter_flow/backend/app_state.dart';
import 'package:school_home/pages/AllProduct/AllProductModel.dart';
import 'package:school_home/pages/SlideBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../flutter_flow/backend/api_requests/api_calls.dart';
import '../../flutter_flow/backend/api_requests/api_constants.dart';
import '../constant.dart';
import '../product_detail/product_detail_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math; // Import math for pi
import 'home_page_model.dart';
export 'home_page_model.dart';
import 'package:http/http.dart' as http;

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<ProductData> filteredCategories = [];
  int? index_val;
  List<int> counters = []; // List to store counters for each item
  PriceController priceController=Get.put(PriceController());
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textController?.addListener(_filterCategories);
    print('userID......${FFAppState().UserId}');

    updateToken();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('📥 Foreground Message: ${message.notification?.title}');
      _showImageNotification(message);
      // You can show a snackbar or local notification here
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('🔁 App opened via notification tap');
      _showImageNotification(message);
      // Navigate or show something specific
    });
    apiCallHomepages();

  }
///noti image
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> _showImageNotification(RemoteMessage message) async {
    final String? title = message.data['title'];
    final String? body = message.data['body'];
    final String? imageUrl = message.data['image'];

    BigPictureStyleInformation? styleInformation;

    if (imageUrl != null && imageUrl.isNotEmpty) {
      try {
        final http.Response response = await http.get(Uri.parse(imageUrl));
        if (response.statusCode == 200) {
          final ByteArrayAndroidBitmap bigPicture =
          ByteArrayAndroidBitmap.fromBase64String(
            base64Encode(response.bodyBytes),
          );

          styleInformation = BigPictureStyleInformation(
            bigPicture,
            largeIcon: null,
            contentTitle: title,
            summaryText: body,
          );
        }
      } catch (e) {
        print("Failed to load image for notification: $e");
      }
    }

    final AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.high,
      priority: Priority.high,
      styleInformation: styleInformation,
    );

    final NotificationDetails platformDetails =
    NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformDetails,
    );
  }
  ///end



  ///working code

  /*Future<void> checkAndRequestStoragePermission() async {
    final prefs = await SharedPreferences.getInstance();

    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    final sdkInt = androidInfo.version.sdkInt;

    PermissionStatus status;

    if (Platform.isAndroid) {
      // Android 13+ → manageExternalStorage or documents (if supported)
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
        if (status.isDenied || status.isRestricted || status.isLimited) {
          status = await Permission.storage.request();
        }
      }
    } else {
      // For iOS or other platforms
      status = await Permission.photos.status;
      if (status.isDenied || status.isRestricted) {
        status = await Permission.photos.request();
      }
    }

    // ✅ Handle outcomes
    print("📂 Storage Permission Status: $status");

    if (status.isGranted) {
      await prefs.setBool('storage_permission_granted', true);
      ToastMessage.msg("Storage permission granted.");
    } else if (status.isPermanentlyDenied) {
      openAppSettings(); // Take user to settings
      ToastMessage.msg("Please enable storage permission from settings.");
    } else {
      ToastMessage.msg("Storage permission denied.");
    }
  }*/

  ///experiment for making app live
  Future<void> checkAndRequestStoragePermission() async {
    final prefs = await SharedPreferences.getInstance();
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    final sdkInt = androidInfo.version.sdkInt;

    PermissionStatus status;

    if (Platform.isAndroid) {
      if (sdkInt >= 33) {
        status = await Permission.photos.status;
        if (status.isDenied || status.isRestricted || status.isLimited) {
          status = await Permission.photos.request();
        }
      } else if (sdkInt >= 30) {
        status = await Permission.storage.status;
        if (status.isDenied || status.isRestricted || status.isLimited) {
          status = await Permission.storage.request();
        }
      } else {
        status = await Permission.storage.status;
        if (status.isDenied || status.isRestricted || status.isLimited) {
          status = await Permission.storage.request();
        }
      }
    } else {
      status = await Permission.photos.status;
      if (status.isDenied || status.isRestricted) {
        status = await Permission.photos.request();
      }
    }

    print("📂 Storage Permission Status: $status");

    if (status.isGranted) {
      await prefs.setBool('storage_permission_granted', true);
      ToastMessage.msg("Storage permission granted.");
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      ToastMessage.msg("Please enable storage permission from settings.");
    } else {
      ToastMessage.msg("Storage permission denied.");
    }
  }




  // Method to filter categories based on input
  void _filterCategories() {
    final query = _model.textController.text.toLowerCase();
    setState(() {
      filteredCategories = _model.productList!.data!
          .where((category) =>
              category.productTitle!.toLowerCase().contains(query))
          .toList();
    });
  }

  void apiCallHomepages() async {
    setState(() {});
    _model.isLoaderActive = false;
    _model.homepageresponse = await BaseUrlGroup.categorylist.call();
    _model.bannerModelResponse = await BaseUrlGroup.bannerApiList.call();
    _model.productList = await BaseUrlGroup.letestProductListApi.call();
    setState(() {});
    setState(() {
      filteredCategories = _model.productList?.data ?? [];
      counters = List.generate(filteredCategories?.length ?? 0, (index) => 1);

    });
    _model.isLoaderActive = true;
    print('userID......${FFAppState().UserId}');

    priceController.showPriceApi();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAndRequestStoragePermission();
    });

    setState(() {});
  }

  void get_initiated_add_to_card() async {
  //  setState(() {});
    _model.isLoaderActive = false;
    _model.generateOrderId = await BaseUrlGroup.initiated_add_to_card.call();
 //   setState(() {});
    setState(() {
     // filteredCategories = _model.productList?.data ?? [];
      FFAppState().UserId=_model.generateOrderId?.orderid??'';
      print('userID......${FFAppState().UserId}');
      call_add_to_cart(index_val!);
    });
    _model.isLoaderActive = true;
  //  setState(() {});
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
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
            automaticallyImplyLeading: true,
            title: Text(
              'Science Home',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter Tight',
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                  ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    child: SvgPicture.asset(
                      'assets/images/menu_icon.svg',
                      width: 25,
                      height: 25,
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              // Generated code for this Image Widget...
             /* ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SvgPicture.asset(
                  'assets/images/notification.svg',
                  width: 45,
                  height: 45,
                  fit: BoxFit.none,
                  color: Colors.black,
                ),
              )*/
              Container(
                width: 45,
                height: 45,
              )
            ],
            centerTitle: true,
            elevation: 0.0,
          ),
          drawer: CustomDrawer(),
          // Attach your drawer here
          body: SafeArea(
            top: true,
            child: _model.isLoaderActive == false
                ? Center(
                    child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primary))
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 10.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
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
                              hintText: 'Search...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
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
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              prefixIcon: SvgPicture.asset(
                                'assets/images/Search.svg',
                                width: 17.0,
                                height: 17.0,
                                fit: BoxFit.none,
                              ), //SvgPicture('assetsimages/Search.svg')
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 350.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                   /* child: Container(
                                      width: double.infinity,
                                      height: 350.0,
                                      child: Stack(
                                        children: [
                                          PageView.builder(
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(initialPage: 0),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: _model
                                                    .bannerModelResponse
                                                    ?.data
                                                    ?.length ??
                                                0,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: _model
                                                                .bannerModelResponse
                                                                ?.data?[index]
                                                                .sliderImage !=
                                                            null
                                                        ? Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 8.0),
                                                            child:
                                                                Image.network(
                                                                  BaseURl.basUrl+'${_model.bannerModelResponse?.data?[index].sliderImage ?? ""}',
                                                              // 'assets/images/banner_img.png',
                                                              width: double
                                                                  .infinity,
                                                              height: 150.0,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          )
                                                        : Image.asset(
                                                            'assets/images/banner_img.png',
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.25,
                                                            fit: BoxFit.cover,
                                                          ),
                                                  ),
                                                ],
                                              );
                                            },
                                            // children: [
                                            //   Column(
                                            //     mainAxisSize: MainAxisSize.min,
                                            //     crossAxisAlignment:
                                            //         CrossAxisAlignment.start,
                                            //     children: [
                                            //       ClipRRect(
                                            //         borderRadius:
                                            //             BorderRadius.circular(8.0),
                                            //         child: Image.asset(
                                            //           'assets/images/banner_img.png',
                                            //           width: double.infinity,
                                            //           height: 150.0,
                                            //           fit: BoxFit.cover,
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            //   Column(
                                            //     mainAxisSize: MainAxisSize.min,
                                            //     crossAxisAlignment:
                                            //         CrossAxisAlignment.start,
                                            //     children: [
                                            //       ClipRRect(
                                            //         borderRadius:
                                            //             BorderRadius.circular(8.0),
                                            //         child: Image.asset(
                                            //           'assets/images/banner_img.png',
                                            //           width: double.infinity,
                                            //           height: 150.0,
                                            //           fit: BoxFit.cover,
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            //   Column(
                                            //     mainAxisSize: MainAxisSize.min,
                                            //     crossAxisAlignment:
                                            //         CrossAxisAlignment.start,
                                            //     children: [
                                            //       ClipRRect(
                                            //         borderRadius: BorderRadius.circular(8.0),
                                            //         child: Image.asset(
                                            //           'assets/images/banner_img.png',
                                            //           width: double.infinity,
                                            //           height: 150.0,
                                            //           fit: BoxFit.cover,
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 30.0),
                                              child: smooth_page_indicator
                                                  .SmoothPageIndicator(
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: 0),
                                                count: _model
                                                        .bannerModelResponse
                                                        ?.data
                                                        ?.length ??
                                                    0,
                                                axisDirection: Axis.horizontal,
                                                onDotClicked: (i) async {
                                                  await _model
                                                      .pageViewController!
                                                      .animateToPage(
                                                    i,
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.ease,
                                                  );
                                                  safeSetState(() {});
                                                },
                                                effect: smooth_page_indicator
                                                    .SlideEffect(
                                                  spacing: 8.0,
                                                  radius: 8.0,
                                                  dotWidth: 8.0,
                                                  dotHeight: 8.0,
                                                  dotColor: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  activeDotColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  paintStyle:
                                                      PaintingStyle.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),*/

                                    child:Column(
                                      children: [
                                        Container(

                                          width: double.infinity,
                                          //height: 350.0,
                                          child: CarouselSlider.builder(
                                            itemCount: _model.bannerModelResponse?.data?.length ?? 0,
                                            itemBuilder: (BuildContext context, int index, int realIndex) {
                                              final imageUrl = _model.bannerModelResponse?.data?[index].sliderImage;
                                              return Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  child: imageUrl != null
                                                      ? Image.network(
                                                    BaseURl.basUrl + imageUrl,
                                                    width: double.infinity,
                                                    height: 150.0,
                                                    fit: BoxFit.cover,
                                                  )
                                                      : Image.asset(
                                                    'assets/images/banner_img.png',
                                                    width: double.infinity,
                                                    height: 150.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            },
                                            options: CarouselOptions(
                                              height: 180,
                                              autoPlay: true,
                                              viewportFraction: 1.0,
                                              enlargeCenterPage: false,
                                              enableInfiniteScroll: true,
                                              autoPlayAnimationDuration: Duration(milliseconds: 600),
                                              autoPlayCurve: Curves.easeInOut,
                                              scrollPhysics: BouncingScrollPhysics(),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        AnimatedSmoothIndicator(
                                          activeIndex: _currentIndex,
                                          count: _model.bannerModelResponse?.data?.length ?? 0,
                                          effect: SlideEffect(
                                            spacing: 8.0,
                                            radius: 8.0,
                                            dotWidth: 8.0,
                                            dotHeight: 8.0,
                                            dotColor: FlutterFlowTheme.of(context).accent1,
                                            activeDotColor: FlutterFlowTheme.of(context).primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Category',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          context.pushNamed('AllCategory');
                                        },
                                        child: Text(
                                          'View All',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 0.0, 10.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 90.0,
                                    decoration: BoxDecoration(),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      primary: false,
                                      // itemCount: 1,
                                      itemCount: _model.homepageresponse?.data?.length ?? 0,
                                      itemBuilder: (BuildContext context, int index) {
                                        // print('imageApi: https://sciencehome.iamannusolanki.cloud${_model.homepageresponse?.data?[index].categoryImage ?? ''}');
                                        return InkWell(
                                          onTap: () {
                                            context.pushNamed('AllCategory');
                                          },
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.all(12),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme.of(context).warning,
                                                          borderRadius: BorderRadius.circular(20.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(5.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.circular(15.0),
                                                            child: _model.homepageresponse?.data?[index].categoryImage != null
                                                                ? Image.network(
                                                                    // 'assets/images/football.png',
                                                              BaseURl.basUrl+
                                                                        (_model.homepageresponse?.data![index].categoryImage ??
                                                                            ''),
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  )
                                                                : Image.asset(
                                                                    'assets/images/Cart.png',
                                                                    width: 20,
                                                                    height: 20,
                                                                  ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        _model
                                                                .homepageresponse
                                                                ?.data?[index]
                                                                ?.title
                                                                ?.toString() ??
                                                            '',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 20.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 15.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Prime Product',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              InkWell(
                                onTap: () {
                                  context.pushNamed('Allproduct');
                                },
                                child: Text(
                                  'View All',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        filteredCategories.isEmpty?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                child: Lottie.asset(
                                    'assets/lottie/search_glass.json',
                                    repeat: false
                                )),
                            SizedBox(height: 20,),
                            Text(
                                "No Products Found",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                )),
                          ],
                        ):

                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          primary: false,
                          itemCount: filteredCategories?.length,
                          itemBuilder: (BuildContext context, int index) {
                            // index_val =index; //panc
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 0.0),
                              child: InkWell(
                                onTap: () {
                                  // context.pushNamed('ProductDetail');
                                  Helper.moveToScreenwithPush(
                                      context,
                                      ProductDetailWidget(
                                           _model.productList
                                                  ?.data?[index]?.productId ?? 0,counters[index]));
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                //color: FlutterFlowTheme.of(context).alternate,
                                                elevation: 0.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .symmetric(
                                                                horizontal: 0.0,
                                                                vertical: 0.0),
                                                    child: Center(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),

                                                        child: Stack(
                                                          children: [
                                                            // Product Image
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(8.0),
                                                              child: (filteredCategories?[index].productThumimage != null)
                                                                  ? Image.network(
                                                                BaseURl.basUrl + (filteredCategories?[index].productThumimage ?? ''),
                                                                height: MediaQuery.of(context).size.height * 0.40,
                                                                width: MediaQuery.of(context).size.width * 0.95,
                                                                fit: BoxFit.fill,
                                                              )
                                                                  : Image.asset(
                                                                'assets/images/image_5-removebg-preview.png',
                                                                width: MediaQuery.of(context).size.width * 0.9,
                                                                height: 100.0,
                                                                fit: BoxFit.fill,
                                                              ),
                                                            ),

                                                            // Premium Flag
                                                            if (filteredCategories?[index].premium == 1)
                                                              Positioned(
                                                                top: 5,
                                                                left: 5,
                                                                child: Container(
                                                                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.amber.shade700,
                                                                    borderRadius: BorderRadius.circular(4),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors.black26,
                                                                        blurRadius: 4,
                                                                        offset: Offset(0, 2),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(Icons.star, color: Colors.white, size: 14),
                                                                      SizedBox(width: 4),
                                                                      Text(
                                                                        'Premium',
                                                                        style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontSize: 12,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),

                                                      ),
                                                    )),
                                              ),
                                              Text(
                                                filteredCategories?[index]
                                                        ?.productTitle
                                                        ?.toString() ??
                                                    '',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Obx((){
                                                return Visibility(
                                                  visible: priceController.showPriceModel.value!.data![0].status==0?false:true,
                                                  maintainState: false,
                                                  maintainSize: false,
                                                  maintainAnimation: false,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        '₹ ${filteredCategories?[index]?.priceMsp?.toString() ?? ""}',
                                                        style: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryText,
                                                            letterSpacing: 0.0,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                            FontWeight
                                                                .w600),
                                                      ),
                                                      Text(
                                                        filteredCategories?[index]
                                                            ?.priceMrp
                                                            ?.toString() ??
                                                            "",
                                                        style: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontSize: 14.0,
                                                          decoration:
                                                          TextDecoration
                                                              .lineThrough,
                                                        ),
                                                      ),
                                                    ].divide(SizedBox(
                                                      width: 5,
                                                    )),
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
                                                    children: [
                                                      // Decrease Button
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            if (counters[index] > 0) {
                                                              counters[index]--; // Decrease value
                                                            }
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.arrow_drop_down_circle_outlined,
                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                          size: 33.0,
                                                        ),
                                                      ),

                                                      // Counter Text
                                                      SizedBox(width: 8.0),
                                                      Text(
                                                        '${counters[index]}', // Display counter for this item
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium
                                                            ?.copyWith(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                      ),
                                                      SizedBox(width: 8.0),

                                                      // Increase Button
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            counters[index]++; // Increase value
                                                          });
                                                        },
                                                        child: Transform.rotate(
                                                          angle: math.pi, // Rotate the icon 180 degrees
                                                          child: Icon(
                                                            Icons.arrow_drop_down_circle_outlined,
                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                            size: 33.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () {
                                                      index_val=index;//pancode
                                                      if (FFAppState().UserId == '') {
                                                        print("this===>");
                                                        get_initiated_add_to_card();
                                                      } else {
                                                        print("that===>");
                                                        call_add_to_cart(index);
                                                      }
                                                    },
                                                    text: 'Add to Cart',
                                                    icon: Icon(
                                                      Icons.shopping_cart_outlined,
                                                      size: 15,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width:
                                                      MediaQuery.of(context).size.width * 0.30,
                                                      height: 35,
                                                      padding: EdgeInsetsDirectional.zero,
                                                      iconPadding: EdgeInsetsDirectional.zero,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      textStyle: FlutterFlowTheme.of(context)
                                                          .titleSmall
                                                          .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                      elevation: 0,
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              // Add to Cart Button

                                            ].divide(SizedBox(height: 15.0)),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Future<void> call_add_to_cart(int index) async {

    // The API endpoint
      final String url = BaseURl.url+"add-to-card";

      // The JSON data
      final Map<String, dynamic> jsonData = {
        "orderid": FFAppState().UserId,
        "products": [
          {"product_id": _model.productList?.data?[index].productId??'', "quantity": '${counters[index]}'},
        //  {"product_id": 102, "quantity": 5}
        ]
      };

      try {
        // Make the POST request
        final response = await http.post(
          Uri.parse(url), // Parse the URL
          headers: {
            "Content-Type": "application/json", // Specify JSON content type
          },
          body: json.encode(jsonData), // Convert the Map to a JSON string
        );

        // Check the response status
        if (response.statusCode == 200 || response.statusCode == 201) {
          print("Data sent successfully: ${response.body}");
         // ToastMessage.msg("Product added to cart");

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Product added to cart"),
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        } else {
          print("Failed to send data. Status code: ${response.statusCode}");
          print("Response: ${response.body}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Failed to add to the cart"),
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),

              ),
            ),
          );
        }
       // context.pushNamed('AddToCard');
       // ToastMessage.msg("Product added to cart");

      } catch (e) {
        print("Error occurred: $e");
      }
    }

  Future<String> getFCMToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();

      return token ?? "";
    } catch (e) {

      return "";
    }
  }

  Future<String> getDeviceId() async {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

        return androidInfo.id ?? "no-id";
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

        return iosInfo.identifierForVendor ?? "no-id";
      } else {
        return "unsupported-platform";
      }
    } catch (e) {

      return "unknown";
    }
  }
  void updateToken()async {
    String fcmToken = await getFCMToken();
    String deviceId = await getDeviceId();
    print("fcmToken===>${fcmToken}");
    print("deviceId===>${deviceId}");
    await firebaseTokenApi(
      deviceId: deviceId.toString(),
      deviceToken: fcmToken.toString(),
    );

  }

  Future<void> firebaseTokenApi({
    required String deviceToken,
    required String deviceId,
  }) async {
    final url = Uri.parse(BaseURl.url + "firebase-token"); // 🔁 Use your actual endpoint here

    final Map<String, String> body = {
      "DeviceToken": deviceToken,
      "Device_id": deviceId,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(body),
      );

      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> resData = jsonDecode(response.body);
        bool success = resData['success'];
        String message = resData['message'];

        if (success) {
          print("Token saved successfully: $message");
        } else {
          print("Server responded but not successful: $message");
        }
      } else {
        print("Failed to send token. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception occurred while sending token: $e");
    }
  }

}
