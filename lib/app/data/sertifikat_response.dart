// lib/app/data/models/sertifikat_response.dart

class sertifikatResponse {
  bool? success;
  String? message;
  List<SertifikatData>? data;

  sertifikatResponse({this.success, this.message, this.data});

  sertifikatResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SertifikatData>[];
      json['data'].forEach((v) {
        data!.add(SertifikatData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SertifikatData {
  String? id;
  String? namaPenerima;
  String? idTraining;
  String? email;
  int? status;
  String? nomorSertifikat;
  String? createdAt;
  String? updatedAt;

  SertifikatData(
      {this.id,
      this.namaPenerima,
      this.idTraining,
      this.email,
      this.status,
      this.nomorSertifikat,
      this.createdAt,
      this.updatedAt});

  SertifikatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPenerima = json['nama_penerima'];
    idTraining = json['id_training'];
    email = json['email'];
    status = json['status'];
    nomorSertifikat = json['nomor_sertifikat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_penerima'] = this.namaPenerima;
    data['id_training'] = this.idTraining;
    data['email'] = this.email;
    data['status'] = this.status;
    data['nomor_sertifikat'] = this.nomorSertifikat;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
