import 'package:json_annotation/json_annotation.dart';
part 'pickup_model.g.dart';

@JsonSerializable()
class PickUpModel {
  String? address_line_1;
  String? postcode;

  PickUpModel({
    this.address_line_1,
    this.postcode,
  });

  factory PickUpModel.fromJson(Map<String, dynamic> json) => _$PickUpModelFromJson(json);
  Map<String, dynamic> toJson() => _$PickUpModelToJson(this);
}
