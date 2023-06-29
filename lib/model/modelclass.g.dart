// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelclass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Modelclass _$modelclassFromJson(Map<String, dynamic> json) => Modelclass(
      current_bookings: Current_bookingsBean.fromJson(
          json['current_bookings'] as Map<String, dynamic>),
      packages: (json['packages'] as List<dynamic>)
          .map((e) => PackagesBean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$modelclassToJson(Modelclass instance) =>
    <String, dynamic>{
      'current_bookings': instance.current_bookings,
      'packages': instance.packages,
    };

PackagesBean _$PackagesBeanFromJson(Map<String, dynamic> json) => PackagesBean(
      id: json['id'] as num,
      package_name: json['package_name'] as String,
      price: json['price'] as num,
      description: json['description'] as String,
    );

Map<String, dynamic> _$PackagesBeanToJson(PackagesBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'package_name': instance.package_name,
      'price': instance.price,
      'description': instance.description,
    };

Current_bookingsBean _$Current_bookingsBeanFromJson(
        Map<String, dynamic> json) =>
    Current_bookingsBean(
      package_label: json['package_label'] as String,
      from_date: json['from_date'] as String,
      from_time: json['from_time'] as String,
      to_date: json['to_date'] as String,
      to_time: json['to_time'] as String,
    );

Map<String, dynamic> _$Current_bookingsBeanToJson(
        Current_bookingsBean instance) =>
    <String, dynamic>{
      'package_label': instance.package_label,
      'from_date': instance.from_date,
      'from_time': instance.from_time,
      'to_date': instance.to_date,
      'to_time': instance.to_time,
    };
