// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sku_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RetStrAdapter extends TypeAdapter<RetStr> {
  @override
  final int typeId = 0;

  @override
  RetStr read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RetStr(
      cid: fields[0] as String,
      userId: fields[1] as String,
      userName: fields[2] as String,
      userMobile: fields[3] as String,
      userType: fields[4] as String,
      depotId: fields[5] as String,
      brandList: (fields[6] as List).cast<BrandList>(),
    );
  }

  @override
  void write(BinaryWriter writer, RetStr obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.depotId)
      ..writeByte(6)
      ..write(obj.brandList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RetStrAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BrandListAdapter extends TypeAdapter<BrandList> {
  @override
  final int typeId = 1;

  @override
  BrandList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BrandList(
      brandRowId: fields[0] as String,
      brandId: fields[1] as String,
      brandName: fields[2] as String,
      brandImage: fields[3] as String,
      itemList: (fields[4] as List).cast<ItemList>(),
    );
  }

  @override
  void write(BinaryWriter writer, BrandList obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.brandRowId)
      ..writeByte(1)
      ..write(obj.brandId)
      ..writeByte(2)
      ..write(obj.brandName)
      ..writeByte(3)
      ..write(obj.brandImage)
      ..writeByte(4)
      ..write(obj.itemList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrandListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemListAdapter extends TypeAdapter<ItemList> {
  @override
  final int typeId = 2;

  @override
  ItemList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemList(
      itemRowId: fields[0] as String,
      itemId: fields[1] as String,
      itemSize: fields[2] as String,
      itemUnit: fields[3] as String,
      itemCode: fields[4] as String,
      itemName: fields[5] as String,
      companyId: fields[6] as String,
      companyName: fields[7] as String,
      brandId: fields[8] as String,
      brandName: fields[9] as String,
      typeId: fields[10] as String,
      typeName: fields[11] as String,
      flavorId: fields[12] as String,
      flavorName: fields[13] as String,
      invoicePrice: fields[14] as String,
      tradePrice: fields[15] as String,
      ctnPcsRatio: fields[16] as String,
      itemCarton: fields[17] as String,
      sequenceNo: fields[18] as String,
      stockCoverDays: fields[19] as String,
      itemVat: fields[20] as String,
      itemAvatar: fields[21] as String,
      itemPromo: fields[22] as String,
      stockQty: fields[23] as String,
      itemChain: fields[24] as String,
      approvedPrice: fields[25] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ItemList obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.itemRowId)
      ..writeByte(1)
      ..write(obj.itemId)
      ..writeByte(2)
      ..write(obj.itemSize)
      ..writeByte(3)
      ..write(obj.itemUnit)
      ..writeByte(4)
      ..write(obj.itemCode)
      ..writeByte(5)
      ..write(obj.itemName)
      ..writeByte(6)
      ..write(obj.companyId)
      ..writeByte(7)
      ..write(obj.companyName)
      ..writeByte(8)
      ..write(obj.brandId)
      ..writeByte(9)
      ..write(obj.brandName)
      ..writeByte(10)
      ..write(obj.typeId)
      ..writeByte(11)
      ..write(obj.typeName)
      ..writeByte(12)
      ..write(obj.flavorId)
      ..writeByte(13)
      ..write(obj.flavorName)
      ..writeByte(14)
      ..write(obj.invoicePrice)
      ..writeByte(15)
      ..write(obj.tradePrice)
      ..writeByte(16)
      ..write(obj.ctnPcsRatio)
      ..writeByte(17)
      ..write(obj.itemCarton)
      ..writeByte(18)
      ..write(obj.sequenceNo)
      ..writeByte(19)
      ..write(obj.stockCoverDays)
      ..writeByte(20)
      ..write(obj.itemVat)
      ..writeByte(21)
      ..write(obj.itemAvatar)
      ..writeByte(22)
      ..write(obj.itemPromo)
      ..writeByte(23)
      ..write(obj.stockQty)
      ..writeByte(24)
      ..write(obj.itemChain)
      ..writeByte(25)
      ..write(obj.approvedPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
