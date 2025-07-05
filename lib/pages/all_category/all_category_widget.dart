import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:school_home/pages/AllProduct/AllProduct.dart';
import 'package:school_home/pages/AllProduct/AllProductList.dart';

import '../../flutter_flow/backend/api_requests/api_constants.dart';
import '../SlideBar.dart';
import '../constant.dart';
import '../home_page/HomePageResponse.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'all_category_model.dart';
export 'all_category_model.dart';

class AllCategoryWidget extends StatefulWidget {
  const AllCategoryWidget({super.key});

  @override
  State<AllCategoryWidget> createState() => _AllCategoryWidgetState();
}

class _AllCategoryWidgetState extends State<AllCategoryWidget> {
  late AllCategoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isVisible = false;


  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllCategoryModel());
    category_home();

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
            actions:  [
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
            child:_isVisible==true
                ? Center(
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                ),): Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'List of Categories',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        '(${_model.homepageresponse?.data?.length??0})',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(width: 5.0)),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),


                    child:
                    _model.homepageresponse!.data!.isEmpty?
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
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                     itemCount: _model.homepageresponse?.data?.length??0,
                      itemBuilder: (BuildContext context, int index) {
                        return   InkWell(
                          onTap: (){
                            Helper.moveToScreenwithPush(context,
                                Allproductlist(category_id:_model.homepageresponse?.data?[index].id??0));
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate, // Set your border color here
                                width: 1.0, // Set the border width
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 35.0,
                                        height: 35.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).warning,
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.network(
                                              BaseURl.basUrl+
                                                  (_model.homepageresponse?.data![index].categoryImage ?? ''),
                                              width: 25.0,
                                              height: 25.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _model.homepageresponse?.data?[index]?.title?.toString() ??'',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          // Row(
                                          //   mainAxisSize: MainAxisSize.max,
                                          //   children: [
                                          //     Text(
                                          //       ' ₹ 233',
                                          //       style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          //         fontFamily: 'Inter',
                                          //         letterSpacing: 0.0,
                                          //       ),
                                          //     ),
                                          //     Text(
                                          //       'to 400',
                                          //       style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          //         fontFamily: 'Inter',
                                          //         letterSpacing: 0.0,
                                          //       ),
                                          //     ),
                                          //   ].divide(SizedBox(width: 5.0)),
                                          // ),
                                        ].divide(SizedBox(height: 2.0)),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                  Container(
                                    width: 35.0,
                                    height: 35.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                      size: 24.0,
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          ),
                        );
                      },
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
  void setProgress(bool show) {
    if (mounted)
      setState(() {
        _isVisible = show;
      });
  }
  Future<void> category_home() async {
    print("category_home===>");
    setProgress(true);
    Map data = {

    };
    var res = await http.post(Uri.parse(Apis.category), body: data);
    print("Apis.category============>${Apis.category}");
    print("Response all  ============>" + res.body);
    setProgress(true);

    if (res.statusCode == 200) {
      try {
        final jsonResponse = jsonDecode(res.body);
        Homepageresponse model = Homepageresponse.fromJson(jsonResponse);
        setProgress(false);
        // _hasData = false;

        if (model.status == "Success") {
          _model.homepageresponse = model;
        } else {
          setProgress(false);
          // _hasData = false;
        }
      } catch (e) {
        print("false ============>");
        ToastMessage.msg(StaticMessages.API_ERROR);
        print('exception ==> ' + e.toString());
      }
    }
  }
}
