import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'stock_model.g.dart';


StockModel stockModelFromJson(String str) => StockModel.fromJson(json.decode(str));

String stockModelToJson(StockModel data) => json.encode(data.toJson());

class StockModel extends HiveObject {

    final int status;

    final String message;

    final StockReturnList stockReturnList;

    StockModel({
        required this.status,
        required this.message,
        required this.stockReturnList,
    });

    factory StockModel.fromJson(Map<String, dynamic> json) => StockModel(
        status: json["status"],
        message: json["message"],
        stockReturnList: StockReturnList.fromJson(json["ret_str"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "ret_str": stockReturnList.toJson(),
    };
}
@HiveType(typeId: 17)
class StockReturnList extends HiveObject {
      @HiveField(0)
    final String cid;
      @HiveField(1)
    final String userId;
      @HiveField(2)
    final String userName;
      @HiveField(3)
    final String userMobile;
      @HiveField(4)
    final String userType;
      @HiveField(5)
    final String depotId;
      @HiveField(6)
    final List<BrandListStock> brandListStock;

    StockReturnList({
        required this.cid,
        required this.userId,
        required this.userName,
        required this.userMobile,
        required this.userType,
        required this.depotId,
        required this.brandListStock,
    });

    factory StockReturnList.fromJson(Map<String, dynamic> json) => StockReturnList(
        cid: json["cid"]??"",
        userId: json["user_id"]??"",
        userName: json["user_name"]??"",
        userMobile: json["user_mobile"]??"",
        userType: json["user_type"]??"",
        depotId: json["depot_id"]??"",
        brandListStock: List<BrandListStock>.from(json["brand_list"].map((x) => BrandListStock.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cid": cid,
        "user_id": userId,
        "user_name": userName,
        "user_mobile": userMobile,
        "user_type": userType,
        "depot_id": depotId,
        "brand_list": List<dynamic>.from(brandListStock.map((x) => x.toJson())),
    };
}
@HiveType(typeId: 18)
class BrandListStock extends HiveObject {
    @HiveField(0)
    final String brandRowId;
      @HiveField(1)
    final String brandId;
      @HiveField(2)
    final String brandName;
      @HiveField(3)
    final List<ItemListStock> itemListStock;

    BrandListStock({
        required this.brandRowId,
        required this.brandId,
        required this.brandName,
        required this.itemListStock,
    });

    factory BrandListStock.fromJson(Map<String, dynamic> json) => BrandListStock(
        brandRowId: json["brand_row_id"]??"",
        brandId: json["brand_id"]!??"",
        brandName: json["brand_name"]!??"",
        itemListStock: List<ItemListStock>.from(json["item_list"].map((x) => ItemListStock.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "brand_row_id": brandRowId,
        "brand_id": brandId,
        "brand_name": brandName,
        "item_list": List<dynamic>.from(itemListStock.map((x) => x.toJson())),
    };
}

@HiveType(typeId: 19)
class ItemListStock  extends HiveObject{
    @HiveField(0)
    final String itemRowId;
      @HiveField(1)
    final String itemId;
      @HiveField(2)
    final String itemSize;
      @HiveField(3)
    final String itemUnit;
      @HiveField(4)
    final String itemCode;
      @HiveField(5)
    final String itemName;
      @HiveField(6)
    final String companyId;
      @HiveField(7)
    final String companyName;
      @HiveField(8)
    final String brandId;
      @HiveField(9)
    final String brandName;
      @HiveField(10)
    final String typeId;
      @HiveField(11)
    final String typeName;
      @HiveField(12)
    final String flavorId;
      @HiveField(13)
    final String flavorName;
      @HiveField(14)
    final String invoicePrice;
      @HiveField(15)
    final String tradePrice;
      @HiveField(16)
    final String ctnPcsRatio;
      @HiveField(17)
    final String itemCarton;
      @HiveField(18)
    final String itemChain;
      @HiveField(19)
    final String sequenceNo;
      @HiveField(20)
    final String stockCoverDays;
      @HiveField(21)
    final String itemVat;
      @HiveField(22)
    final String stockQty;

    ItemListStock({
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
        required this.itemChain,
        required this.sequenceNo,
        required this.stockCoverDays,
        required this.itemVat,
        required this.stockQty,
    });

    factory ItemListStock.fromJson(Map<String, dynamic> json) => ItemListStock(
        itemRowId: json["item_row_id"]??"",
        itemId: json["item_id"]??"",
        itemSize: json["item_size"]!??"",
        itemUnit: json["item_unit"]!??"",
        itemCode: json["item_code"]??"",
        itemName: json["item_name"]??"",
        companyId: json["company_id"]!??"",
        companyName:json["company_name"]!??"",
        brandId: json["brand_id"]!??"",
        brandName: json["brand_name"]!??"",
        typeId:json["type_id"]!??"",
        typeName: json["type_name"]!??"",
        flavorId: json["flavor_id"]??"",
        flavorName: json["flavor_name"]??"",
        invoicePrice: json["invoice_price"]??"",
        tradePrice: json["trade_price"]??"",
        ctnPcsRatio: json["ctn_pcs_ratio"]??"",
        itemCarton: json["item_carton"]??"",
        itemChain: json["item_chain"]??"",
        sequenceNo: json["sequence_no"]??"",
        stockCoverDays: json["stock_cover_days"]??"",
        itemVat: json["item_vat"]??"",
        stockQty: json["stock_qty"]??"",
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
        "item_chain": itemChain,
        "sequence_no": sequenceNo,
        "stock_cover_days": stockCoverDays,
        "item_vat": itemVat,
        "stock_qty": stockQty,
    };
}


