import 'dart:convert';
import 'dart:math' as math; // Import math for pi

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:school_home/flutter_flow/backend/api_requests/api_calls.dart';
import 'package:school_home/flutter_flow/flutter_flow_util.dart';
import 'package:school_home/pages/AllProduct/AllProductModel.dart';
import 'package:school_home/pages/constant.dart';
import 'package:school_home/pages/product_detail/product_detail_widget.dart';

import '../../cotroller/price_controller.dart';
import '../../flutter_flow/backend/api_requests/api_constants.dart';
import '../../flutter_flow/backend/app_state.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../SlideBar.dart';
import 'package:http/http.dart' as http;


class Allproduct extends StatefulWidget {
  int category_id;
   Allproduct({super.key, required int this.category_id});

  @override
  State<Allproduct> createState() => _AllproductState();
}

class _AllproductState extends State<Allproduct> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Allproductmodel _model;
  int? index_val;
  List<int> counters = []; // List to store counters for each item
  PriceController priceController=Get.put(PriceController());

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Allproductmodel());
    callAllProductApi();
  }

  void callAllProductApi() async {
    _model.isLoaderActive= false;
    setState(() {
    });
    _model.productList = await BaseUrlGroup.allProductListApi.call();
    _model.isLoaderActive= true;
    counters = List.generate( _model.productList?.data?.length ?? 0, (index) => 1);
    setState(() {
    });
    priceController.showPriceApi();
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
      call_add_to_cart(index_val!);
    });
    _model.isLoaderActive = true;
    setState(() {});
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
            automaticallyImplyLeading: true,
            title: Text(
              'Science Home',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Inter Tight',
                color:FlutterFlowTheme.of(context).primary,
                fontSize: 18.0,
                letterSpacing: 0.0,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: (){
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SvgPicture.asset(
                    'assets/images/notification.svg',
                    width: 45,
                    height: 45,
                    fit: BoxFit.none,
                    color: Colors.black,

                  ),
                ),
              )
            ],
            centerTitle: true,
            elevation: 0.0,
          ),
          drawer: CustomDrawer(), // Attach your drawer here

          body: SafeArea(
            top: true,
            child:  _model.isLoaderActive == false ?
            Center(child: CircularProgressIndicator(color: FlutterFlowTheme.of(context).primary)):
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.9, // 90% of the screen height
                child:

                _model.productList!.data!.isEmpty?
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
                        "No Category Found",
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
                  padding:  EdgeInsetsDirectional.only(bottom: 100.0),
                  itemCount: _model.productList?.data?.length??0,
                  itemBuilder: (BuildContext context, int index) {
                     index_val = index;

                    return  Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: InkWell(
                        onTap: (){
                          Helper.moveToScreenwithPush(context, ProductDetailWidget(
                          _model.productList?.data?[index]?.productId??0,
                          counters[index]));
                      //    context.pushNamed('ProductDetail');
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0 ,vertical: 10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Card(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                       // color: FlutterFlowTheme.of(context).alternate,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                            padding: EdgeInsetsDirectional.symmetric(horizontal: 0.0, vertical: 0.0),
                                            child: Center(
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8.0),
                                                child:
                                                (_model.productList?.data?[index].productThumimage!=null)
                                                    ? Image.network(
                                                  BaseURl.basUrl+
                                                      (_model.productList?.data?[index].productThumimage ?? ''),
                                                  height: MediaQuery.of(context).size.height * 0.40,
                                                  width: MediaQuery.of(context).size.width * 0.95,
                                                  fit: BoxFit.fill,

                                                ):
                                                Image.asset(
                                                  'assets/images/image_5-removebg-preview.png',
                                                  width: MediaQuery.of(context).size.width*0.95,
                                                  height: 100.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            )

                                        ),
                                      ),
                                      Text(
                                        _model.productList?.data?[index]?.productTitle?.toString() ?? ''    ,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Inter',
                                          fontSize: 16.0,
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
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '₹ ${ _model.productList?.data?[index]?.priceMsp?.toString() ??""}',
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                    letterSpacing: 0.0,
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w600

                                                ),
                                              ),
                                              Text(
                                                _model.productList?.data?[index]?.priceMrp?.toString() ??"",
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontSize: 14.0,
                                                  decoration: TextDecoration.lineThrough,
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 5,)),
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
                                              if (FFAppState().UserId == '') {
                                                get_initiated_add_to_card();
                                              } else {
                                                call_add_to_cart(index);
                                              }
                                            },
                                            text: 'Add to card',
                                            icon: Icon(
                                              Icons.shopping_cart_outlined,
                                              size: 15,
                                            ),
                                            options: FFButtonOptions(
                                              width:
                                              MediaQuery.of(context).size.width * 0.30,
                                              height: 35,
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
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


    } catch (e) {
      print("Error occurred: $e");
    }
  }

}
