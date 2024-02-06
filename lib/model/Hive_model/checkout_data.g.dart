// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckoutDataModelAdapter extends TypeAdapter<CheckoutDataModel> {
  @override
  final int typeId = 10;

  @override
  CheckoutDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckoutDataModel(
      cid: fields[0] as String,
      userId: fields[1] as String,
      userPass: fields[2] as String,
      deviceId: fields[3] as String,
      clientId: fields[4] as String,
      clientName: fields[5] as String,
      orderDate: fields[6] as String,
      orderTime: fields[7] as String,
      deliveryDate: fields[8] as String,
      deliveryTime: fields[9] as String,
      paymentMode: fields[10] as String,
      latitude: fields[11] as String,
      longitude: fields[12] as String,
      allItem: (fields[13] as List).cast<AllItem>(),
      offer: fields[14] as String,
      rakList: fields[15] as String,
      note: fields[16] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CheckoutDataModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.cid)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.userPass)
      ..writeByte(3)
      ..write(obj.deviceId)
      ..writeByte(4)
      ..write(obj.clientId)
      ..writeByte(5)
      ..write(obj.clientName)
      ..writeByte(6)
      ..write(obj.orderDate)
      ..writeByte(7)
      ..write(obj.orderTime)
      ..writeByte(8)
      ..write(obj.deliveryDate)
      ..writeByte(9)
      ..write(obj.deliveryTime)
      ..writeByte(10)
      ..write(obj.paymentMode)
      ..writeByte(11)
      ..write(obj.latitude)
      ..writeByte(12)
      ..write(obj.longitude)
      ..writeByte(13)
      ..write(obj.allItem)
      ..writeByte(14)
      ..write(obj.offer)
      ..writeByte(15)
      ..write(obj.rakList)
      ..writeByte(16)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckoutDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AllItemAdapter extends TypeAdapter<AllItem> {
  @override
  final int typeId = 11;

  @override
  AllItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllItem(
      itemRowId: fields[0] as String?,
      itemId: fields[1] as String?,
      itemName: fields[5] as String?,
      itemSize: fields[2] as String?,
      itemUnit: fields[3] as String?,
      itemCode: fields[4] as String?,
      companyId: fields[6] as String?,
      companyName: fields[7] as String?,
      brandId: fields[8] as String?,
      brandName: fields[9] as String?,
      typeId: fields[10] as String?,
      typeName: fields[11] as String?,
      flavorId: fields[12] as String?,
      flavorName: fields[13] as String?,
      invoicePrice: fields[14] as String?,
      tradePrice: fields[15] as String?,
      ctnPcsRatio: fields[16] as String?,
      itemCarton: fields[17] as String?,
      sequenceNo: fields[18] as String?,
      stockCoverDays: fields[19] as String?,
      itemVat: fields[20] as String?,
      itemAvatar: fields[21] as String?,
      itemPromo: fields[22] as String?,
      stockQty: fields[23] as String?,
      pcs: fields[30] as String?,
      ctn: fields[25] as String?,
      approvedPrice: fields[27] as String?,
      totalPrice: fields[28] as String?,
      discountInput: fields[29] as String?,
      totalPcs: fields[31] as String?,
    )
      ..qty = fields[24] as String?
      ..itemChain = fields[26] as String?;
  }

  @override
  void write(BinaryWriter writer, AllItem obj) {
    writer
      ..writeByte(32)
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
      ..write(obj.qty)
      ..writeByte(25)
      ..write(obj.ctn)
      ..writeByte(26)
      ..write(obj.itemChain)
      ..writeByte(27)
      ..write(obj.approvedPrice)
      ..writeByte(28)
      ..write(obj.totalPrice)
      ..writeByte(29)
      ..write(obj.discountInput)
      ..writeByte(30)
      ..write(obj.pcs)
      ..writeByte(31)
      ..write(obj.totalPcs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
