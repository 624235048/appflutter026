// To parse this JSON data, do
//
//     final apartmentModel = apartmentModelFromJson(jsonString);

import 'dart:convert';

MansionModel mansionModelFromJson(String str) =>
    MansionModel.fromJson(json.decode(str));

String mansionModelToJson(MansionModel data) => json.encode(data.toJson());

class MansionModel {
  MansionModel({
    this.mansions,
  });

  List<Mansion> mansions;

  factory MansionModel.fromJson(Map<String, dynamic> json) => MansionModel(
        mansions: List<Mansion>.from(
            json["mansions"].map((x) => Mansion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mansions": List<dynamic>.from(mansions.map((x) => x.toJson())),
      };
}

class Mansion {
  Mansion({
    this.msId,
    this.msName,
    this.msPrice,
    this.msLocation,
    this.msPhone,
    this.msLimitedroom,
    this.msFacilities,
    this.msType,
    this.msImage,
    this.msDetail,
  });

  String msId;
  String msName;
  String msPrice;
  String msLocation;
  String msPhone;
  String msLimitedroom;
  String msFacilities;
  String msType;
  String msImage;
  String msDetail;

  factory Mansion.fromJson(Map<String, dynamic> json) => Mansion(
        msId: json["ms_id"],
        msName: json["ms_name"],
        msPrice: json["ms_price"],
        msLocation: json["ms_location"],
        msPhone: json["ms_phone"],
        msLimitedroom: json["ms_limitedroom"],
        msFacilities: json["ms_facilities"],
        msType: json["ms_type"],
        msImage: json["ms_image"],
        msDetail: json["ms_detail"],
      );

  Map<String, dynamic> toJson() => {
        "ms_id": msId,
        "ms_name": msName,
        "ms_price": msPrice,
        "ms_location": msLocation,
        "ms_phone": msPhone,
        "ms_limitedroom": msLimitedroom,
        "ms_facilities": msFacilities,
        "ms_type": msType,
        "ms_image": msImage,
        "ms_detail": msDetail,
      };
}
