
class GenEstiamateModel {
  int? code;
  String? status;
  String? message;
  Data? data;

  GenEstiamateModel({this.code, this.status, this.message, this.data});

  GenEstiamateModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? estimationId;
  String? name;
  String? mobileNumber;
  List<Product>? product;
  String? city;

  Data(
      {this.estimationId,
        this.name,
        this.mobileNumber,
        this.product,
        this.city});

  Data.fromJson(Map<String, dynamic> json) {
    estimationId = json['estimation_id'];
    name = json['name'];
    mobileNumber = json['mobile_number'];
    if (json['Product'] != null) {
      product = <Product>[];
      json['Product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['estimation_id'] = this.estimationId;
    data['name'] = this.name;
    data['mobile_number'] = this.mobileNumber;
    if (this.product != null) {
      data['Product'] = this.product!.map((v) => v.toJson()).toList();
    }
    data['city'] = this.city;
    return data;
  }
}

class Product {
  int? estimationId;
  String? name;
  String? mobileNumber;
  String? email;
  int? categoryId;
  int? productId;
  String? productName;
  int? productPrice;
  int? quantity;
  int? estimationTotal;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.estimationId,
        this.name,
        this.mobileNumber,
        this.email,
        this.categoryId,
        this.productId,
        this.productName,
        this.productPrice,
        this.quantity,
        this.estimationTotal,
        this.createdAt,
        this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    estimationId = json['estimation_id'];
    name = json['name'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    categoryId = json['category_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    quantity = json['quantity'];
    estimationTotal = json['estimation_total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['estimation_id'] = this.estimationId;
    data['name'] = this.name;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    data['category_id'] = this.categoryId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['quantity'] = this.quantity;
    data['estimation_total'] = this.estimationTotal;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
