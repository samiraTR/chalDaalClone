// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StockReturnListAdapter extends TypeAdapter<StockReturnList> {
  @override
  final int typeId = 17;

  @override
  StockReturnList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StockReturnList(
      cid: fields[0] as String,
      userId: fields[1] as String,
      userName: fields[2] as String,
      userMobile: fields[3] as String,
      userType: fields[4] as String,
      depotId: fields[5] as String,
      brandListStock: (fields[6] as List).cast<BrandListStock>(),
    );
  }

  @override
  void write(BinaryWriter writer, StockReturnList obj) {
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
      ..write(obj.brandListStock);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockReturnListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BrandListStockAdapter extends TypeAdapter<BrandListStock> {
  @override
  final int typeId = 18;

  @override
  BrandListStock read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BrandListStock(
      brandRowId: fields[0] as String,
      brandId: fields[1] as String,
      brandName: fields[2] as String,
      itemListStock: (fields[3] as List).cast<ItemListStock>(),
    );
  }

  @override
  void write(BinaryWriter writer, BrandListStock obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.brandRowId)
      ..writeByte(1)
      ..write(obj.brandId)
      ..writeByte(2)
      ..write(obj.brandName)
      ..writeByte(3)
      ..write(obj.itemListStock);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrandListStockAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemListStockAdapter extends TypeAdapter<ItemListStock> {
  @override
  final int typeId = 19;

  @override
  ItemListStock read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemListStock(
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
      itemChain: fields[18] as String,
      sequenceNo: fields[19] as String,
      stockCoverDays: fields[20] as String,
      itemVat: fields[21] as String,
      stockQty: fields[22] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ItemListStock obj) {
    writer
      ..writeByte(23)
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
      ..write(obj.itemChain)
      ..writeByte(19)
      ..write(obj.sequenceNo)
      ..writeByte(20)
      ..write(obj.stockCoverDays)
      ..writeByte(21)
      ..write(obj.itemVat)
      ..writeByte(22)
      ..write(obj.stockQty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemListStockAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
