import 'package:flutter/material.dart';

class BaseURl {
  static const String url = "https://sciencehome.in/api/";
  static const String basUrl = "https://sciencehome.in/";
  //static const String url = "https://thinktubeglobal.com/api/";


}

class ApiAction {
  static const String list_category = "list-category";
  static const String list_product = "list-product";
  static const String list_contact_us = "list-contact-us";
  static const String product_details = "list-product-details";
  static const String list_all_product = "list-all-product";
  static const String latest_product = "latest-product";
  static const String slider_img = "slider-img";
  static const String initiated_add_to_card = "initiated-add-to-card";
  static const String add_to_card_list = "add-to-card-list";
  static const String delete_add_to_card_product = "delete-add-to-card-product";


}

class GetDriverDeliveriesType {
  static const String current = "1";
  static const String history = "2";
}

class ApiCode {
  //static const String kcode = "";
}

class ApiConstantsKey {
  static const String kbookingId = "booking_id";
  static const String klat = "lat";
  static const String klong = "long";
  static const String kcode = "app_token";
  static const String kemail = "email";
  static const String kuserId = "user_id";
  static const String kdriverId = "driver_id";
  static const String kuserType = "user_type";
  static const String ktype = "type";
  static const String kusername = "username";
  static const String kcontact = "contact";
  static const String kdeviceToken = "device_token";
  static const String kdeviceType = "device_type";
  static const String kpassword = "password";
  static const String kphone_code = "phone_code";
  static const String klicenceNumber = "licence_number";
  static const String kvehicleName = "vehicle_name";
  static const String kvehicleNumber = "vehicle_number";
  static const String kaddress = "address";
  static const String kbankAccountNumber = "bank_account_number";
  static const String klicenceFornt = "license_front_image";
  static const String klicenceBack = "license_back_image";
  static const String kvehicleImage = "vehicle_image";
  static const String kregistrationType = "registration_type";
  static const String kvehicleType = "vehicle_type";
  static const String ksupplier_id = "supplier_id";
  static const String kamount = "amount";
  static const String kuserLong = "user_long";
  static const String kuserLat= "user_lat";
  static const String kprice= "price";
   static const String kFullName = 'fullname';
  //static const String kuserType = "userType";

  static const String kvehiclePlateNumber = "vehicle_plate_number";
  static const String kimage = "image";
  static const String kimage2 = "profileImage";
  static const String kfirstName = 'first_name';
  static const String klastName = 'last_name';

  static const String kfullName = 'fullname';
  static const String kCoupon = 'coupon';
  static const String kBasefare = 'basefare';

}

class LoginCheck {
  static const String kLoggedIn = "login";
  static const String kuserId = "user_id";
  static const String kcurrency = "currency";
  static const String kusername = "username";
  static const String kprofile = "profile";
  static const String ktoken = "token";
}

class DeviceType {
  static const String kdeviceType = "ios";
}

class APIResponse {
  static const String failure = "false";
  static const String success = "success";
}
