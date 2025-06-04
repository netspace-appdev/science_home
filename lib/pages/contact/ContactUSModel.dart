import 'package:school_home/pages/ContactUsResponse.dart';
import 'package:school_home/pages/contact/ContactUsPage.dart';
import 'package:school_home/pages/home_page/HomePageResponse.dart';
import 'package:school_home/pages/home_page/ProductList.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Contactusmodel extends FlutterFlowModel<Contactuspage> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  ContactUsResponse? contactUsResponse;
  bool? isLoaderActive;
  final unfocusNode = FocusNode();

  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
