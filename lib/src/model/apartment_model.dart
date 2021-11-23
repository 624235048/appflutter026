// To parse this JSON data, do
//
//     final apartmentModel = apartmentModelFromJson(jsonString);

import 'dart:convert';

ApartmentModel apartmentModelFromJson(String str) =>
    ApartmentModel.fromJson(json.decode(str));

String apartmentModelToJson(ApartmentModel data) => json.encode(data.toJson());

class ApartmentModel {
  ApartmentModel({
    this.apartments,
  });

  List<Apartment> apartments;

  factory ApartmentModel.fromJson(Map<String, dynamic> json) => ApartmentModel(
        apartments: List<Apartment>.from(
            json["apartments"].map((x) => Apartment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "apartments": List<dynamic>.from(apartments.map((x) => x.toJson())),
      };
}

class Apartment {
  Apartment({
    this.apmId,
    this.apmName,
    this.apmPrice,
    this.apmLocation,
    this.apmPhone,
    this.apmLimitedroom,
    this.apmFacilities,
    this.apmType,
    this.apmImage,
    this.apmDetail,
  });

  String apmId;
  String apmName;
  String apmPrice;
  String apmLocation;
  String apmPhone;
  String apmLimitedroom;
  String apmFacilities;
  String apmType;
  String apmImage;
  String apmDetail;

  factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
        apmId: json["apm_id"],
        apmName: json["apm_name"],
        apmPrice: json["apm_price"],
        apmLocation: json["apm_location"],
        apmPhone: json["apm_phone"],
        apmLimitedroom: json["apm_limitedroom"],
        apmFacilities: json["apm_facilities"],
        apmType: json["apm_type"],
        apmImage: json["apm_image"],
        apmDetail: json["apm_detail"],
      );

  Map<String, dynamic> toJson() => {
        "apm_id": apmId,
        "apm_name": apmName,
        "apm_price": apmPrice,
        "apm_location": apmLocation,
        "apm_phone": apmPhone,
        "apm_limitedroom": apmLimitedroom,
        "apm_facilities": apmFacilities,
        "apm_type": apmType,
        "apm_image": apmImage,
        "apm_detail": apmDetail,
      };
}
