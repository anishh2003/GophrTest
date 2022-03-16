import 'package:gophr/model/drop_off_model.dart';
import 'package:gophr/model/pickup_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'job_model.g.dart';

@JsonSerializable()
class JobModel {
  int? id;
  String? title;
  PickUpModel? pickup;
  DropOffModel? drop_off;
  String? date_posted;
  String? expected_delivery_date;

  JobModel({
    this.id,
    this.title,
    this.pickup,
    this.drop_off,
    this.date_posted,
    this.expected_delivery_date,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => _$JobModelFromJson(json);
  Map<String, dynamic> toJson() => _$JobModelToJson(this);
}
