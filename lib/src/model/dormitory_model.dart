// To parse this JSON data, do
//
//     final apartmentModel = apartmentModelFromJson(jsonString);

import 'dart:convert';

DormitoryModel dormitoryModelFromJson(String str) => DormitoryModel.fromJson(json.decode(str));

String dormitoryModelToJson(DormitoryModel data) => json.encode(data.toJson());

class DormitoryModel {
  DormitoryModel({
    this.dormitorys,
  });

  List<Dormitory> dormitorys;

  factory DormitoryModel.fromJson(Map<String, dynamic> json) => DormitoryModel(
    dormitorys: List<Dormitory>.from(
        json["dormitorys"].map((x) => Dormitory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "dormitorys": List<dynamic>.from(dormitorys.map((x) => x.toJson())),
  };
}

class Dormitory {
  Dormitory({
    this.dmId,
    this.dmName,
    this.dmPrice,
    this.dmLocation,
    this.dmPhone,
    this.dmLimitedroom,
    this.dmFacilities,
    this.dmType,
    this.dmImage,
    this.dmDetail,
  });

  String dmId;
  String dmName;
  String dmPrice;
  String dmLocation;
  String dmPhone;
  String dmLimitedroom;
  String dmFacilities;
  String dmType;
  String dmImage;
  String dmDetail;

  factory Dormitory.fromJson(Map<String, dynamic> json) => Dormitory(
    dmId: json["dm_id"],
    dmName: json["dm_name"],
    dmPrice: json["dm_price"],
    dmLocation: json["dm_location"],
    dmPhone: json["dm_phone"],
    dmLimitedroom: json["dm_limitedroom"],
    dmFacilities: json["dm_facilities"],
    dmType: json["dm_type"],
    dmImage: json["dm_image"],
    dmDetail: json["dm_detail"],
  );

  Map<String, dynamic> toJson() => {
    "dm_id": dmId,
    "dm_name": dmName,
    "dm_price": dmPrice,
    "dm_location": dmLocation,
    "dm_phone": dmPhone,
    "dm_limitedroom": dmLimitedroom,
    "dm_facilities": dmFacilities,
    "dm_type": dmType,
    "dm_image": dmImage,
    "dm_detail": dmDetail,
  };
}
