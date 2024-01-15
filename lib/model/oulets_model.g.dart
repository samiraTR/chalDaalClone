// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oulets_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OutletReturnListAdapter extends TypeAdapter<OutletReturnList> {
  @override
  final int typeId = 4;

  @override
  OutletReturnList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OutletReturnList(
      cid: fields[0] as String,
      userId: fields[1] as String,
      userName: fields[2] as String,
      userMobile: fields[3] as String,
      userType: fields[4] as String,
      visitPlanDate: fields[5] as String,
      visitPlanDay: fields[6] as String,
      deliveryDate: fields[7] as String,
      deliveryDay: fields[8] as String,
      visitPlan: fields[9] as VisitPlan,
    );
  }

  @override
  void write(BinaryWriter writer, OutletReturnList obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.cid)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.userMobile)
      ..writeByte(4)
      ..write(obj.userType)
      ..writeByte(5)
      ..write(obj.visitPlanDate)
      ..writeByte(6)
      ..write(obj.visitPlanDay)
      ..writeByte(7)
      ..write(obj.deliveryDate)
      ..writeByte(8)
      ..write(obj.deliveryDay)
      ..writeByte(9)
      ..write(obj.visitPlan);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OutletReturnListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VisitPlanAdapter extends TypeAdapter<VisitPlan> {
  @override
  final int typeId = 5;

  @override
  VisitPlan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisitPlan(
      cid: fields[0] as String,
      repId: fields[1] as String,
      repName: fields[2] as String,
      visitPlanName: fields[3] as String,
      visitPlanNameBn: fields[4] as String,
      orderColDay: fields[5] as String,
      deliveryDay: fields[6] as String,
      beatId: fields[7] as String,
      beatName: fields[8] as String,
      routeId: fields[9] as String,
      routeName: fields[10] as String,
      depotId: fields[11] as String,
      depotName: fields[12] as String,
      clients: (fields[13] as List).cast<Client>(),
    );
  }

  @override
  void write(BinaryWriter writer, VisitPlan obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.cid)
      ..writeByte(1)
      ..write(obj.repId)
      ..writeByte(2)
      ..write(obj.repName)
      ..writeByte(3)
      ..write(obj.visitPlanName)
      ..writeByte(4)
      ..write(obj.visitPlanNameBn)
      ..writeByte(5)
      ..write(obj.orderColDay)
      ..writeByte(6)
      ..write(obj.deliveryDay)
      ..writeByte(7)
      ..write(obj.beatId)
      ..writeByte(8)
      ..write(obj.beatName)
      ..writeByte(9)
      ..write(obj.routeId)
      ..writeByte(10)
      ..write(obj.routeName)
      ..writeByte(11)
      ..write(obj.depotId)
      ..writeByte(12)
      ..write(obj.depotName)
      ..writeByte(13)
      ..write(obj.clients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitPlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ClientAdapter extends TypeAdapter<Client> {
  @override
  final int typeId = 6;

  @override
  Client read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Client(
      clientId: fields[0] as String,
      clientOldId: fields[1] as String,
      clientName: fields[2] as String,
      clientNameBn: fields[3] as String,
      ownerName: fields[4] as String,
      ownerNameBn: fields[5] as String,
      customerGrade: fields[6] as String,
      categoryId: fields[7] as String,
      categoryName: fields[9] as String,
      shortName: fields[10] as String,
      contactNo1: fields[11] as String,
      depotId: fields[12] as String,
      depotName: fields[13] as String,
      clientPosm: fields[14] as String,
      latitude: fields[15] as String,
      longitude: fields[16] as String,
      orderStatus: fields[17] as String,
      clientRak: fields[18] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Client obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.clientId)
      ..writeByte(1)
      ..write(obj.clientOldId)
      ..writeByte(2)
      ..write(obj.clientName)
      ..writeByte(3)
      ..write(obj.clientNameBn)
      ..writeByte(4)
      ..write(obj.ownerName)
      ..writeByte(5)
      ..write(obj.ownerNameBn)
      ..writeByte(6)
      ..write(obj.customerGrade)
      ..writeByte(7)
      ..write(obj.categoryId)
      ..writeByte(9)
      ..write(obj.categoryName)
      ..writeByte(10)
      ..write(obj.shortName)
      ..writeByte(11)
      ..write(obj.contactNo1)
      ..writeByte(12)
      ..write(obj.depotId)
      ..writeByte(13)
      ..write(obj.depotName)
      ..writeByte(14)
      ..write(obj.clientPosm)
      ..writeByte(15)
      ..write(obj.latitude)
      ..writeByte(16)
      ..write(obj.longitude)
      ..writeByte(17)
      ..write(obj.orderStatus)
      ..writeByte(18)
      ..write(obj.clientRak);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
