// To parse this JSON data, do
//
//     final codesModel = codesModelFromJson(jsonString);

import 'dart:convert';

CodesModel codesModelFromJson(dynamic str) => CodesModel.fromJson(str);

String codesModelToJson(CodesModel data) => json.encode(data.toJson());

class CodesModel {
    CodesModel({
        required this.status,
        required this.massage,
        required this.data,
    });

    int status;
    String massage;
    List<Datum> data;

    factory CodesModel.fromJson(Map<String, dynamic> json) => CodesModel(
        status: json["status"],
        massage: json["massage"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "massage": massage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.code,
        required this.createdAt,
        required this.updatedAt,
        required this.scannerId,
    });

    int id;
    String code;
    DateTime createdAt;
    DateTime updatedAt;
    String scannerId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        code: json["code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        scannerId: json["scanner_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "scanner_id": scannerId,
    };
}
