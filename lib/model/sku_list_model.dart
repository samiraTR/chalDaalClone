

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'sku_list_model.g.dart';

SkuListModel skuListModelFromJson(String str) => SkuListModel.fromJson(json.decode(str));

String skuListModelToJson(SkuListModel data) => json.encode(data.toJson());

class SkuListModel {
  final int status;
  final String message;
  final RetStr retStr;

  SkuListModel({
    required this.status,
    required this.message,
    required this.retStr,
  });

  factory SkuListModel.fromJson(Map<String, dynamic> json) => SkuListModel(
        status: json["status"],
        message: json["message"],
        retStr: RetStr.fromJson(json["ret_str"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "ret_str": retStr.toJson(),
      };
}
@HiveType(typeId: 0)
class RetStr extends HiveObject {
  @HiveField(0)
   String cid;
   @HiveField(1)
   String userId;
   @HiveField(2)
   String userName;
   @HiveField(3)
   String userMobile;
   @HiveField(4)
   String userType;
   @HiveField(5)
   String depotId;
   @HiveField(6)
   List<BrandList> brandList;

  RetStr({
    required this.cid,
    required this.userId,
    required this.userName,
    required this.userMobile,
    required this.userType,
    required this.depotId,
    required this.brandList,
  });

  factory RetStr.fromJson(Map<String, dynamic> json) => RetStr(
        cid: json["cid"]??"",
        userId: json["user_id"]??"",
        userName: json["user_name"]??"",
        userMobile: json["user_mobile"]??"",
        userType: json["user_type"]??"",
        depotId: json["depot_id"]??"",
        brandList: List<BrandList>.from(json["brand_list"].map((x) => BrandList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "user_id": userId,
        "user_name": userName,
        "user_mobile": userMobile,
        "user_type": userType,
        "depot_id": depotId,
        "brand_list": List<dynamic>.from(brandList.map((x) => x.toJson())),
      };
}
@HiveType(typeId: 1)
class BrandList extends HiveObject {
  @HiveField(0)
   String brandRowId;
   @HiveField(1)
   String brandId;
   @HiveField(2)
   String brandName;
   @HiveField(3)
   String brandImage;
   @HiveField(4)
   List<ItemList> itemList;

  BrandList({
    required this.brandRowId,
    required this.brandId,
    required this.brandName,
    required this.brandImage,
    required this.itemList,
  });

  factory BrandList.fromJson(Map<String, dynamic> json) => BrandList(
        brandRowId: json["brand_row_id"]??"",
        brandId: json["brand_id"]??"",
        brandName: json["brand_name"]??"",
        brandImage: json["brand_image"]??"",
        itemList: List<ItemList>.from(json["item_list"].map((x) => ItemList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "brand_row_id": brandRowId,
        "brand_id": brandId,
        "brand_name": brandName,
        "brand_image": brandImage,
        "item_list": List<dynamic>.from(itemList.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 2)
class ItemList extends HiveObject {
    @HiveField(0)
   String itemRowId;
     @HiveField(1)
   String itemId;
     @HiveField(2)
   String itemSize;

     @HiveField(3)
   String itemUnit;
     @HiveField(4)
   String itemCode;
     @HiveField(5)
   String itemName;
     @HiveField(6)
   String companyId;
     @HiveField(7)
   String companyName;
     @HiveField(8)
   String brandId;
     @HiveField(9)
   String brandName;
     @HiveField(10)
   String typeId;
     @HiveField(11)
   String typeName;
     @HiveField(12)
   String flavorId;
     @HiveField(13)
   String flavorName;
     @HiveField(14)
   String invoicePrice;
     @HiveField(15)
   String tradePrice;
     @HiveField(16)
   String ctnPcsRatio;
     @HiveField(17)
   String itemCarton;
     @HiveField(18)
   String sequenceNo;
     @HiveField(19)
   String stockCoverDays;
     @HiveField(20)
   String itemVat;
     @HiveField(21)
   String itemAvatar;
     @HiveField(22)
   String itemPromo;
     @HiveField(23)
   String stockQty;
     @HiveField(24)
   String itemChain;
     @HiveField(25)
   String approvedPrice;

  ItemList({
    required this.itemRowId,
    required this.itemId,
    required this.itemSize,
    required this.itemUnit,
    required this.itemCode,
    required this.itemName,
    required this.companyId,
    required this.companyName,
    required this.brandId,
    required this.brandName,
    required this.typeId,
    required this.typeName,
    required this.flavorId,
    required this.flavorName,
    required this.invoicePrice,
    required this.tradePrice,
    required this.ctnPcsRatio,
    required this.itemCarton,
    required this.sequenceNo,
    required this.stockCoverDays,
    required this.itemVat,
    required this.itemAvatar,
    required this.itemPromo,
    required this.stockQty,
    required this.itemChain,
    required this.approvedPrice,
  });

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
        itemRowId: json["item_row_id"]??"",
        itemId: json["item_id"]??"",
        itemSize: json["item_size"]??"",
        itemUnit: json["item_unit"]??"",
        itemCode: json["item_code"]??"",
        itemName: json["item_name"]??"",
        companyId: json["company_id"]??"",
        companyName: json["company_name"]??"",
        brandId: json["brand_id"]??"",
        brandName: json["brand_name"]??"",
        typeId: json["type_id"]??"",
        typeName: json["type_name"]??"",
        flavorId: json["flavor_id"]??"",
        flavorName: json["flavor_name"]??"",
        invoicePrice: json["invoice_price"]??"",
        tradePrice: json["trade_price"]??"",
        ctnPcsRatio: json["ctn_pcs_ratio"]??"",
        itemCarton: json["item_carton"]??"",
        sequenceNo: json["sequence_no"]??"",
        stockCoverDays: json["stock_cover_days"]??"",
        itemVat: json["item_vat"]??"",
        itemAvatar: json["item_avatar"]??"",
        itemPromo: json["item_promo"]??"",
        stockQty: json["stock_qty"] == "" ? "0" : json["stock_qty"],
        itemChain: json["item_chain"]??"",
        approvedPrice: json["approved_price"]??"",
      );

  Map<String, dynamic> toJson() => {
        "item_row_id": itemRowId,
        "item_id": itemId,
        "item_size": itemSize,
        "item_unit": itemUnit,
        "item_code": itemCode,
        "item_name": itemName,
        "company_id": companyId,
        "company_name": companyName,
        "brand_id": brandId,
        "brand_name": brandName,
        "type_id": typeId,
        "type_name": typeName,
        "flavor_id": flavorId,
        "flavor_name": flavorName,
        "invoice_price": invoicePrice,
        "trade_price": tradePrice,
        "ctn_pcs_ratio": ctnPcsRatio,
        "item_carton": itemCarton,
        "sequence_no": sequenceNo,
        "stock_cover_days": stockCoverDays,
        "item_vat": itemVat,
        "item_avatar": itemAvatar,
        "item_promo": itemPromo,
        "stock_qty": stockQty,
        "item_chain": itemChain,
        "approved_price": approvedPrice,
      };
}


