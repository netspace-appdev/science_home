class ProductDetailResponse {
  int? code;
  String? status;
  Data? data;

  ProductDetailResponse({this.code, this.status, this.data});

  ProductDetailResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
class Data {
  int? productId;
  String? productTitle;
  int? priceMrp;
  String? priceMsp;
  List<String>? productImages; // Updated to List<String>
  String? productThumimage;
  String? alias;
  int? orderby;
  String? shortdetails;
  String? longDescription;

  Data({
    this.productId,
    this.productTitle,
    this.priceMrp,
    this.priceMsp,
    this.productImages,
    this.productThumimage,
    this.alias,
    this.orderby,
    this.shortdetails,
    this.longDescription,
  });

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productTitle = json['product_title'];
    priceMrp = json['price_mrp'];
    priceMsp = json['price_msp'];

    // Parse the product_images string into a List<String>
    productImages = json['product_images'] != null
        ? (json['product_images'] as String)
        .replaceAll('[', '')
        .replaceAll(']', '')
        .split(', ')
        : null;

    productThumimage = json['product_thumimage'];
    alias = json['alias'];
    orderby = json['orderby'];
    shortdetails = json['shortdetails'];
    longDescription = json['long_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_title'] = productTitle;
    data['price_mrp'] = priceMrp;
    data['price_msp'] = priceMsp;

    // Convert List<String> to a string representation
    data['product_images'] = productImages != null
        ? '[${productImages!.join(', ')}]'
        : null;

    data['product_thumimage'] = productThumimage;
    data['alias'] = alias;
    data['orderby'] = orderby;
    data['shortdetails'] = shortdetails;
    data['long_description'] = longDescription;
    return data;
  }
}

