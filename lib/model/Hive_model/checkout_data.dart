// To parse this JSON data, do
//
//     final CheckoutDataModel = CheckoutDataModelFromJson(jsonString);

import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';

part 'checkout_data.g.dart';

CheckoutDataModel CheckoutDataModelFromJson(String str) =>
    CheckoutDataModel.fromJson(json.decode(str));

String CheckoutDataModelToJson(CheckoutDataModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 10)
class CheckoutDataModel extends HiveObject {
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
  List<AllItem> allItem;
  @HiveField(14)
  String offer;
  @HiveField(15)
  String rakList;
  @HiveField(16)
  String note;

  CheckoutDataModel({
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
    required this.allItem,
    required this.offer,
    required this.rakList,
    required this.note,
  });

  factory CheckoutDataModel.fromJson(Map<String, dynamic> json) =>
      CheckoutDataModel(
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
        allItem: List<AllItem>.from(
            json["all_item"].map((x) => AllItem.fromJson(x)) ?? []),
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
        "all_item": List<dynamic>.from(allItem.map((x) => x.toJson())),
        "offer": offer,
        "rak_list": rakList,
        "note": note,
      };
}

@HiveType(typeId: 11)
class AllItem extends HiveObject {
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
  String? ctn;
  @HiveField(26)
  String? itemChain;
  @HiveField(27)
   String? approvedPrice;
  @HiveField(28)
   String? totalPrice;
  @HiveField(29)
  String? discountInput;
  @HiveField(30)
  String? pcs;
  @HiveField(31)
  String? totalPcs;

  AllItem(
      {this.itemRowId,
      required this.itemId,
       required this.itemName,
      this.itemSize,
      this.itemUnit,
      this.itemCode,
      this.companyId,
      this.companyName,
      this.brandId,
      this.brandName,
      this.typeId,
      this.typeName,
      this.flavorId,
      this.flavorName,
      this.invoicePrice,
      required this.tradePrice,
      required this.ctnPcsRatio,
      this.itemCarton,
      this.sequenceNo,
      this.stockCoverDays,
      this.itemVat,
      required this.itemAvatar,
      this.itemPromo,
      this.stockQty,
     required this.pcs,
     required this.ctn,
      this.approvedPrice,
     required this.totalPrice,
     required this.discountInput,
     required this.totalPcs,
      });

  factory AllItem.fromJson(Map<String, dynamic> json) => AllItem(
        itemId: json["item_id"] ?? '',
        itemName: json["item_name"] ?? '',
        tradePrice: json["item_price"] ?? '',
        pcs: json["pcs"] ?? '',
        ctn: json["ctn"] ?? '',
        totalPcs: json["total_pcs"] ?? '',
        discountInput: json["discount_Input"] ?? '',
        totalPrice: json["total_price"] ?? '', ctnPcsRatio: json["ctn_pcs_ratio"], itemAvatar: json["item_avatar"],
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "item_name": itemName,
        "item_price": tradePrice,
        "pcs": pcs,
        "ctn": ctn,
        "total_pcs": totalPcs,
        "discount_Input": discountInput,
        "total_price": totalPrice,
        "ctn_pcs_ratio": ctnPcsRatio,
        "item_avatar": itemAvatar,
      };
}
