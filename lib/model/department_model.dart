import 'dart:convert';
import 'package:patient_app/model/department_model.dart';
DepartmentModel departmentFromJson(dynamic str) =>
    DepartmentModel.fromJson(json.decode(str));

String departmentToJson(DepartmentModel data) =>
    json.encode(data.toJson());
class DepartmentModel {
  bool? status;
  List<Data>? data;
  String? message;

  DepartmentModel({this.status, this.data, this.message});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? departmentId;
  String? departmentCode;
  String? descriptionEng;
  String? descriptionAr;
  String? image;
  int? doctorCount;

  Data(
      {this.departmentId,
        this.departmentCode,
        this.descriptionEng,
        this.descriptionAr,
        this.image,
        this.doctorCount});

  Data.fromJson(Map<String, dynamic> json) {
    departmentId = json['department_id'];
    departmentCode = json['department_code'];
    descriptionEng = json['description_eng'];
    descriptionAr = json['description_ar'];
    image = json['image'];
    doctorCount = json['doctor_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department_id'] = this.departmentId;
    data['department_code'] = this.departmentCode;
    data['description_eng'] = this.descriptionEng;
    data['description_ar'] = this.descriptionAr;
    data['image'] = this.image;
    data['doctor_count'] = this.doctorCount;
    return data;
  }
}
