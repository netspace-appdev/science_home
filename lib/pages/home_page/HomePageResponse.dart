class Homepageresponse {
  int? code;
  String? status;
  List<DataResponse>? data;

  Homepageresponse({this.code, this.status, this.data});

  Homepageresponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = <DataResponse>[];
      json['data'].forEach((v) {
        data!.add(new DataResponse.fromJson(v));
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

class DataResponse {
  int? id;
  String? title;
  String? description;
  String? shortdetails;
  String? categoryImage;
  String? categoryThumimage;
  String? alias;
  int? orderby;

  DataResponse(
      {this.id,
        this.title,
        this.description,
        this.shortdetails,
        this.categoryImage,
        this.categoryThumimage,
        this.alias,
        this.orderby});

  DataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    shortdetails = json['shortdetails'];
    categoryImage = json['category_image'];
    categoryThumimage = json['category_thumimage'];
    alias = json['alias'];
    orderby = json['orderby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['shortdetails'] = this.shortdetails;
    data['category_image'] = this.categoryImage;
    data['category_thumimage'] = this.categoryThumimage;
    data['alias'] = this.alias;
    data['orderby'] = this.orderby;
    return data;
  }
}
