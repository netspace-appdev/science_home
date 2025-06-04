class GenerateOrderId {
  String? orderid;
  String? status;
  int? code;

  GenerateOrderId({this.orderid, this.status, this.code});

  GenerateOrderId.fromJson(Map<String, dynamic> json) {
    orderid = json['orderid'];
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderid'] = this.orderid;
    data['status'] = this.status;
    data['code'] = this.code;
    return data;
  }
}
