// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_off_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DropOffModel _$DropOffModelFromJson(Map<String, dynamic> json) {
  return DropOffModel(
    address_line_1: json['address_line_1'] as String?,
    postcode: json['postcode'] as String?,
  );
}

Map<String, dynamic> _$DropOffModelToJson(DropOffModel instance) =>
    <String, dynamic>{
      'address_line_1': instance.address_line_1,
      'postcode': instance.postcode,
    };
