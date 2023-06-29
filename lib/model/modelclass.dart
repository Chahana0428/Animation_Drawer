import 'package:json_annotation/json_annotation.dart';

part 'modelclass.g.dart';

@JsonSerializable()
class Modelclass {
  Current_bookingsBean? current_bookings;
  List<PackagesBean>? packages;

  Modelclass({this.current_bookings, this.packages});

  factory Modelclass.fromJson(Map<String, dynamic> json) =>
      _$modelclassFromJson(json);

  Map<String, dynamic> toJson() => _$modelclassToJson(this);
}

@JsonSerializable()
class PackagesBean {
  num? id;
  String? package_name;
  num? price;
  String? description;

  PackagesBean({this.id, this.package_name, this.price, this.description});

  factory PackagesBean.fromJson(Map<String, dynamic> json) =>
      _$PackagesBeanFromJson(json);

  Map<String, dynamic> toJson() => _$PackagesBeanToJson(this);
}

@JsonSerializable()
class Current_bookingsBean {
  String? package_label;
  String? from_date;
  String? from_time;
  String? to_date;
  String? to_time;

  Current_bookingsBean(
      {this.package_label,
      this.from_date,
      this.from_time,
      this.to_date,
      this.to_time});

  factory Current_bookingsBean.fromJson(Map<String, dynamic> json) =>
      _$Current_bookingsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Current_bookingsBeanToJson(this);
}
