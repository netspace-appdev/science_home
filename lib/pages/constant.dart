// import 'package:connectivity/connectivity.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:lottie/lottie.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../flutter_flow/backend/api_requests/api_constants.dart';
import '../flutter_flow/flutter_flow_theme.dart';

// import 'flutter_flow/flutter_flow_theme.dart';

class AppColor {
  // static  Color primeryColor = Color(0xFFFFC107);
  // static  Color secondaryColor = Color(0xFF333333);
  // static Color borderColor = Color(0xFF727272);
  // static  Color textfeildclr =  Color(0xFF383838);
  static Color ontap = Color(0xFF666666);
  static Color container = Color(0xff333333);
  static Color red = Color(0xffF02252);
  static Color green = Color(0xff3CE4A3);

  ///New Design
  static Color primeryColor = Color.fromARGB(255, 255, 255, 255);
  static Color textfeildclr = Color(0xFF242424);
  static Color secondaryColor = Color(0xFF000000);
  static Color borderColor = Color(0xFF353542);
}

class Helper {
  /*================ progress bar ================*/
  static Widget getProgressBar(BuildContext context, bool _isVisible) {
    return Visibility(
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: _isVisible,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Center(
            child: SpinKitSpinningLines(
              size: 60.0,
              color: FlutterFlowTheme.of(context).primary,
              lineWidth: 3,
            ),
          ),
        ));
  }

  static Widget progressBar(BuildContext context, bool _isVisible) {
    return Visibility(
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: _isVisible,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // margin: EdgeInsets.only(top: 20),
          color: Colors.black54,
          child: Center(
            child: SpinKitSpinningLines(
              size: 60.0,
              color: AppColor.primeryColor,
              lineWidth: 3,
            ),
          ),
        ));
  }

  static Widget getProgressBarWhite(BuildContext context, bool _isVisible) {
    return Visibility(
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: _isVisible,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Center(
            child: SpinKitSpinningLines(
              size: 60.0,
              color: Colors.grey,
              lineWidth: 3,
            ),
          ),
        ));
  }

  /*================ check Internet ================*/

  static Future<void> checkInternet(Future<dynamic> callback) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      callback.asStream();
      // callback.call();
    } else {
      // Fluttertoast.showToast(msg: StaticMessages.CHECK_INTERNET);
    }
  }

  /*static Future<bool> internet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
      // callback.call();
    } else {
      Fluttertoast.showToast(msg: StaticMessages.CHECK_INTERNET);
      return false;
    }
  }*/

  /*================ next Focus ================*/

  static void nextFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  /*================ open web ================*/

  // static Future<bool> launchUrl(String url) async{
  //
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //     return true;
  //   } else {
  //     print( 'Could not launch $url');
  //     return false;
  //   }
  // }

  /*================ for navigation ================*/

  static Future<void> moveToScreenwithPush(
      BuildContext context, dynamic nextscreen) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => nextscreen));
  }

  static moveToScreenwithPushreplaceemt(
      BuildContext context, dynamic nextscreen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => nextscreen));
  }

  static moveToScreenwithRoutClear(BuildContext context, nextscreen) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => nextscreen()),
        (Route<dynamic> route) => false);
  }

  static popScreen(BuildContext context) {
    Navigator.pop(context);
  }

/*================ for navigation ================*/

/*================ share sheet ================*/

// static  void  shareSheet(  BuildContext context,String shareData)  {
//   {
//     Share.share(shareData);
//     // Share.share(shareData, subject: 'Look what I made!');
//     //  Share.shareFiles([shareData], text: 'Great picture');
//     // Share.shareFiles([shareData, shareData]);
//
//   }
// }

/*================ social media webviews ================*/
}

class Apis {
  static const baseUrl =
      BaseURl.basUrl+"api/";


  // Customer screens API'S
  //static const login = BASEURL + "login";
  static const product = baseUrl + "list-product";
  static const category = baseUrl + "list-category";
  static const login = baseUrl + "login";
  static const create_order = baseUrl + "create_order";
  static const job_location = baseUrl + "job_location";
  static const forgetPassword = baseUrl + "forgetPassword";
  static const job_list = baseUrl + "job_list";
  static const check_free_paid = baseUrl + "check_free_paid";

}

class StaticMessages {
  static const CHECK_INTERNET = "Please Check Internet Connection";
  static const API_ERROR = "Something Went Wrong";
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

class SessionHelper {
  static late SharedPreferences sharedPreferences;

  static late SessionHelper _sessionHelper;

