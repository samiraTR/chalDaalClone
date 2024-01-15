import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
part 'oulets_model.g.dart';

OutletsListModel outletsListModelFromJson(String str) => OutletsListModel.fromJson(json.decode(str));
String outletsListModelToJson(OutletsListModel data) => json.encode(data.toJson());

class OutletsListModel {
    int status;
    String message;
    OutletReturnList outletReturnList;

    OutletsListModel({
        required this.status,
        required this.message,
        required this.outletReturnList,
    });

    factory OutletsListModel.fromJson(Map<String, dynamic> json) => OutletsListModel(
        status: json["status"],
        message: json["message"],
        outletReturnList: OutletReturnList.fromJson(json["ret_str"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "ret_str": outletReturnList.toJson(),
    };
}


@HiveType(typeId: 4)
class OutletReturnList extends HiveObject  {
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
    String visitPlanDate;
      @HiveField(6)
    String visitPlanDay;
      @HiveField(7)
    String deliveryDate;
      @HiveField(8)
    String deliveryDay;
      @HiveField(9)
    VisitPlan visitPlan;

    OutletReturnList({
        required this.cid,
        required this.userId,
        required this.userName,
        required this.userMobile,
        required this.userType,
        required this.visitPlanDate,
        required this.visitPlanDay,
        required this.deliveryDate,
        required this.deliveryDay,
        required this.visitPlan,
    });

    factory OutletReturnList.fromJson(Map<String, dynamic> json) => OutletReturnList(
        cid: json["cid"]??"",
        userId: json["user_id"]??"",
        userName: json["user_name"]??"",
        userMobile: json["user_mobile"]??"",
        userType: json["user_type"]??"",
        visitPlanDate: json["visit_plan_date"]??"",
        visitPlanDay: json["visit_plan_day"]??"",
        deliveryDate:json["delivery_date"]??"",
        deliveryDay: json["delivery_day"]??"",
        visitPlan: VisitPlan.fromJson(json["visit_plan"]),
    );

    Map<String, dynamic> toJson() => {
        "cid": cid,
        "user_id": userId,
        "user_name": userName,
        "user_mobile": userMobile,
        "user_type": userType,
        "visit_plan_date": visitPlanDate,
        "visit_plan_day": visitPlanDay,
        "delivery_date": deliveryDate,
        "delivery_day": deliveryDay,
        "visit_plan": visitPlan.toJson(),
    };
}
@HiveType(typeId: 5)
class VisitPlan extends HiveObject  {
   @HiveField(0)
    String cid;
    @HiveField(1)
    String repId;
    @HiveField(2)
    String repName;
    @HiveField(3)
    String visitPlanName;
    @HiveField(4)
    String visitPlanNameBn;
    @HiveField(5)
    String orderColDay;
    @HiveField(6)
    String deliveryDay;
    @HiveField(7)
    String beatId;
    @HiveField(8)
    String beatName;
    @HiveField(9)
    String routeId;
    @HiveField(10)
    String routeName;
    @HiveField(11)
    String depotId;
    @HiveField(12)
    String depotName;
    @HiveField(13)
    List<Client> clients;

    VisitPlan({
        required this.cid,
        required this.repId,
        required this.repName,
        required this.visitPlanName,
        required this.visitPlanNameBn,
        required this.orderColDay,
        required this.deliveryDay,
        required this.beatId,
        required this.beatName,
        required this.routeId,
        required this.routeName,
        required this.depotId,
        required this.depotName,
        required this.clients,
    });

    factory VisitPlan.fromJson(Map<String, dynamic> json) => VisitPlan(
        cid: json["cid"]??"",
        repId: json["rep_id"]??"",
        repName: json["rep_name"]??"",
        visitPlanName: json["visit_plan_name"]??"",
        visitPlanNameBn: json["visit_plan_name_bn"]??"",
        orderColDay: json["order_col_day"]??"",
        deliveryDay: json["delivery_day"]??"",
        beatId: json["beat_id"]??"",
        beatName: json["beat_name"]??"",
        routeId: json["route_id"]??"",
        routeName: json["route_name"]??"",
        depotId: json["depot_id"]!??"",
        depotName: json["depot_name"]!??"",
        clients: List<Client>.from(json["clients"].map((x) => Client.fromJson(x))) ?? [],
    );

    Map<String, dynamic> toJson() => {
        "cid": cid,
        "rep_id": repId,
        "rep_name": repName,
        "visit_plan_name": visitPlanName,
        "visit_plan_name_bn": visitPlanNameBn,
        "order_col_day": orderColDay,
        "delivery_day": deliveryDay,
        "beat_id": beatId,
        "beat_name": beatName,
        "route_id": routeId,
        "route_name": routeName,
        "depot_id": depotId,
        "depot_name": depotName,
        "clients": List<dynamic>.from(clients.map((x) => x.toJson())),
    };
}
@HiveType(typeId: 6)
class Client extends HiveObject  {
  @HiveField(0)
    String clientId;
    @HiveField(1)
    String clientOldId;
    @HiveField(2)
    String clientName;
    @HiveField(3)
    String clientNameBn;
    @HiveField(4)
    String ownerName;
    @HiveField(5)
    String ownerNameBn;
    @HiveField(6)
    String customerGrade;
    @HiveField(7)
    String categoryId;
    @HiveField(9)
    String categoryName;
    @HiveField(10)
    String shortName;
    @HiveField(11)
    String contactNo1;
    @HiveField(12)
    String depotId;
    @HiveField(13)
    String depotName;
    @HiveField(14)
    String clientPosm;
    @HiveField(15)
    String latitude;
    @HiveField(16)
    String longitude;
    @HiveField(17)
    String orderStatus;
    @HiveField(18)
    String clientRak;

    Client({
        required this.clientId,
        required this.clientOldId,
        required this.clientName,
        required this.clientNameBn,
        required this.ownerName,
        required this.ownerNameBn,
        required this.customerGrade,
        required this.categoryId,
        required this.categoryName,
        required this.shortName,
        required this.contactNo1,
        required this.depotId,
        required this.depotName,
        required this.clientPosm,
        required this.latitude,
        required this.longitude,
        required this.orderStatus,
        required this.clientRak,
    });

    factory Client.fromJson(Map<String, dynamic> json) => Client(
        clientId: json["client_id"]??"",
        clientOldId: json["client_old_id"]??"",
        clientName: json["client_name"]??"",
        clientNameBn: json["client_name_bn"]??"",
        ownerName: json["owner_name"]!??"",
        ownerNameBn: json["owner_name_bn"]??"",
        customerGrade: json["customer_grade"]!??"",
        categoryId: json["category_id"]!??"",
        categoryName: json["category_name"]!??"",
        shortName: json["short_name"]??"",
        contactNo1: json["contact_no1"]??"",
        depotId: json["depot_id"]!??"",
        depotName: json["depot_name"]!??"",
        clientPosm: json["client_posm"]??"",
        latitude: json["latitude"]??"",
        longitude: json["longitude"]??"",
        orderStatus: json["order_status"]!??"",
        clientRak: json["client_rak"]??"",
    );

    Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "client_old_id": clientOldId,
        "client_name": clientName,
        "client_name_bn": clientNameBn,
        "owner_name": ownerName,
        "owner_name_bn": ownerNameBn,
        "customer_grade": customerGrade,
        "category_id": categoryId,
        "category_name": categoryName,
        "short_name": shortName,
        "contact_no1": contactNo1,
        "depot_id": depotId,
        "depot_name": depotName,
        "client_posm": clientPosm,
        "latitude": latitude,
        "longitude": longitude,
        "order_status": orderStatus,
        "client_rak": clientRak,
    };
}

