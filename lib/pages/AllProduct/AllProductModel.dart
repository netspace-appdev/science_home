
import 'package:flutter/cupertino.dart';
import 'package:school_home/pages/AllProduct/AllProduct.dart';

import '../../flutter_flow/flutter_flow_model.dart';
import '../GenerateOrderId.dart';
import '../home_page/ProductList.dart';

class Allproductmodel extends FlutterFlowModel<Allproduct> {

  AllProductlist? productList;
  bool? isLoaderActive;
  GenerateOrderId? generateOrderId;



  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {

  }
}
class AllProductlist {
  int? code;
  String? status;
  List<ProductData>? data;

  AllProductlist({this.code, this.status, this.data});

  AllProductlist.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  int? productId;
  String? productTitle;
  String? description;
  String? shortdetails;
  int? priceMrp;
  String? priceMsp;
  String? productThumimage;
  String? alias;
  int? orderby;
  int? premium;
  String? productImages;

  ProductData(
      {this.productId,
        this.productTitle,
        this.description,
        this.shortdetails,
        this.priceMrp,
        this.priceMsp,
        this.productThumimage,
        this.alias,
        this.orderby,
        this.premium,
        this.productImages});

  ProductData.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productTitle = json['product_title'];
    description = json['description'];
    shortdetails = json['shortdetails'];
    priceMrp = json['price_mrp'];
    priceMsp = json['price_msp'];
    productThumimage = json['product_thumimage'];
    alias = json['alias'];
    orderby = json['orderby'];
    productImages = json['product_images'];
    premium = json['Premium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_title'] = this.productTitle;
    data['description'] = this.description;
    data['shortdetails'] = this.shortdetails;
    data['price_mrp'] = this.priceMrp;
    data['price_msp'] = this.priceMsp;
    data['product_thumimage'] = this.productThumimage;
    data['alias'] = this.alias;
    data['orderby'] = this.orderby;
    data['product_images'] = this.productImages;
    data['Premium'] = this.premium;
    return data;
  }
}

