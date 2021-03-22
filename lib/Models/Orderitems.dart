import 'dart:convert';


class Orderitem {

  static List<Orderitem> listOrderitemFromJson(String str) => List<Orderitem>.from(json.decode(str).map((x) => Orderitem.fromJson(x)));
  static String listOrderitemToJson(List<Orderitem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  static Orderitem OrderitemFromJson(String str) => Orderitem.fromJson(json.decode(str));
  static String OrderitemToJson(Orderitem data) => json.encode(data.toJson());

  Orderitem({
    this.sizeName,
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.totalprice,
    this.salesType,
    this.havetopping,
    this.IsDeal,
    this.orderItemStatus,
    this.sizeid,
    this.orderId,
    this.productid,
    this.discountId,
    this.discount,
    this.dealId,
    this.discountedPrice,
    this.chair,
  });
  String name;
  double price;
  double quantity;
  double totalprice;
  bool havetopping,IsDeal;
  int sizeid;
  int productid;
  int chair;
  dynamic sizeName;
  int id;
  int salesType;
  int orderItemStatus;
  int orderId;
  dynamic discountId;
  dynamic discount;
  int dealId;
  double discountedPrice;

  factory Orderitem.fromJson(Map<String, dynamic> json) => Orderitem(
    sizeName: json["sizeName"],
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    totalprice: json["totalPrice"] == null ? null : json["totalPrice"],
    salesType: json["salesType"] == null ? null : json["salesType"],
    havetopping: json["haveTopping"] == null ? null : json["haveTopping"],
    IsDeal: json["isDeal"] == null ? null : json["isDeal"],
    orderItemStatus: json["orderItemStatus"] == null ? null : json["orderItemStatus"],
    sizeid: json["sizeId"]==null?null:json["sizeId"],
    orderId: json["orderId"] == null ? null : json["orderId"],
    productid: json["productId"]==null?null:json["productId"],
    discountId: json["discountId"]==null?null:json["discountId"],
    discount: json["discount"]==null?null:json["discount"],
    dealId: json["dealId"] == null ? null : json["dealId"],
    discountedPrice: json["discountedPrice"] == null ? null : json["discountedPrice"],
    chair: json["chairId"]==null?null:json["chairId"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "quantity": quantity,
    "totalprice": totalprice,
    "havetopping": havetopping,
    "IsDeal":IsDeal==null?null:IsDeal,
    "sizeid": sizeid,
    "productid": productid,
    "dealid":dealId==null?null:dealId,
    "ChairId":chair==null?null:chair,
  };
}