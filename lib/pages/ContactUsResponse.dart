class ContactUsResponse {
  int? code;
  String? status;
  List<Data>? data;

  ContactUsResponse({this.code, this.status, this.data});

  ContactUsResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? number;
  String? subject;
  String? message;

  Data(
      {this.id,
        this.name,
        this.email,
        this.number,
        this.subject,
        this.message});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    number = json['number'];
    subject = json['subject'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['number'] = this.number;
    data['subject'] = this.subject;
    data['message'] = this.message;
    return data;
  }
}