  static const String USER_ID = "USER_ID";
  static const String APPLY_USER_ID = "APPLY_USER_ID";
  static const String NAME = "NAME";
  static const String EMAIL = "EMAIL";
  static const String PHONE = "PHONE";
  static const String USERTYPE = "USERTYPE";
  static const String DEVICETOKEN = "DEVICETOKEN";
  static const String DEVICETYPE = "DEVICETYPE";
  static const String PROFILE_IMG = "PROFILE_IMG";
  static const String RECEIVER_IMG = "RECEIVER_IMG";
  static const String DATEOFBIRTH = "DATEOFBIRTH";
  static const String GENDER = "GENDER";
  static const String MOBILE = "MOBILE";
  static const String RESUME = "RESUME";
  static const String ADDRESS = "ADDRESS";
  static const String ORDERID = "RECEIVER_ID";
  static const String IMAGE = "IMAGE";

  static Future<SessionHelper> getInstance(BuildContext context) async {
    _sessionHelper = new SessionHelper();
    sharedPreferences = await SharedPreferences.getInstance();

    return _sessionHelper;
  }

  String? get(String key) {
    return sharedPreferences.getString(key);
  }

  put(String key, String value) {
    sharedPreferences.setString(key, value);
    print("value  " + value.toString());
  }

  clear() {
    sharedPreferences.clear();
  }

  remove(String key) {
    sharedPreferences.remove(key);
  }
}

class ToastMessage {
  static void msg(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        fontSize: 16.0,
        backgroundColor: Color(0xFF373774),
        textColor: Colors.white);
  }

  static void alertmsg(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
        backgroundColor: AppColor.primeryColor,
        textColor: Colors.black);
  }
}

class HelperClass {
  /*================ progress bar ================*/
  static String _check = '';

  static Widget getProgressBar(BuildContext context, bool _isVisible) {
    return Visibility(
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: _isVisible,
        child: Container(
          color: Colors.transparent,
          margin: EdgeInsets.only(top: 20),
          child: Center(
            child: SpinKitSpinningLines(
              size: 60.0,
              color: AppColor.primeryColor,
              lineWidth: 3,
            ),
          ),
        ));
  }

  // static Widget progressBar(BuildContext context, bool _isVisible) {
  //   return Visibility(
  //       maintainSize: true,
  //       maintainAnimation: true,
  //       maintainState: true,
  //       visible: _isVisible,
  //       child: Container(
  //         height: MediaQuery.of(context).size.height,
  //         width: MediaQuery.of(context).size.width,
  //         // margin: EdgeInsets.only(top: 20),
  //         color: Colors.black54,
  //         child: Center(
  //             child: Lottie.asset("assets/animation/loader.json",
  //                 width: 300, height: 300)
  //             // SpinKitSpinningLines(size: 60.0, color: AppColor.primaryColor, lineWidth: 3,),
  //             ),
  //       ));
  // }

  // static Widget getProgressBarWhite(BuildContext context, bool _isVisible) {
  //   return Visibility(
  //       maintainSize: true,
  //       maintainAnimation: true,
  //       maintainState: true,
  //       visible: _isVisible,
  //       child: Container(
  //         color: Colors.transparent,
  //         margin: EdgeInsets.only(top: 20),
  //         child: Center(
  //             child: Lottie.asset("assets/animation/loader.json",
  //                 width: 300, height: 300)
  //             // child: Image.asset("assets/images/loader.gif")
  //             // child: SpinKitSpinningLines(size: 60.0, color: AppColor.primaryColor, lineWidth: 3,),
  //             ),
  //       ));
  // }

  /*================ check Internet ================*/

/*  static Future<void> checkInternet(Future<dynamic> callback) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      callback.asStream();
      // callback.call();
    } else {
      ToastMessage.msg(StaticMessages.CHECK_INTERNET);
    }
  }*/

  static Future<bool> internet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
      // callback.call();
    } else {
      ToastMessage.msg(StaticMessages.CHECK_INTERNET);
      return false;
    }
  }

  /*================ next Focus ================*/

  static void nextFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  /*================ for navigation ================*/

  static Future<void> moveToScreenwithPush(
      BuildContext context, dynamic nextscreen) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => nextscreen));
  }

  static moveToScreenwithPushreplaceemt(
      BuildContext context, dynamic nextscreen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => nextscreen));
  }

  static moveToScreenwithRoutClear(BuildContext context, nextscreen) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => nextscreen()),
        (Route<dynamic> route) => false);
  }

  static popScreen(BuildContext context) {
    Navigator.pop(context);
  }

/*================ for navigation ================*/
}

class AlertMessage {
  static void showAlert(BuildContext context, String message) {
    print("========helloooooooo=========");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void showShortAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
