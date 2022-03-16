// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickUpModel _$PickUpModelFromJson(Map<String, dynamic> json) {
  return PickUpModel(
    address_line_1: json['address_line_1'] as String?,
    postcode: json['postcode'] as String?,
  );
}

Map<String, dynamic> _$PickUpModelToJson(PickUpModel instance) =>
    <String, dynamic>{
      'address_line_1': instance.address_line_1,
      'postcode': instance.postcode,
    };
