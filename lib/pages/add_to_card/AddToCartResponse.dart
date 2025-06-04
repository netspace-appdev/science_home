class AddToCartResponse {
  int? code;
  String? status;
  String? message;
  List<Data>? data;

  AddToCartResponse({this.code, this.status, this.message, this.data});

  AddToCartResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? productId;
  int? quantity;
  String? title;
  String? shortdetails;
  String? productThumimage;
  int? priceMrp;
  String? priceMsp;
  String? date;
  int? itemtotal;
  int? categoryId;
  String? categoryname;
  Data(
      {
        this.id,
        this.productId,
        this.quantity,
        this.title,
        this.shortdetails,
        this.productThumimage,
        this.priceMrp,
        this.priceMsp,
        this.itemtotal,
        this.categoryId,
        this.categoryname,
        this.date});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    title = json['title'];
    shortdetails = json['shortdetails'];
    productThumimage = json['product_thumimage'];
    priceMrp = json['price_mrp'];
    priceMsp = json['price_msp'];
    date = json['date'];
    itemtotal = json['Itemtotal'];
    categoryId = json['category_id'];
    categoryname = json['Categoryname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Categoryname'] = this.categoryname;
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['title'] = this.title;
    data['shortdetails'] = this.shortdetails;
    data['product_thumimage'] = this.productThumimage;
    data['price_mrp'] = this.priceMrp;
    data['price_msp'] = this.priceMsp;
    data['date'] = this.date;
    data['Itemtotal'] = this.itemtotal;
    data['category_id'] = this.categoryId;
    return data;
  }
}
