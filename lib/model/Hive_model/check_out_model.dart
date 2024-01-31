// To parse this JSON data, do
//
//     final CheckOutModel = CheckOutModelFromJson(jsonString);

import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';

part 'check_out_model.g.dart';

CheckOutModel CheckOutModelFromJson(String str) =>
    CheckOutModel.fromJson(json.decode(str));

String CheckOutModelToJson(CheckOutModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 14)
class CheckOutModel extends HiveObject {
  @HiveField(0)
  String cid;
  @HiveField(1)
  String userId;
  @HiveField(2)
  String userPass;
  @HiveField(3)
  String deviceId;
  @HiveField(4)
  String clientId;
  @HiveField(5)
  String clientName;
  @HiveField(6)
  String orderDate;
  @HiveField(7)
  String orderTime;
  @HiveField(8)
  String deliveryDate;
  @HiveField(9)
  String deliveryTime;
  @HiveField(10)
  String paymentMode;
  @HiveField(11)
  String latitude;
  @HiveField(12)
  String longitude;
  @HiveField(13)
  List<ItemListOrder> itemListOrder;
  @HiveField(14)
  String offer;
  @HiveField(15)
  String rakList;
  @HiveField(16)
  String note;

  CheckOutModel({
    required this.cid,
    required this.userId,
    required this.userPass,
    required this.deviceId,
    required this.clientId,
    required this.clientName,
    required this.orderDate,
    required this.orderTime,
    required this.deliveryDate,
    required this.deliveryTime,
    required this.paymentMode,
    required this.latitude,
    required this.longitude,
    required this.itemListOrder,
    required this.offer,
    required this.rakList,
    required this.note,
  });

  factory CheckOutModel.fromJson(Map<String, dynamic> json) =>
      CheckOutModel(
        cid: json["cid"] ?? "",
        userId: json["user_id"] ?? '',
        userPass: json["user_pass"] ?? '',
        deviceId: json["device_id"] ?? '',
        clientId: json["client_id"] ?? '',
        clientName: json["client_name"] ?? '',
        orderDate: json["order_date"],
        orderTime: json["order_time"],
        deliveryDate: json["delivery_date"],
        deliveryTime: json["delivery_time"],
        paymentMode: json["payment_mode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        itemListOrder: List<ItemListOrder>.from(
            json["item_list"].map((x) => ItemListOrder.fromJson(x)) ?? []),
        offer: json["offer"],
        rakList: json["rak_list"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "user_id": userId,
        "user_pass": userPass,
        "device_id": deviceId,
        "client_id": clientId,
        "client_name": clientName,
        "order_date": orderDate,
        "order_time": orderTime,
        "delivery_date": deliveryDate,
        "delivery_time": deliveryTime,
        "payment_mode": paymentMode,
        "latitude": latitude,
        "longitude": longitude,
        "item_list": List<dynamic>.from(itemListOrder.map((x) => x.toJson())),
        "offer": offer,
        "rak_list": rakList,
        "note": note,
      };
}

@HiveType(typeId: 15)
class ItemListOrder extends HiveObject {
  @HiveField(0)
  String? itemRowId;
  @HiveField(1)
  String? itemId;
  @HiveField(2)
  String? itemSize;
  @HiveField(3)
  String? itemUnit;
  @HiveField(4)
  String? itemCode;
  @HiveField(5)
  String? itemName;
  @HiveField(6)
  String? companyId;
  @HiveField(7)
  String? companyName;
  @HiveField(8)
  String? brandId;
  @HiveField(9)
  String? brandName;
  @HiveField(10)
  String? typeId;
  @HiveField(11)
  String? typeName;
  @HiveField(12)
  String? flavorId;
  @HiveField(13)
  String? flavorName;
  @HiveField(14)
  String? invoicePrice;
  @HiveField(15)
  String? tradePrice;
  @HiveField(16)
  String? ctnPcsRatio;
  @HiveField(17)
  String? itemCarton;
  @HiveField(18)
  String? sequenceNo;
  @HiveField(19)
  String? stockCoverDays;
  @HiveField(20)
  String? itemVat;
  @HiveField(21)
  String? itemAvatar;
  @HiveField(22)
  String? itemPromo;
  @HiveField(23)
  String? stockQty;
  @HiveField(24)
  String? qty;
  @HiveField(25)
  String? itemPcs;
  @HiveField(26)
  String? itemChain;
  @HiveField(27)
  final String? approvedPrice;
  @HiveField(28)
  final String? discountRate;
  @HiveField(29)
  final String? discountInput;

  ItemListOrder(
      {this.itemRowId,
      required this.itemId,
      this.itemSize,
      this.itemUnit,
      this.itemCode,
      required this.itemName,
      this.companyId,
      this.companyName,
      required this.brandId,
       required this.brandName,
      this.typeId,
      this.typeName,
      this.flavorId,
      this.flavorName,
      this.invoicePrice,
      required this.tradePrice,
      this.ctnPcsRatio,
      this.itemCarton,
      this.sequenceNo,
      this.stockCoverDays,
      this.itemVat,
      this.itemAvatar,
      this.itemPromo,
      this.stockQty,
      required this.qty,
      this.itemPcs,
      this.itemChain,
      this.approvedPrice,
       this.discountRate,
      this.discountInput});

  factory ItemListOrder.fromJson(Map<String, dynamic> json) => ItemListOrder(
        itemId: json["id"] ?? '',
        itemName: json["name"] ?? '',
        tradePrice: json["price"] ?? '',
        qty: json["quantity"] ?? '', 
        brandId: json["brand_id"]??'',
        approvedPrice: json["approved_price"]??'',
        brandName: json["brand_name"]??'',
        
      );

  Map<String, dynamic> toJson() => {
        "id": itemId,
        "name": itemName,
        "price": tradePrice,
        "quantity": qty,
        "approved_price": approvedPrice,
        "brand_id": brandId,
        "brand_name": brandName,
      };
}
