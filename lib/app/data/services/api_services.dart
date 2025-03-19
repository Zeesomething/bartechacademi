// lib/app/data/services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../sertifikat_response.dart';
import '../training_response.dart';

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000/api'; // Untuk emulator Android
  // Gunakan 'http://localhost:8000/api' untuk simulator iOS
  // Gunakan IP lokal Anda untuk perangkat fisik, misalnya 'http://192.168.1.5:8000/api'

  // Method untuk mengambil data training
  Future<trainingResponse> getTrainings() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/training'),
        // Tambahkan headers jika diperlukan
        // headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        return trainingResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Gagal memuat data training: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error saat mengambil data training: $e');
    }
  }

  // Method untuk mengambil data sertifikat
  Future<sertifikatResponse> getCertificates() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/sertifikat'),
        // Tambahkan headers jika diperlukan
        // headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        return sertifikatResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Gagal memuat data sertifikat: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error saat mengambil data sertifikat: $e');
    }
  }

  // Method untuk mencari sertifikat berdasarkan nomor
  Future<sertifikatResponse> searchCertificate(String certificateNumber) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/certificates/search?nomor=$certificateNumber'),
      );

      if (response.statusCode == 200) {
        return sertifikatResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Sertifikat tidak ditemukan: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error saat mencari sertifikat: $e');
    }
  }
}
