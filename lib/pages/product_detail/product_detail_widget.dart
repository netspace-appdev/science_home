import 'dart:async';
import 'dart:convert';
import '../../flutter_flow/backend/api_requests/api_calls.dart';
import '../../flutter_flow/backend/api_requests/api_constants.dart';
import '../../flutter_flow/backend/app_state.dart';
import '../constant.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'product_detail_model.dart';
export 'product_detail_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
as smooth_page_indicator;
import 'package:http/http.dart' as http;


class ProductDetailWidget extends StatefulWidget {
  int product_name,quantity;
   ProductDetailWidget( this.product_name, this.quantity ,{super.key});

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  late ProductDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailModel());
    apiCallHomepages();
    // Auto-slide setup with Timer

  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
  void apiCallHomepages() async {
    print('widget.product_id${widget.product_name.toString()}');
    setState(() {});
    _model.isLoaderActive= false;
    _model.productList = await BaseUrlGroup.productDetailApi.call(
        product_name: widget.product_name.toString()
    );
    setState(() {});

    _model.isLoaderActive= true;
    setState(() {});

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < (_model.productList?.data?.productImages?.length ?? 1) - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Loop back to the first page
      }
      _model.pageViewController?.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });


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
          body: SafeArea(
            top: true,
            child:// _model.isLoaderActive == false ?
           // Center(child: CircularProgressIndicator(color: FlutterFlowTheme.of(context).primary)):
            SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          context.pop();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Back.png',
                            width: 45.0,
                            height: 45.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          context.pushNamed('AddToCard');
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Cart.png',
                            width: 45.0,
                            height: 45.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 10.0)),
                  ),
                ),
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      // height: 250.0,
                      height: MediaQuery.of(context).size.height * 0.40,
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: _model.pageViewController ??= PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            itemCount: _model.productList?.data?.productImages?.length ?? 0,
                            onPageChanged: (index) {
                              _currentPage = index; // Update the current page index
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: _model.productList?.data?.productImages?[index] != null
                                        ? Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Image.network(
                                        BaseURl.basUrl+'${_model.productList?.data?.productImages?[index]}',
                                        width: double.infinity,
                                       /* height:MediaQuery.of(context).size.height*0.23,*/
                                        height: MediaQuery.of(context).size.height * 0.40,


                                        fit: BoxFit.fill,
                                      ),
                                    )
                                        : Image.asset(
                                      'assets/images/banner_img.png',
                                      width: double.infinity,
                                      height: 150.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              );
                            },
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
                                count: _model.productList
                                    ?.data?.productImages
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
                    ),
                  ),

                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 15.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                        _model.productList?.data?.productTitle??'',
                             // 'Nike Sport Shoes',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                Text(
                                 // '₹120',
                                  '₹${_model.productList?.data?.priceMsp.toString()??''}',

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  // '₹120',
                                  '₹${_model.productList?.data?.priceMrp.toString()??''}',

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: Colors.red,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),

                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 77.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: _model.productList?.data?.productImages?.length??0,
                              itemBuilder: (BuildContext context, int index) {
                                return   Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        BaseURl.basUrl+ '${_model.productList?.data?.productImages?[index]}',
                                        //'assets/images/image_5-removebg-preview.png',
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                );
                              },

                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                        child: Text(
                          '',
                         // _model.productList?.data?[0].shortdetails??'',

                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: 'Inter',
                            fontSize: 17.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10.0,0.0, 10.0, 0.0),
                        child:   Text(
                          _model.productList?.data?.shortdetails??'',
                          // 'Whether you\'re hitting the gym, running on the track, or playing your favorite sport, ',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: 'Inter',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.zero,
                        child: Text(
                          '',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          _model.productList?.data?.longDescription??'',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Total Price',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  '',
                                 // 'with VAT,SD',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                            Column(
                              children: [
                                Text(
                                  '₹${_model.productList?.data?.priceMrp.toString()??''}',
                                 //  '₹120',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  // '₹120',
                                  '₹${_model.productList?.data?.priceMrp.toString()??''}',

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: Colors.red,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            if (FFAppState().UserId == '') {
                              get_initiated_add_to_card();
                            } else {
                              call_add_to_cart();
                            }
                          //  print('Button pressed ...');
                          //  context.pushNamed('AddToCard');
                          },
                          text: 'Add to Cart',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }
  Future<void> call_add_to_cart() async {

    // The API endpoint
    final String url = BaseURl.url+"add-to-card";

    // The JSON data
    final Map<String, dynamic> jsonData = {
      "orderid": FFAppState().UserId,
      "products": [
        {"product_id": _model.productList?.data?.productId??'', "quantity": '${widget.quantity}'},
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
      if (response.statusCode == 200) {
        print("Data sent successfully: ${response.body}");
        ToastMessage.msg(response.statusCode.toString());
      } else {
        print("Failed to send data. Status code: ${response.statusCode}");
        print("Response: ${response.body}");
      }
      context.pushNamed('AddToCard');
    } catch (e) {
      print("Error occurred: $e");
    }
  }
  void get_initiated_add_to_card() async {
    setState(() {});
    _model.isLoaderActive = false;
    _model.generateOrderId = await BaseUrlGroup.initiated_add_to_card.call();
    setState(() {});
    setState(() {
      // filteredCategories = _model.productList?.data ?? [];
      FFAppState().UserId=_model.generateOrderId?.orderid??'';
      print('userID......${FFAppState().UserId}');
      call_add_to_cart();
    });
    _model.isLoaderActive = true;
    setState(() {});
  }


}
