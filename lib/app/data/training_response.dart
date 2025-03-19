// lib/app/data/models/training_response.dart

class trainingResponse {
  bool? success;
  String? message;
  List<TrainingData>? data;
  Meta? meta;

  trainingResponse({this.success, this.message, this.data, this.meta});

  trainingResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TrainingData>[];
      json['data'].forEach((v) {
        data!.add(TrainingData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class TrainingData {
  String? id;
  String? namaTraining;
  String? namaTrainingSertifikat;
  String? tanggalMulai;
  String? tanggalSelesai;
  String? kode;
  int? tahun;
  String? konten;
  String? cover;
  int? masaBerlakuTahun;
  String? templateSertifikat;
  String? createdAt;
  String? updatedAt;
  int? sertifikatCount;
  String? formattedTanggal;

  TrainingData(
      {this.id,
      this.namaTraining,
      this.namaTrainingSertifikat,
      this.tanggalMulai,
      this.tanggalSelesai,
      this.kode,
      this.tahun,
      this.konten,
      this.cover,
      this.masaBerlakuTahun,
      this.templateSertifikat,
      this.createdAt,
      this.updatedAt,
      this.sertifikatCount,
      this.formattedTanggal});

  TrainingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaTraining = json['nama_training'];
    namaTrainingSertifikat = json['nama_training_sertifikat'];
    tanggalMulai = json['tanggal_mulai'];
    tanggalSelesai = json['tanggal_selesai'];
    kode = json['kode'];
    tahun = json['tahun'];
    konten = json['konten'];
    cover = json['cover'];
    masaBerlakuTahun = json['masa_berlaku_tahun'];
    templateSertifikat = json['template_sertifikat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sertifikatCount = json['sertifikat_count'];
    formattedTanggal = json['formatted_tanggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_training'] = this.namaTraining;
    data['nama_training_sertifikat'] = this.namaTrainingSertifikat;
    data['tanggal_mulai'] = this.tanggalMulai;
    data['tanggal_selesai'] = this.tanggalSelesai;
    data['kode'] = this.kode;
    data['tahun'] = this.tahun;
    data['konten'] = this.konten;
    data['cover'] = this.cover;
    data['masa_berlaku_tahun'] = this.masaBerlakuTahun;
    data['template_sertifikat'] = this.templateSertifikat;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['sertifikat_count'] = this.sertifikatCount;
    data['formatted_tanggal'] = this.formattedTanggal;
    return data;
  }
}

class Meta {
  List<int>? years;

  Meta({this.years});

  Meta.fromJson(Map<String, dynamic> json) {
    years = json['years'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['years'] = this.years;
    return data;
  }
}
