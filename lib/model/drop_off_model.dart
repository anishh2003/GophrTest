import 'package:json_annotation/json_annotation.dart';
part 'drop_off_model.g.dart';

@JsonSerializable()
class DropOffModel {
  String? address_line_1;
  String? postcode;

  DropOffModel({
    this.address_line_1,
    this.postcode,
  });

  factory DropOffModel.fromJson(Map<String, dynamic> json) => _$DropOffModelFromJson(json);
  Map<String, dynamic> toJson() => _$DropOffModelToJson(this);
}
