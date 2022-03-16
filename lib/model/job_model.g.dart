// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) {
  return JobModel(
    id: json['id'] as int?,
    title: json['title'] as String?,
    pickup: json['pickup'] == null
        ? null
        : PickUpModel.fromJson(json['pickup'] as Map<String, dynamic>),
    drop_off: json['drop_off'] == null
        ? null
        : DropOffModel.fromJson(json['drop_off'] as Map<String, dynamic>),
    date_posted: json['date_posted'] as String?,
    expected_delivery_date: json['expected_delivery_date'] as String?,
  );
}

Map<String, dynamic> _$JobModelToJson(JobModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pickup': instance.pickup,
      'drop_off': instance.drop_off,
      'date_posted': instance.date_posted,
      'expected_delivery_date': instance.expected_delivery_date,
    };
