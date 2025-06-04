import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:school_home/flutter_flow/backend/api_requests/api_calls.dart';
import 'package:school_home/pages/GenerateOrderId.dart';
import 'package:school_home/pages/add_to_card/AddToCartResponse.dart';
import 'package:school_home/pages/home_page/home_page_model.dart';

import '../../../pages/AllProduct/AllProductModel.dart';
import '../../../pages/ContactUsResponse.dart';
import '../../../pages/home_page/HomePageResponse.dart';
import '../../../pages/home_page/ProductList.dart';
import '../../../pages/product_detail/ProductDetailResponse.dart';
import '../app_state.dart';
import '../cloud_functions/cloud_functions.dart';
import 'api_calls.dart';
import 'api_constants.dart';
import 'api_manager.dart';
export 'api_manager.dart' show ApiCallResponse;
import 'dart:io' show Platform;

/// Start BaseUrl Group Code

class BaseUrlGroup {
  static categoryListApi categorylist = categoryListApi();
  static ProductListApi productListApi = ProductListApi();
  static ContactUsApi contactUsApi = ContactUsApi();
  static ProductDetailApi productDetailApi = ProductDetailApi();
  static BannerApiList bannerApiList = BannerApiList();
  static AllProductListApi allProductListApi = AllProductListApi();
  static Initiated_add_to_card initiated_add_to_card = Initiated_add_to_card();
  static GetAddtocartApi getAddtocartApi = GetAddtocartApi();
   static DeleteAddtocartApi deleteAddtocartApi = DeleteAddtocartApi();
   static LetestProductListApi letestProductListApi = LetestProductListApi();


}

class DeleteAddtocartApi {
  Future<AddToCartResponse> call({String orderid='',
  String product_id='', String id=''}) async {
    final response = await makeCloudCallApis(
      ApiAction.delete_add_to_card_product,{
      'orderid':orderid,
      'product_id':product_id,
      'id':id,
    },
    );
    return AddToCartResponse.fromJson(response);

  }
}

class GetAddtocartApi {
  Future<AddToCartResponse> call({String orderid=''}) async {
    final response = await makeCloudCallApis(
      ApiAction.add_to_card_list,{
      'orderid':orderid
    },
    );
    return AddToCartResponse.fromJson(response);

  }
}

class BannerApiList {
  Future<BannerModelResponse> call() async {
    final response = await makeCloudCallApis(
      ApiAction.slider_img,
      {
      },
    );
    return BannerModelResponse.fromJson(response);
  }
}
class Initiated_add_to_card {
  Future<GenerateOrderId> call() async {
    final response = await makeCloudCallApis(
      ApiAction.initiated_add_to_card,
      {
      },
    );
    return GenerateOrderId.fromJson(response);
  }
}

class ContactUsApi {
  Future<ContactUsResponse> call() async {
    final response = await makeCloudCallApis(
      ApiAction.list_contact_us,
      {
      },
    );
    return ContactUsResponse.fromJson(response);
  }
}

class categoryListApi {
  Future<Homepageresponse> call() async {
    final response = await makeCloudCallApis(
      ApiAction.list_category,
      {

      },
    );
    return Homepageresponse.fromJson(response);

  }
}
class ProductListApi {
  Future<AllProductlist> call({String category=''}) async {
    final response = await makeCloudCallApis(
      ApiAction.list_product,{
      'category':category
    },
    );
    return AllProductlist.fromJson(response);

  }
}

class AllProductListApi {
  Future<AllProductlist> call() async {

    final response = await makeCloudCallApis(
      ApiAction.list_all_product,
      {
      },
    );
    return AllProductlist.fromJson(response);

  }
}
class LetestProductListApi {
  Future<AllProductlist> call() async {

    final response = await makeCloudCallApis(
      ApiAction.latest_product,
      {
      },
    );
    return AllProductlist.fromJson(response);

  }
}


class ProductDetailApi {
  Future<ProductDetailResponse> call({String product_name = ''}) async {

    final response = await makeCloudCallApis(
      ApiAction.product_details,
      {
        'product_name': product_name,
      },
    );
    return ProductDetailResponse.fromJson(response);

  }
}

/// End BaseUrl Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}



